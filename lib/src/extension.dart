part of './mayr_storage.dart';

/// Extension on String to provide convenient storage accessors.
///
/// This extension allows any string to be converted into a storage handler
/// by treating the string as a storage key.
extension KeyStorageExtensions on String {
  /// Creates a GetBox storage handler for the given key.
  ///
  /// Box storage provides synchronous, lightweight key-value storage
  /// ideal for caching and frequently accessed data.
  ///
  /// Example:
  /// ```dart
  /// final storage = 'MY_KEY'.boxStorage<String>();
  /// storage.write('value');
  /// final value = storage.read();
  /// ```
  GetBoxStorage<ValueT> boxStorage<ValueT>() => GetBoxStorage<ValueT>(this);

  /// Creates a secure storage handler using Encrypted Shared Preferences.
  ///
  /// Secure storage encrypts data at rest, making it suitable for
  /// sensitive information like tokens, passwords, and user credentials.
  ///
  /// Example:
  /// ```dart
  /// final storage = 'AUTH_TOKEN'.secureStorage<String>();
  /// await storage.write('secret_token');
  /// final token = await storage.read();
  /// ```
  EncryptSharedPreferencesStorage<ValueT> secureStorage<ValueT>() =>
      EncryptSharedPreferencesStorage<ValueT>(this);

  /// Creates a standard Shared Preferences storage handler.
  ///
  /// Standard storage is suitable for non-sensitive configuration data,
  /// user preferences, and application settings.
  ///
  /// Example:
  /// ```dart
  /// final storage = 'USER_THEME'.storage<String>();
  /// await storage.write('dark');
  /// final theme = await storage.read();
  /// ```
  SharedPreferencesStorage<ValueT> storage<ValueT>() =>
      SharedPreferencesStorage<ValueT>(this);
}
