part of './../mayr_storage.dart';

/// Storage implementation using EncryptedSharedPreferences.
///
/// Provides encrypted, asynchronous storage for sensitive data.
/// Data is encrypted at rest using AES encryption, making it suitable
/// for storing tokens, passwords, and other confidential information.
///
/// Supported types: [String], [int], [double], [bool]
class EncryptSharedPreferencesStorage<ValueT>
    extends PreferencesStorage<ValueT> {
  final String _preferenceKey;

  /// Creates an encrypted storage handler for the given key.
  EncryptSharedPreferencesStorage(this._preferenceKey);

  @override
  Future<ValueT?> read() async {
    final EncryptedSharedPreferences securePref =
        EncryptedSharedPreferences.getInstance();

    // Type-safe retrieval based on generic type
    if (ValueT == bool) {
      return securePref.getBool(_preferenceKey) as ValueT?;
    } else if (ValueT == String) {
      return securePref.getString(_preferenceKey) as ValueT?;
    } else if (ValueT == int) {
      return securePref.getInt(_preferenceKey) as ValueT?;
    } else if (ValueT == double) {
      return securePref.getDouble(_preferenceKey) as ValueT?;
    } else {
      throw UnsupportedError(
          'Type $ValueT is not supported. Only String, int, double, and bool are supported.');
    }
  }

  @override
  Future<void> write(ValueT? value) async {
    final EncryptedSharedPreferences securePref =
        EncryptedSharedPreferences.getInstance();

    // Delete the key if value is null
    if (value == null) {
      await securePref.remove(_preferenceKey);
    } else if (ValueT == bool) {
      await securePref.setBool(_preferenceKey, value as bool);
    } else if (ValueT == String) {
      await securePref.setString(_preferenceKey, value as String);
    } else if (ValueT == int) {
      await securePref.setInt(_preferenceKey, value as int);
    } else if (ValueT == double) {
      await securePref.setDouble(_preferenceKey, value as double);
    } else {
      throw UnsupportedError(
          'Type $ValueT is not supported. Only String, int, double, and bool are supported.');
    }
  }
}
