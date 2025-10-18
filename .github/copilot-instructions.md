# GitHub Copilot Instructions for Mayr Flutter Storage

## Project Overview
This is a Flutter package that provides a unified storage API for SharedPreferences, EncryptedSharedPreferences, and GetStorage. The package is maintained by **MayR Labs**.

### Organization Details
- **Organization**: MayR Labs
- **GitHub**: https://github.com/MayR-Labs
- **Website**: https://mayrlabs.com
- **Repository**: https://github.com/MayR-Labs/flutter_storage

## Code Style & Conventions

### General Guidelines
- Follow official [Dart style guide](https://dart.dev/guides/language/effective-dart/style)
- Use `flutter_lints` for code analysis
- Keep code DRY (Don't Repeat Yourself)
- Write clear, self-documenting code with meaningful variable names
- Add comprehensive documentation comments for all public APIs

### Documentation
- Use triple-slash (`///`) comments for public APIs
- Include examples in documentation when appropriate
- Document all parameters, return types, and exceptions
- Follow Dart documentation conventions:
  ```dart
  /// Brief one-line description.
  ///
  /// Detailed explanation if needed.
  ///
  /// Example:
  /// ```dart
  /// final value = await key.read();
  /// ```
  ```

### Naming Conventions
- **Classes**: PascalCase (e.g., `MayrStorage`, `SharedPreferencesStorage`)
- **Methods/Functions**: camelCase (e.g., `read()`, `write()`, `delete()`)
- **Variables**: camelCase (e.g., `userName`, `storageKey`)
- **Constants**: lowerCamelCase for const values (e.g., `defaultValue`)
- **Private members**: Prefix with underscore (e.g., `_internalMethod`)

### File Organization
- Place source files in `lib/src/`
- Export public APIs through `lib/mayr_storage.dart`
- Keep related functionality in separate files:
  - Storage implementations in `lib/src/drivers/`
  - Extensions in `lib/src/extension.dart`
  - Abstract classes in `lib/src/drivers/abstract/`

## Architecture Patterns

### Storage Implementation
- All storage drivers extend `PreferencesStorage<T>`
- Support generic types for type safety
- Implement async operations (Future-based)
- Handle null values appropriately (null = delete)

### Extension Pattern
- Use extensions to add storage capabilities to String keys
- Chain methods for clean API (e.g., `'KEY'.storage<String>()`)
- Support multiple storage backends through different extensions

### Error Handling
- Use `UnsupportedError` for unsupported operations
- Throw meaningful exceptions with clear messages
- Document exceptions in method documentation

## Testing Standards

### Test Structure
- Place tests in `test/` directory
- Mirror source file structure in test files
- Use descriptive test names: `test('should do something when condition')`
- Group related tests with `group()`

### Test Coverage
- Write tests for all public APIs
- Test edge cases and error conditions
- Test with various data types (String, int, double, bool, List)
- Mock external dependencies when needed

### Test Example Pattern
```dart
group('StorageClass', () {
  setUp(() {
    // Initialize test environment
  });

  test('should return expected value when reading valid key', () async {
    // Arrange
    // Act
    // Assert
  });

  tearDown(() {
    // Clean up
  });
});
```

## Package-Specific Guidelines

### Storage Keys
- Define storage keys as static finals in a dedicated class
- Use meaningful prefixes (e.g., `SK_` for Storage Key)
- Keep keys organized by feature/domain

### Type Safety
- Always specify generic types for storage operations
- Support common types: String, int, double, bool, List<String>
- Document supported types in README

### Initialization
- Require explicit initialization via `MayrStorage.init()`
- Document initialization requirement prominently
- Call `WidgetsFlutterBinding.ensureInitialized()` before init

### API Consistency
- Maintain consistent API across all storage backends
- `read()` returns `Future<T?>`
- `write(T? value)` returns `Future<void>` (null = delete)
- `delete()` returns `Future<void>`

## Dependencies

### Production Dependencies
- `shared_preferences`: For basic key-value storage
- `encrypt_shared_preferences`: For encrypted storage
- `get_storage`: For fast key-value storage

### Development Dependencies
- `flutter_test`: Testing framework
- `flutter_lints`: Linting rules
- `faker`: Test data generation
- `path_provider_platform_interface`: For test mocking

## Version Management

### Semantic Versioning
- Follow [Semantic Versioning 2.0.0](https://semver.org/)
- MAJOR: Breaking changes
- MINOR: New features (backward compatible)
- PATCH: Bug fixes

### Changelog
- Update `CHANGELOG.md` for all changes
- Follow [Keep a Changelog](https://keepachangelog.com/) format
- Categories: Added, Changed, Deprecated, Removed, Fixed, Security

## Publishing Guidelines

### Pre-publish Checklist
- [ ] Update version in `pubspec.yaml`
- [ ] Update `CHANGELOG.md`
- [ ] Run tests: `flutter test`
- [ ] Check analysis: `flutter analyze`
- [ ] Format code: `dart format .`
- [ ] Verify documentation: `dart doc`
- [ ] Test example code
- [ ] Update README if needed

### Pub.dev Requirements
- Maintain pub.dev score above 130
- Include comprehensive README with examples
- Provide API documentation
- License: MIT
- Support latest stable Flutter SDK

## Common Tasks

### Adding a New Storage Backend
1. Create new class in `lib/src/drivers/`
2. Extend `PreferencesStorage<T>`
3. Implement required methods: `read()`, `write()`, `delete()`
4. Add extension method in `lib/src/extension.dart`
5. Export through `lib/mayr_storage.dart`
6. Write tests in `test/`
7. Update README with usage example

### Fixing Bugs
1. Write a failing test that reproduces the bug
2. Fix the bug
3. Ensure test passes
4. Update CHANGELOG.md
5. Consider if this affects breaking changes

### Adding Features
1. Discuss design in issues/PRs
2. Update documentation first (TDD for docs)
3. Implement feature with tests
4. Update README and examples
5. Update CHANGELOG.md

## CI/CD

### GitHub Actions
- Automated testing on push/PR
- Automated publishing to pub.dev
- Run on multiple Flutter versions
- Check code formatting and analysis

### Quality Gates
- All tests must pass
- No analysis errors or warnings
- Code coverage should remain high
- Documentation must be complete

## Best Practices

### Performance
- Minimize async operations where possible
- Cache storage instances
- Avoid unnecessary reads/writes
- Use GetStorage for high-frequency operations

### Security
- Use EncryptedSharedPreferences for sensitive data
- Never log sensitive information
- Document security considerations

### Maintenance
- Keep dependencies up to date
- Monitor pub.dev health score
- Respond to issues promptly
- Review and update documentation regularly

## Contact & Support

For questions or contributions, please:
- Open an issue on GitHub
- Check existing documentation
- Follow contribution guidelines
- Tag maintainers for urgent matters

---

*This package is maintained with ❤️ by MayR Labs*
