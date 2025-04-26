part of './../mayr_storage.dart';

class EncryptSharedPreferencesStorage<ValueT>
    extends PreferencesStorage<ValueT> {
  final String _preferenceKey;

  EncryptSharedPreferencesStorage(this._preferenceKey);

  @override
  Future<ValueT?> read() async {
    EncryptedSharedPreferences securePref =
        EncryptedSharedPreferences.getInstance();

    if (ValueT == bool) {
      return securePref.getBool(_preferenceKey) as ValueT?;
    } else if (ValueT == String) {
      return securePref.getString(_preferenceKey) as ValueT?;
    } else if (ValueT == int) {
      return securePref.getInt(_preferenceKey) as ValueT?;
    } else if (ValueT == double) {
      return securePref.getDouble(_preferenceKey) as ValueT?;
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
      securePref.setBool(_preferenceKey, value as bool);
    } else if (ValueT == String) {
      securePref.setString(_preferenceKey, value as String);
    } else if (ValueT == int) {
      securePref.setInt(_preferenceKey, value as int);
    } else if (ValueT == double) {
      securePref.setDouble(_preferenceKey, value as double);
    } else {
      throw Exception("Unsupported type");
    }
  }
}
