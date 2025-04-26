part of '../../mayr_storage.dart';

abstract interface class PreferencesStorage<ValueT> {
  /// Delete stored record
  Future<void> delete() async => write(null);

  /// Read stored record
  Future<ValueT?> read();

  /// Write record to storage
  Future<void> write(ValueT? value);
}
