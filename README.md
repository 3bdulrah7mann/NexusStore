# NexusStore

A modern Flutter e-commerce application for browsing products, managing a wishlist and cart, and completing checkout.

## Features

- Product catalog and product details
- Cart and checkout flow
- Wishlist management
- Light and dark themes
- State management with Provider

## Getting started

### Requirements

- Flutter SDK (Dart SDK `^3.12.2`)

### Run locally

```bash
flutter pub get
flutter run
```

## Build an Android APK

```bash
flutter build apk --release
```

The generated APK is copied to `build/apk/` as `NexusStore-release.apk`.

## Project structure

- `lib/models` — app data models
- `lib/providers` — application state
- `lib/views` — screens and tabs
- `lib/widgets` — reusable UI components
- `assets/` — product images and app assets
