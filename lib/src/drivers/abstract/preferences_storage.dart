part of '../../mayr_storage.dart';

abstract interface class PreferencesStorage<ValueT> {
  Future<void> delete() async => write(null);

  Future<ValueT?> read();

  Future<void> write(ValueT? value);
}
