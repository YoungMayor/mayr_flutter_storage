import 'package:flutter_test/flutter_test.dart';
import 'package:mayr_storage/mayr_storage.dart';
import 'package:path_provider_platform_interface/path_provider_platform_interface.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'utils/_run_test_for_value.dart';
import 'utils/_test_cases.dart';
import 'utils/fake_path_provider_platform.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUpAll(() async {
    PathProviderPlatform.instance = FakePathProviderPlatform();
    SharedPreferences.setMockInitialValues({});

    await MayrStorage.init();
  });

  group("Test all cases", () {
    test("Test Strings", () async {
      for (var element in stringCases()) {
        await runTestForValue<String>(element);
      }
    });

    test("Test integers", () async {
      for (var element in intCases()) {
        await runTestForValue<int>(element);
      }
    });

    test("Test booleans", () async {
      for (var element in boolCases()) {
        await runTestForValue<bool>(element);
      }
    });
  });
}
