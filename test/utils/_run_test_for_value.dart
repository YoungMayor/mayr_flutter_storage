import 'package:faker/faker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mayr_storage/mayr_storage.dart';

Future<void> runTestForValue<ValueT>(ValueT value) async {
  String key = faker.guid.guid();

  debugPrint("Running Test. Key: $key - Type $ValueT - Value: $value");

  final storage = key.storage<ValueT>();
  final secureStorage = key.secureStorage<ValueT>();
  final boxStorage = key.boxStorage<ValueT>();

  await testPreferenceReadWrite(value, storage);
  await testPreferenceReadWrite(value, secureStorage);
  testBoxReadWriteDelete(value, boxStorage);
}

void testBoxReadWriteDelete<ValueT>(
  ValueT value,
  GetBoxStorage<ValueT> storage,
) {
  storage.write(value);

  ValueT? result = storage.read();

  expect(result, equals(value));

  storage.delete();

  ValueT? deleteResult = storage.read();

  expect(deleteResult, isNull);
}

Future<void> testPreferenceReadWrite<ValueT>(
  ValueT value,
  PreferencesStorage<ValueT> storage,
) async {
  await storage.write(value);

  ValueT? result = await storage.read();

  expect(result, equals(value));

  await storage.delete();

  ValueT? deleteResult = await storage.read();

  expect(deleteResult, isNull);
}
