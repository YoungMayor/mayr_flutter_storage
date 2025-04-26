import 'package:encrypt_shared_preferences/provider.dart';
import 'package:get_storage/get_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

part './drivers/encrypt_shared_preferences_storage.dart';
part './drivers/get_box_storage.dart';
part 'drivers/abstract/preferences_storage.dart';
part './drivers/shared_preferences_storage.dart';
part './extension.dart';

class MayrStorage {
  /// Init MayrStorage
  static Future init() async {
    await GetStorage.init();

    await EncryptedSharedPreferences.initialize("testkey#1029121@");
  }
}
