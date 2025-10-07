part of '../mayr_storage.dart';

/// Storage implementation using GetStorage.
///
/// Provides fast, synchronous key-value storage with support for complex types.
/// Ideal for caching, frequently accessed data, and scenarios where
/// synchronous access is preferred.
///
/// Unlike SharedPreferences, GetBoxStorage operations are synchronous
/// and support any serializable type.
class GetBoxStorage<ValueT> {
  final String _boxName;

  /// The underlying GetStorage instance.
  late final GetStorage _box = GetStorage();

  /// Creates a GetBox storage handler for the given key.
  GetBoxStorage(this._boxName);

  /// Deletes the stored value.
  ///
  /// Removes the key-value pair from storage.
  void delete() => _box.remove(_boxName);

  /// Listens for changes to the stored value.
  ///
  /// The [handler] callback will be invoked whenever the value
  /// associated with this key changes.
  ///
  /// Example:
  /// ```dart
  /// storage.listen((newValue) {
  ///   print('Value changed to: $newValue');
  /// });
  /// ```
  void listen(void Function(ValueT newValue) handler) =>
      _box.listenKey(_boxName, (newValue) => handler(newValue));

  /// Reads the stored value synchronously.
  ///
  /// Returns the stored value of type [ValueT], or null if no value exists.
  ValueT? read() => _box.read(_boxName);

  /// Writes a value to storage synchronously.
  ///
  /// If [value] is null, the stored value will be deleted.
  void write(ValueT? value) => _box.write(_boxName, value);
}
