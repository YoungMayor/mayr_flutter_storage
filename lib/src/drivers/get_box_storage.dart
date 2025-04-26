part of '../mayr_storage.dart';

class GetBoxStorage<ValueT> {
  final String _boxName;

  late final GetStorage _box = GetStorage();

  GetBoxStorage(this._boxName);

  /// Delete stored record
  void delete() => _box.remove(_boxName);

  /// Listen for updates
  void listen(void Function(ValueT newValue) handler) =>
      _box.listenKey(_boxName, (newValue) => handler(newValue));

  /// Read value from storage
  ValueT? read() => _box.read(_boxName);

  /// Write value to storage
  void write(ValueT? value) => _box.write(_boxName, value);
}
