part of './../mayr_storage.dart';

class EncryptSharedPreferencesStorage<ValueT>
    extends PreferencesStorage<ValueT> {
  final String preferenceKey;

  EncryptSharedPreferencesStorage(this.preferenceKey);

  @override
  Future<ValueT?> read() async {
    EncryptedSharedPreferences securePref =
        EncryptedSharedPreferences.getInstance();

    if (ValueT == bool) {
      return securePref.getBool(preferenceKey) as ValueT?;
    } else if (ValueT == String) {
      return securePref.getString(preferenceKey) as ValueT?;
    } else if (ValueT == int) {
      return securePref.getInt(preferenceKey) as ValueT?;
    } else if (ValueT == double) {
      return securePref.getDouble(preferenceKey) as ValueT?;
    } else {
      throw Exception("Unsupported type");
    }
  }

  @override
  Future<void> write(ValueT? value) async {
    EncryptedSharedPreferences securePref =
        EncryptedSharedPreferences.getInstance();

    if (value == null) {
      securePref.clear();
    } else if (ValueT == bool) {
      securePref.setBool(preferenceKey, value as bool);
    } else if (ValueT == String) {
      securePref.setString(preferenceKey, value as String);
    } else if (ValueT == int) {
      securePref.setInt(preferenceKey, value as int);
    } else if (ValueT == double) {
      securePref.setDouble(preferenceKey, value as double);
    } else {
      throw Exception("Unsupported type");
    }
  }
}
