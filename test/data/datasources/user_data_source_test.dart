// user_datasource_test.dart
import 'dart:convert';

import 'package:flutter_form/data/datasources/user_data_source.dart';
import 'package:flutter_form/data/models/user_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/services.dart';
import 'package:mocktail/mocktail.dart';

class MockAssetBundle extends Mock implements AssetBundle {}

class UserDataSourceTest extends UserDataSource {
  final AssetBundle assetBundle;

  UserDataSourceTest(this.assetBundle);

  @override
  // ignore: override_on_non_overriding_member
  Future<Map<String, UserModel>> getUserList() async {
    Map<String, UserModel> response = {};
    final String jsonString =
        await assetBundle.loadString('assets/json/user.json');
    await Future.delayed(const Duration(seconds: 1));
    final jsonResponse = json.decode(jsonString);
    for (var item in (jsonResponse as List<dynamic>)) {
      UserModel user = UserModel.fromJson(item);
      response.addEntries([MapEntry(user.id, user)]);
    }
    return response;
  }
}

void main() {
  group('UserDataSource', () {
    late MockAssetBundle mockAssetBundle;
    late UserDataSourceTest userDataSource;

    setUp(() {
      mockAssetBundle = MockAssetBundle();
      userDataSource = UserDataSourceTest(mockAssetBundle);
      registerFallbackValue(MockAssetBundle());
    });

    test('getUserList should parse JSON correctly', () async {
      // Arrange
      const jsonString = '''
      [
        {
          "id": "1",
          "name": "John",
          "second_name": "Doe",
          "born_date": "01/01/1970",
          "addresses": []
        },
        {
          "id": "2", 
          "name": "Jane",
          "second_name": "Smith",
          "born_date": "01/01/1970",
          "addresses": []
        }
      ]
      ''';

      when(() => mockAssetBundle.loadString('assets/json/user.json'))
          .thenAnswer((_) async => jsonString);

      // Act
      final userMap = await userDataSource.getUserList();

      // Assert
      expect(userMap.length, 2);
      expect(userMap['1']?.name, 'John');
      expect(userMap['2']?.secondName, 'Smith');
    });

    test('getUserList handles empty list', () async {
      // Arrange
      const jsonString = '[]';
      when(() => mockAssetBundle.loadString('assets/json/user.json'))
          .thenAnswer((_) async => jsonString);

      // Act
      final userMap = await userDataSource.getUserList();

      // Assert
      expect(userMap.isEmpty, true);
    });
  });
}
