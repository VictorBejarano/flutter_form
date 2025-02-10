import 'package:flutter/material.dart';
import 'package:flutter_form/ui/routes.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_form/ui/pages/home_page/home_page.dart';
import 'package:flutter_form/ui/pages/list_page/list_user_page.dart';
import 'package:flutter_form/ui/pages/form_page/form_page.dart';

void main() {
  group('Application Routes', () {
    test('routes map contains correct keys', () {
      expect(routes.containsKey(HomePage.route), isTrue);
      expect(routes.containsKey(ListUserPage.route), isTrue);
      expect(routes.containsKey(FormPage.route), isTrue);
    });

    test('routes map returns correct widgets', () {
      final BuildContext mockContext = MockBuildContext();

      expect(routes[HomePage.route]!(mockContext), isA<HomePage>());
      expect(routes[ListUserPage.route]!(mockContext), isA<ListUserPage>());
      expect(routes[FormPage.route]!(mockContext), isA<FormPage>());
    });

    test('route functions create const instances', () {
      final BuildContext mockContext = MockBuildContext();

      final homePage1 = routes[HomePage.route]!(mockContext);
      final homePage2 = routes[HomePage.route]!(mockContext);
      expect(identical(homePage1, homePage2), isTrue);
    });
  });
}

class MockBuildContext implements BuildContext {
  @override
  dynamic noSuchMethod(Invocation invocation) => null;
}