# Favicon Generation Note

The following PNG favicon files need to be generated from favicon.svg:

- favicon-16x16.png (16x16 pixels)
- favicon-32x32.png (32x32 pixels)
- apple-touch-icon.png (180x180 pixels)
- android-chrome-192x192.png (192x192 pixels)
- android-chrome-512x512.png (512x512 pixels)

You can generate these using:
1. Online tool: https://realfavicongenerator.net/
2. Or ImageMagick/rsvg-convert locally

For now, the SVG favicon will work in modern browsers.
PNG versions should be added before production deployment.
