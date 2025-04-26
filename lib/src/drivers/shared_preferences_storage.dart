part of '../mayr_storage.dart';

class SharedPreferencesStorage<ValueT> extends PreferencesStorage<ValueT> {
  SharedPreferencesStorage(this.preferenceKey);

  final String preferenceKey;

  @override
  Future<ValueT?> read() async {
    SharedPreferences sharedPref = await SharedPreferences.getInstance();

    if (ValueT == bool) {
      return sharedPref.getBool(preferenceKey) as ValueT?;
    } else if (ValueT == String) {
      return sharedPref.getString(preferenceKey) as ValueT?;
    } else if (ValueT == int) {
      return sharedPref.getInt(preferenceKey) as ValueT?;
    } else if (ValueT == double) {
      return sharedPref.getDouble(preferenceKey) as ValueT?;
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
      sharedPref.setBool(preferenceKey, value as bool);
    } else if (ValueT == String) {
      sharedPref.setString(preferenceKey, value as String);
    } else if (ValueT == int) {
      sharedPref.setInt(preferenceKey, value as int);
    } else if (ValueT == double) {
      sharedPref.setDouble(preferenceKey, value as double);
    } else {
      throw Exception("Unsupported type");
    }
  }
}
