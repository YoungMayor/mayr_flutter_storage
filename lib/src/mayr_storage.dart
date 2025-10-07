import 'package:encrypt_shared_preferences/provider.dart';
import 'package:get_storage/get_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

part './drivers/encrypt_shared_preferences_storage.dart';
part './drivers/get_box_storage.dart';
part 'drivers/abstract/preferences_storage.dart';
part './drivers/shared_preferences_storage.dart';
part './extension.dart';

/// Main entry point for MayrStorage initialization.
///
/// This class provides centralized initialization for all storage backends
/// used by the package including SharedPreferences, EncryptedSharedPreferences,
/// and GetStorage.
class MayrStorage {
  /// Initializes all storage backends.
  ///
  /// This method must be called before using any storage operations,
  /// typically in the main() function after WidgetsFlutterBinding.ensureInitialized().
  ///
  /// Example:
  /// ```dart
  /// void main() async {
  ///   WidgetsFlutterBinding.ensureInitialized();
  ///   await MayrStorage.init();
  ///   runApp(MyApp());
  /// }
  /// ```
  static Future<void> init() async {
    await GetStorage.init();
    await EncryptedSharedPreferences.initialize("testkey#1029121@");
  }
}
