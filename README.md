![License](https://img.shields.io/badge/license-MIT-blue.svg?label=Licence)
![Platform](https://img.shields.io/badge/Platform-Flutter-blue.svg)

![Pub Version](https://img.shields.io/pub/v/mayr_storage?style=plastic&label=Version)
![Pub.dev Score](https://img.shields.io/pub/points/mayr_storage?label=Score&style=plastic)
![Pub Likes](https://img.shields.io/pub/likes/mayr_storage?label=Likes&style=plastic)
![Pub.dev Publisher](https://img.shields.io/pub/publisher/mayr_storage?label=Publisher&style=plastic)
![Downloads](https://img.shields.io/pub/dm/mayr_storage.svg?label=Downloads&style=plastic)

![Build Status](https://img.shields.io/github/actions/workflow/status/YoungMayor/mayr_flutter_storage/ci.yaml?label=Build)
![Issues](https://img.shields.io/github/issues/YoungMayor/mayr_flutter_storage.svg?label=Issues)
![Last Commit](https://img.shields.io/github/last-commit/YoungMayor/mayr_flutter_storage.svg?label=Latest%20Commit)
![Contributors](https://img.shields.io/github/contributors/YoungMayor/mayr_flutter_storage.svg?label=Contributors)

# 💼 Mayr Flutter Storage Util

A lightweight Flutter package for seamless access to SharedPreferences, SecureStorage, and GetStorage using a simple and expressive API.
> One storage interface. Multiple backends. SharedPreferences, Secure Storage, and GetStorage made effortless for Flutter apps.


## ✨ Features
- **Easy Key Definition**

    Define your storage keys once and use them throughout your app — clean, organised, and type-safe.

- **Unified API Across Storage Types**

    Whether it’s SharedPreferences, EncryptedSharedPreferences, or GetStorage, the syntax stays the same. One style, multiple backends.

- **Zero Boilerplate**

    No need to manually set up storage instances or repeat logic. Just define and use.

- **Simple Read, Write, and Delete**
  - `read()` to fetch a value
  - `write(value)` to save a value
  - `delete()` to remove a value

- **Support for Multiple Data Types**

    Supports all basic types like String, int, double, bool, List<String>, etc.

- **Clean, Scalable, and Developer-Friendly**

    Perfect for growing codebases where storage management needs to stay intuitive and reliable.

## 🚀 Getting started

1. Add `mayr_storage` to your `pubspec.yaml`:

    ```yaml
    dependencies:
        mayr_storage: # check for the latest version on pub.dev
    ```

2. Instal the package:
    ```bash
    flutter pub get
    ```

3. Import it into your Dart file:
    ```dart
    import 'package:mayr_storage/mayr_storage.dart';
    ```

> Alternatively, you could install it using the command
> ```bash
> flutter pub add mayr_storage
> ```

## ⚙️ Important: Initialise Storage First

Before using any of the storage features, you must initialise the storage engine.

Do this at the start of your app, typically inside the `main()` function:

```dart
import 'package:flutter/material.dart';
import 'package:mayr_storage/mayr_storage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await MayrStorage.init();

  runApp(const MyApp());
}
```

> 🛑 **Note**:
> Failing to call `MayrStorage.init()` before accessing any storage key will cause unexpected errors.

## 🛠️ Usage

### Define your storage keys once in a dedicated `Storage` class:
```dart
import 'package:mayr_storage/mayr_storage.dart';

class Storage {
    static final userToken = 'SK_USER_TOKEN'.storage<String>();
    static final username = 'SK_USERNAME'.secureStorage<String>();
    static final userAge = 'SK_USER_AGE'.boxStorage<int>();
}
```
> PS: You can name the class whatever you want, you are not required to name it Storage

### ✍️ Write to Storage
```dart
await Storage.userToken.write('abc123');
await Storage.username.write('YoungMayor');
Storage.userAge.write(25); // Box Storage is synchronous so no need for waiting
```
### 📖 Read from Storage
```dart
String? token = await Storage.userToken.read();
String? name = await Storage.username.read();
int? age = Storage.userAge.read();
```

### 🗑️ Delete from Storage
```dart
await Storage.userToken.delete();
await Storage.username.delete();
Storage.userAge.delete();
```

## 📚 Choosing the Right Storage

### 🛠️ .storage
- This uses [SharedPreferences](https://pub.dev/packages/shared_preferences) internally.

- It is simple key-value storage, ideal for lightweight, non-sensitive data like user settings, theme preferences, onboarding completion flags, etc.
- Not encrypted, so not suitable for secrets (e.g. tokens, passwords).

> #### 🔹 Example Use Cases:
> Saving theme mode (dark/light), saving user selected language.

### 🛡️ .secureStorage
- This uses [EncryptSharedPreferences](https://pub.dev/packages/encrypt_shared_preferences) internally.

- Data is encrypted, making it safe for sensitive information like tokens, credentials, secure flags.
- Better security compared to normal `.storage`.

> #### 🔹 Example Use Cases:
> Saving login tokens, saving sensitive user settings, saving payment authentication preferences.

### 📦 .boxStorage
- This uses [GetStorage](https://pub.dev/packages/get_storage) internally.

- It's a very fast and lightweight local storage.
- Great for caching larger amounts of data or building offline-first features.
- It's not encrypted but super efficient.
- It is synchronous, goodbye to waiting

> #### 🔹 Example Use Cases:
> Storing offline data, caching lists, storing app states, drafts, local session data.

| Type           | Backend Used             | Encryption | Synchronous | Best for                              |
| -------------- | ------------------------ | ---------- | ----------- | ------------------------------------- |
| .storage       | SharedPreferences        | ❌          | ❌           | Light, non-sensitive key-value data   |
| .secureStorage | EncryptSharedPreferences | ✅          | ❌           | Sensitive data like tokens            |
| .boxStorage    | GetStorage               | ❌          | ✅           | Offline data caching, larger datasets |


## ✅ Best Practices
- **Always initialise MayrStorage early**

    Ensure you call `await MayrStorage.init();` before using any storage key. Preferably inside your `main()` function before running the app.

- **Group your keys properly**

    Define all your keys inside a dedicated class (or multiple classes if needed). This improves maintainability and readability.

    ```dart
    class Storage {
        static final isFirstLaunch = 'SK_FIRST_LAUNCH'.storage<bool>();
        static final authToken = 'SK_AUTH_TOKEN'.secureStorage<String>();
        static final cachedPosts = 'SK_CACHED_POSTS'.boxStorage<List<String>>();
    }
    ```

- **Use the correct storage type for the data**
  - Use `.storage()` for simple, non-sensitive values (e.g. booleans, settings).
  - Use `.secureStorage()` for sensitive or confidential data (e.g. tokens, passwords).
  - Use `.boxStorage()` for caching and data sets.

- **Use meaningful key names**

    Use key names that clearly describe their purpose. For example, prefer `'SK_USER_THEME_MODE'` over `'SK_TM'`.

- **Encrypt highly sensitive data yourself if needed**

    .secureStorage() provides basic encryption. If you're dealing with extremely sensitive data, consider encrypting it manually before saving.

- **Clean up after yourself**

    If a key is no longer needed (e.g. on logout), make sure to delete it to avoid stale data.

```dart
await Storage.authToken.delete();
```

- **Do not overuse local storage**

    Storage is great, but avoid putting huge amounts of unnecessary data into local storage.
    It can slow down your app over time.



## 📢 Additional Information

### 🤝 Contributing
Contributions are highly welcome!
If you have ideas for new extensions, improvements, or fixes, feel free to fork the repository and submit a pull request.

Please make sure to:
- Follow the existing coding style.
- Write tests for new features.
- Update documentation if necessary.

> Let's build something amazing together!

---

### 🐛 Reporting Issues
If you encounter a bug, unexpected behaviour, or have feature requests:
- Open an issue on the repository.
- Provide a clear description and steps to reproduce (if it's a bug).
- Suggest improvements if you have any ideas.

> Your feedback helps make the package better for everyone!

---

### 📜 Licence
This package is licensed under the MIT License — which means you are free to use it for commercial and non-commercial projects, with proper attribution.

See the [LICENSE](LICENSE) file for more details.

---

## 🌟 Support

If you find this package helpful, please consider giving it a ⭐️ on GitHub — it motivates and helps the project grow!

You can also support by:
- Sharing the package with your friends, colleagues, and tech communities.
- Using it in your projects and giving feedback.
- Contributing new ideas, features, or improvements.

Every little bit of support counts! 🚀💙
