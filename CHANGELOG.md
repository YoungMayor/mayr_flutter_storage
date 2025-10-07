# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

---

## [1.0.0] - 2025-10-07

### Added
- Automatic publishing workflow to pub.dev via GitHub Actions
- Comprehensive documentation comments for all public APIs
- Better error messages with `UnsupportedError` instead of generic `Exception`

### Changed
- Fixed bug where `write(null)` was calling `clear()` instead of `remove()` in SharedPreferences
- Fixed bug where `write(null)` was calling `clear()` instead of `remove()` in EncryptedSharedPreferences
- Improved code organization and readability
- Enhanced documentation with detailed examples and use cases
- Made storage operations more explicit with better type safety
- Updated all class and method documentation following Dart documentation conventions

### Fixed
- SharedPreferences now properly uses `remove()` for deleting specific keys instead of `clear()`
- EncryptedSharedPreferences now properly uses `remove()` for deleting specific keys instead of `clear()`

---

## [0.1.1] - Documentation update

### Added
- Documented methods
- `.pubignore` to certain parts

---

## [0.1.0] - Initial Release

### Added
- Initial release of `mayr_storage` 🎉
- Introduced `.storage()` extension for using SharedPreferences easily.
- Introduced `.secureStorage()` extension for using EncryptedSharedPreferences for sensitive data.
- Introduced `.boxStorage()` extension for using GetStorage for lightweight storage.
- Provided easy-to-use API:
  - .read()
  - .write()
  - .delete()
- Added support for both synchronous and asynchronous operations after initialisation.
- Created MayrStorage.initialize() for safe storage setup at app startup.

---
