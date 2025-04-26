import 'package:flutter/material.dart';
import 'package:mayr_storage/mayr_storage.dart';

/// [main.dart]
void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialise MayrStorage
  await MayrStorage.init();

  runApp(const MyApp());
}

/// [storage.dart]
class Storage {
  // Normal SharedPreferences storage
  static final normalToken = 'NORMAL_TOKEN'.storage<String>();

  // Secure storage using encrypted shared preferences
  static final secureToken = 'SECURE_TOKEN'.secureStorage<String>();

  // GetBox Storage
  static final boxToken = 'BOX_TOKEN'.boxStorage<String>();
}

/// [my_app.dart]
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Mayr Storage Example')),
        body: const StorageDemo(),
      ),
    );
  }
}

/// [storage_demo.dart]
class StorageDemo extends StatefulWidget {
  const StorageDemo({super.key});

  @override
  State<StorageDemo> createState() => _StorageDemoState();
}

class _StorageDemoState extends State<StorageDemo> {
  String? normalValue;
  String? secureValue;
  String? boxValue;

  @override
  void initState() {
    super.initState();
    loadValues();
  }

  Future<void> loadValues() async {
    normalValue = await Storage.normalToken.read();
    secureValue = await Storage.secureToken.read();
    boxValue = Storage.boxToken.read();

    setState(() {});
  }

  Future<void> writeValues() async {
    await Storage.normalToken.write('NormalTokenValue');
    await Storage.secureToken.write('SecureTokenValue');
    Storage.boxToken.write('BoxTokenValue');

    await loadValues();
  }

  Future<void> clearValues() async {
    await Storage.normalToken.delete();
    await Storage.secureToken.delete();
    Storage.boxToken.delete();

    await loadValues();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Normal Token: $normalValue'),
          Text('Secure Token: $secureValue'),
          Text('Box Token: $boxValue'),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: writeValues,
            child: const Text('Write Values'),
          ),
          ElevatedButton(
            onPressed: clearValues,
            child: const Text('Clear Values'),
          ),
        ],
      ),
    );
  }
}
