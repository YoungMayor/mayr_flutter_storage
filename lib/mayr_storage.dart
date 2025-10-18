/// A simple and unified storage solution for Flutter applications.
///
/// This library provides a clean, consistent API for managing different types
/// of persistent storage in Flutter apps:
///
/// - **SharedPreferences** - For simple, non-sensitive data
/// - **EncryptedSharedPreferences** - For sensitive, encrypted data
/// - **GetStorage** - For fast, synchronous key-value storage
///
/// ## Quick Start
///
/// Initialize storage at app startup:
/// ```dart
/// void main() async {
///   WidgetsFlutterBinding.ensureInitialized();
///   await MayrStorage.init();
///   runApp(MyApp());
/// }
/// ```
///
/// Define storage keys:
/// ```dart
/// class Storage {
///   static final userToken = 'USER_TOKEN'.storage<String>();
///   static final authToken = 'AUTH_TOKEN'.secureStorage<String>();
///   static final cache = 'CACHE_DATA'.boxStorage<String>();
/// }
/// ```
///
/// Use storage operations:
/// ```dart
/// // Write
/// await Storage.userToken.write('token123');
///
/// // Read
/// final token = await Storage.userToken.read();
///
/// // Delete
/// await Storage.userToken.delete();
/// ```
library mayr_storage;

export './src/mayr_storage.dart';
