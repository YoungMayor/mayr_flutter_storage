part of './mayr_storage.dart';

extension KeyStorageExtensions on String {
  /// Get Box Storage using GetStorage internally
  GetBoxStorage<ValueT> boxStorage<ValueT>() => GetBoxStorage<ValueT>(this);

  /// Get Secure Storage using Encrypted Shared Preferences internally
  EncryptSharedPreferencesStorage<ValueT> secureStorage<ValueT>() =>
      EncryptSharedPreferencesStorage<ValueT>(this);

  /// Get Shared Preferences Storage
  SharedPreferencesStorage<ValueT> storage<ValueT>() =>
      SharedPreferencesStorage<ValueT>(this);
}
