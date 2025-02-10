import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form/app.dart';
import 'package:flutter_form/ui/bloc/user/user_bloc.dart';
import 'package:flutter_form/ui/pages/home_page/home_page.dart';

void main() {
  testWidgets('App initializes correctly with HomePage',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      BlocProvider(
        create: (context) => UserBloc(),
        child: const App(),
      ),
    );

    expect(find.byType(MaterialApp), findsOneWidget);
    expect(find.byType(HomePage), findsOneWidget);
  });
}
