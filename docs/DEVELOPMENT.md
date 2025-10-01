# Development Guide

## Project Structure

This project follows Clean Architecture principles with feature-based organization.

## Getting Started

### Environment Setup
1. Install Flutter SDK (>=3.13.0)
2. Install Firebase CLI
3. Install VS Code with Flutter extension

### Local Development
Clone repository
git clone https://github.com/YOUR_USERNAME/sheconomy-app.git
cd sheconomy-app

Install dependencies
flutter pub get

Run app
flutter run

## Code Style

- Follow Dart/Flutter official style guide
- Use meaningful variable and function names
- Implement proper error handling
- Write tests for all business logic

## Git Workflow

- `main` - Production ready code
- `develop` - Integration branch  
- `feature/*` - Feature development
- `hotfix/*` - Critical fixes

## Testing

Unit tests
flutter test

Integration tests
flutter test integration_test/
undefined
