part of './mayr_storage.dart';

extension KeyStorageExtensions on String {
  GetBoxStorage<ValueT> boxStorage<ValueT>() => GetBoxStorage<ValueT>(this);

  EncryptSharedPreferencesStorage<ValueT> secureStorage<ValueT>() =>
      EncryptSharedPreferencesStorage<ValueT>(this);

  SharedPreferencesStorage<ValueT> storage<ValueT>() =>
      SharedPreferencesStorage<ValueT>(this);
}
