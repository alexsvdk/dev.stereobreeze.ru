# Deployment Guide - Yandex Cloud S3

## Prerequisites

1. Yandex Cloud account
2. Yandex CLI installed (`yc`)
3. S3 bucket created
4. Service account with `storage.editor` role

## Step 1: Build the Project

```bash
npm run build
```

This creates an optimized production build in the `dist/` directory.

## Step 2: Configure Yandex Cloud CLI

```bash
# Initialize Yandex Cloud CLI
yc init

# Create service account (if not exists)
yc iam service-account create --name portfolio-deployer

# Assign storage.editor role
yc resource-manager folder add-access-binding <FOLDER_ID> \
  --role storage.editor \
  --subject serviceAccount:<SERVICE_ACCOUNT_ID>

# Create static access keys
yc iam access-key create --service-account-name portfolio-deployer
```

Save the `key_id` and `secret` for S3 configuration.

## Step 3: Create S3 Bucket

```bash
# Create bucket
yc storage bucket create \
  --name dev-stereobreeze-ru \
  --default-storage-class standard \
  --max-size 1073741824

# Configure bucket for static website hosting
yc storage bucket update \
  --name dev-stereobreeze-ru \
  --website-settings '{
    "index": "index.html",
    "error": "index.html"
  }'

# Make bucket public
yc storage bucket update \
  --name dev-stereobreeze-ru \
  --public-read
```

## Step 4: Configure AWS CLI for Yandex S3

Yandex Cloud S3 is compatible with AWS S3 API.

```bash
# Install AWS CLI if needed
pip install awscli

# Configure AWS CLI for Yandex Cloud
aws configure
# AWS Access Key ID: <key_id from Step 2>
# AWS Secret Access Key: <secret from Step 2>
# Default region name: ru-central1
# Default output format: json

# Set Yandex S3 endpoint
export AWS_ENDPOINT_URL=https://storage.yandexcloud.net
```

Or create `~/.aws/config`:

```ini
[profile yandex]
region = ru-central1
output = json
endpoint_url = https://storage.yandexcloud.net
```

## Step 5: Deploy to S3

```bash
# Sync dist folder to S3 bucket
aws s3 sync dist/ s3://dev-stereobreeze-ru \
  --profile yandex \
  --endpoint-url https://storage.yandexcloud.net \
  --cache-control "public, max-age=31536000" \
  --exclude "*.html" \
  --exclude "*.json"

# Upload HTML files with no-cache
aws s3 sync dist/ s3://dev-stereobreeze-ru \
  --profile yandex \
  --endpoint-url https://storage.yandexcloud.net \
  --cache-control "public, max-age=0, must-revalidate" \
  --exclude "*" \
  --include "*.html"

# Upload JSON files with 1 hour cache
aws s3 sync dist/ s3://dev-stereobreeze-ru \
  --profile yandex \
  --endpoint-url https://storage.yandexcloud.net \
  --cache-control "public, max-age=3600" \
  --exclude "*" \
  --include "*.json"
```

## Step 6: Configure Custom Domain

1. Go to Yandex Cloud Console → Object Storage → Buckets
2. Select `dev-stereobreeze-ru`
3. Go to "HTTPS" tab
4. Add domain: `dev.stereobreeze.ru`
5. Follow instructions to verify domain ownership
6. Certificate will be issued automatically via Let's Encrypt

### DNS Configuration

Add CNAME record in your DNS:

```
dev.stereobreeze.ru → dev-stereobreeze-ru.website.yandexcloud.net
```

## Step 7: Enable CDN (Optional but Recommended)

```bash
# Create CDN resource
yc cdn resource create \
  --cname dev.stereobreeze.ru \
  --origin-custom-source dev-stereobreeze-ru.website.yandexcloud.net:443 \
  --origin-protocol https \
  --cert-manager-ssl-cert-id <CERT_ID>
```

Update DNS to point to CDN:

```
dev.stereobreeze.ru → <CDN_CNAME>
```

## Automated Deployment Script

Create `deploy.sh`:

```bash
#!/bin/bash
set -e

echo "🏗️  Building project..."
npm run build

echo "📦 Deploying to Yandex Cloud S3..."

# Static assets with long cache
aws s3 sync dist/ s3://dev-stereobreeze-ru \
  --profile yandex \
  --endpoint-url https://storage.yandexcloud.net \
  --cache-control "public, max-age=31536000, immutable" \
  --exclude "*.html" \
  --exclude "*.json" \
  --delete

# HTML files with no-cache
aws s3 sync dist/ s3://dev-stereobreeze-ru \
  --profile yandex \
  --endpoint-url https://storage.yandexcloud.net \
  --cache-control "public, max-age=0, must-revalidate" \
  --exclude "*" \
  --include "*.html" \
  --delete

# JSON files with short cache
aws s3 sync dist/ s3://dev-stereobreeze-ru \
  --profile yandex \
  --endpoint-url https://storage.yandexcloud.net \
  --cache-control "public, max-age=3600" \
  --exclude "*" \
  --include "*.json" \
  --delete

echo "✅ Deployment complete!"
echo "🌐 Site: https://dev.stereobreeze.ru"
```

Make executable:

```bash
chmod +x deploy.sh
```

## GitHub Actions CI/CD (Optional)

Create `.github/workflows/deploy.yml`:

```yaml
name: Deploy to Yandex Cloud

on:
  push:
    branches: [main]

jobs:
  deploy:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v3
      
      - name: Setup Node.js
        uses: actions/setup-node@v3
        with:
          node-version: '20'
          cache: 'npm'
      
      - name: Install dependencies
        run: npm ci
      
      - name: Build
        run: npm run build
      
      - name: Configure AWS CLI
        uses: aws-actions/configure-aws-credentials@v2
        with:
          aws-access-key-id: ${{ secrets.YC_ACCESS_KEY_ID }}
          aws-secret-access-key: ${{ secrets.YC_SECRET_ACCESS_KEY }}
          aws-region: ru-central1
      
      - name: Deploy to S3
        run: |
          aws s3 sync dist/ s3://dev-stereobreeze-ru \
            --endpoint-url https://storage.yandexcloud.net \
            --cache-control "public, max-age=31536000" \
            --exclude "*.html" \
            --exclude "*.json" \
            --delete
          
          aws s3 sync dist/ s3://dev-stereobreeze-ru \
            --endpoint-url https://storage.yandexcloud.net \
            --cache-control "public, max-age=0, must-revalidate" \
            --exclude "*" \
            --include "*.html" \
            --delete
```

Add secrets to GitHub repository:
- `YC_ACCESS_KEY_ID`
- `YC_SECRET_ACCESS_KEY`

## Verification

After deployment:

1. Check website: https://dev.stereobreeze.ru
2. Test HTTPS certificate
3. Verify cache headers (browser DevTools)
4. Run Lighthouse audit
5. Test language switching
6. Test overtime modal with Spotify embed

## Rollback

If needed to rollback:

```bash
# List object versions
aws s3api list-object-versions \
  --bucket dev-stereobreeze-ru \
  --endpoint-url https://storage.yandexcloud.net

# Restore previous version (if versioning enabled)
aws s3api copy-object \
  --bucket dev-stereobreeze-ru \
  --copy-source dev-stereobreeze-ru/index.html?versionId=<VERSION_ID> \
  --key index.html \
  --endpoint-url https://storage.yandexcloud.net
```

## Cost Estimation

Yandex Cloud S3 pricing (as of 2025):
- Storage: ~₽1.50 per GB/month
- GET requests: ~₽0.40 per 10,000 requests
- Outgoing traffic: ~₽1.50 per GB (after free 100 GB)

Expected monthly cost for this portfolio:
- Storage: ~500 MB → ~₽0.75
- Requests: ~10,000/month → ~₽0.40
- Traffic: ~5 GB → Free (within 100 GB)

**Total: ~₽1-2 per month** 💰

## Troubleshooting

### Issue: Access Denied
- Check bucket policy
- Verify service account permissions
- Ensure bucket is public-read

### Issue: SSL Certificate Not Working
- Verify domain ownership
- Wait for certificate issuance (can take up to 30 minutes)
- Check DNS propagation

### Issue: Old Content Cached
- Clear CloudFlare/CDN cache if using
- Check cache-control headers
- Hard refresh browser (Ctrl+Shift+R)

## Support

- Yandex Cloud Docs: https://cloud.yandex.ru/docs/storage/
- Yandex Cloud Support: https://console.cloud.yandex.ru/support
