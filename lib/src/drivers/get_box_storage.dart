part of '../mayr_storage.dart';

class GetBoxStorage<ValueT> {
  final String boxName;

  GetBoxStorage(this.boxName);

  late final GetStorage _box = GetStorage();

  void write(ValueT? value) => _box.write(boxName, value);

  ValueT? read() => _box.read(boxName);

  void delete() => _box.remove(boxName);

  void listen(void Function(ValueT newValue) handler) =>
      _box.listenKey(boxName, (newValue) => handler(newValue));
}
