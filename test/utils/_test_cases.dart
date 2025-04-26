import 'package:faker/faker.dart';

List<bool> boolCases() => [true, false];

List<int> intCases() => List.generate(
  30,
  (index) => faker.randomGenerator.integer(100000000) * index,
);

List<String> stringCases() => [
  ...faker.lorem.sentences(10),
  faker.guid.guid(),
  faker.internet.password(length: 32),
  faker.internet.email(),
];
