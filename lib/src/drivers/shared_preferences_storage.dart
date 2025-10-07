part of '../mayr_storage.dart';

/// Storage implementation using Flutter's SharedPreferences.
///
/// Provides asynchronous access to platform-specific persistent storage
/// for simple data types. Suitable for user preferences and non-sensitive data.
///
/// Supported types: [String], [int], [double], [bool]
class SharedPreferencesStorage<ValueT> extends PreferencesStorage<ValueT> {
  final String _preferenceKey;

  /// Creates a SharedPreferences storage handler for the given key.
  SharedPreferencesStorage(this._preferenceKey);

  @override
  Future<ValueT?> read() async {
    final SharedPreferences sharedPref = await SharedPreferences.getInstance();

    // Type-safe retrieval based on generic type
    if (ValueT == bool) {
      return sharedPref.getBool(_preferenceKey) as ValueT?;
    } else if (ValueT == String) {
      return sharedPref.getString(_preferenceKey) as ValueT?;
    } else if (ValueT == int) {
      return sharedPref.getInt(_preferenceKey) as ValueT?;
    } else if (ValueT == double) {
      return sharedPref.getDouble(_preferenceKey) as ValueT?;
    } else {
      throw UnsupportedError(
        'Type $ValueT is not supported. Only String, int, double, and bool are supported.',
      );
    }
  }

  @override
  Future<void> write(ValueT? value) async {
    final SharedPreferences sharedPref = await SharedPreferences.getInstance();

    // Delete the key if value is null
    if (value == null) {
      await sharedPref.remove(_preferenceKey);
    } else if (ValueT == bool) {
      await sharedPref.setBool(_preferenceKey, value as bool);
    } else if (ValueT == String) {
      await sharedPref.setString(_preferenceKey, value as String);
    } else if (ValueT == int) {
      await sharedPref.setInt(_preferenceKey, value as int);
    } else if (ValueT == double) {
      await sharedPref.setDouble(_preferenceKey, value as double);
    } else {
      throw UnsupportedError(
        'Type $ValueT is not supported. Only String, int, double, and bool are supported.',
      );
    }
  }
}
