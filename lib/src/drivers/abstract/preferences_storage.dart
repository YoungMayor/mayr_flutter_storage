part of '../../mayr_storage.dart';

/// Abstract interface for preference-based storage implementations.
///
/// Defines the contract for storage backends that persist data asynchronously,
/// such as SharedPreferences and EncryptedSharedPreferences.
abstract interface class PreferencesStorage<ValueT> {
  /// Deletes the stored value by writing null.
  ///
  /// This is equivalent to calling write(null).
  Future<void> delete() async => write(null);

  /// Reads the stored value.
  ///
  /// Returns the stored value of type [ValueT], or null if no value exists.
  Future<ValueT?> read();

  /// Writes a value to storage.
  ///
  /// If [value] is null, the stored value will be deleted.
  Future<void> write(ValueT? value);
}
