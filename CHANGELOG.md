# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

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
