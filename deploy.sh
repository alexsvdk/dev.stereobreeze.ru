#!/bin/bash
set -e

echo "🏗️  Building project..."
npm run build

echo "📦 Deploying to Yandex Cloud S3..."

# Static assets with long cache (CSS, JS, images, fonts)
echo "  📄 Uploading static assets with long cache..."
aws s3 sync dist/ s3://dev-stereobreeze-ru \
  --profile yandex \
  --endpoint-url https://storage.yandexcloud.net \
  --cache-control "public, max-age=31536000, immutable" \
  --exclude "*.html" \
  --exclude "*.json" \
  --delete

# HTML files with no-cache
echo "  📝 Uploading HTML files with no-cache..."
aws s3 sync dist/ s3://dev-stereobreeze-ru \
  --profile yandex \
  --endpoint-url https://storage.yandexcloud.net \
  --cache-control "public, max-age=0, must-revalidate" \
  --exclude "*" \
  --include "*.html" \
  --delete

# JSON files with short cache (language files)
echo "  🌐 Uploading JSON files with 1-hour cache..."
aws s3 sync dist/ s3://dev-stereobreeze-ru \
  --profile yandex \
  --endpoint-url https://storage.yandexcloud.net \
  --cache-control "public, max-age=3600" \
  --exclude "*" \
  --include "*.json" \
  --delete

echo "✅ Deployment complete!"
echo "🌐 Site: https://dev.stereobreeze.ru"
echo ""
echo "Next steps:"
echo "  1. Check website: https://dev.stereobreeze.ru"
echo "  2. Test language switching (RU/EN)"
echo "  3. Test overtime modal"
echo "  4. Run Lighthouse audit"
