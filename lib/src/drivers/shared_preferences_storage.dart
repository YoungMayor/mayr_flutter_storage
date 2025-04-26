part of '../mayr_storage.dart';

class SharedPreferencesStorage<ValueT> extends PreferencesStorage<ValueT> {
  final String _preferenceKey;

  SharedPreferencesStorage(this._preferenceKey);

  @override
  Future<ValueT?> read() async {
    SharedPreferences sharedPref = await SharedPreferences.getInstance();

    if (ValueT == bool) {
      return sharedPref.getBool(_preferenceKey) as ValueT?;
    } else if (ValueT == String) {
      return sharedPref.getString(_preferenceKey) as ValueT?;
    } else if (ValueT == int) {
      return sharedPref.getInt(_preferenceKey) as ValueT?;
    } else if (ValueT == double) {
      return sharedPref.getDouble(_preferenceKey) as ValueT?;
    } else {
      throw Exception("Unsupported type");
    }
  }

  @override
  Future<void> write(ValueT? value) async {
    SharedPreferences sharedPref = await SharedPreferences.getInstance();

    if (value == null) {
      sharedPref.clear();
    } else if (ValueT == bool) {
      sharedPref.setBool(_preferenceKey, value as bool);
    } else if (ValueT == String) {
      sharedPref.setString(_preferenceKey, value as String);
    } else if (ValueT == int) {
      sharedPref.setInt(_preferenceKey, value as int);
    } else if (ValueT == double) {
      sharedPref.setDouble(_preferenceKey, value as double);
    } else {
      throw Exception("Unsupported type");
    }
  }
}
