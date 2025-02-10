import 'package:flutter_form/ui/bloc/user/user_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_form/data/models/models.dart';

void main() {
  group('UserState', () {
    final testUser = UserModel(
      id: '1',
      name: 'John',
      secondName: 'Doe',
      bornDate: '1990-01-01',
      addresses: [],
    );

    final testDictionary = {'1': testUser};

    test('UserInitial state equality', () {
      final state1 = UserInitial(testDictionary, '');
      final state2 = UserInitial(testDictionary, '');

      expect(state1, state2);
    });

    test('GetUserInProgress state equality', () {
      final state1 = GetUserInProgress(testDictionary, '');
      final state2 = GetUserInProgress(testDictionary, '');

      expect(state1, state2);
    });

    test('GetUserSuccess state equality', () {
      final state1 = GetUserSuccess(testDictionary, '');
      final state2 = GetUserSuccess(testDictionary, '');

      expect(state1, state2);
    });

    test('GetUserError state equality', () {
      final state1 = GetUserError(testDictionary, 'Error');
      final state2 = GetUserError(testDictionary, 'Error');

      expect(state1, state2);
    });

    test('States with different error messages are not equal', () {
      final state1 = GetUserError(testDictionary, 'Error 1');
      final state2 = GetUserError(testDictionary, 'Error 2');

      expect(state1, isNot(state2));
    });

    test('props includes messageError', () {
      final state = GetUserError(testDictionary, 'Test Error');
      expect(state.props, ['Test Error']);
    });
  });
}
