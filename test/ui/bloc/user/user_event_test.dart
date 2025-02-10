import 'package:flutter_form/ui/bloc/user/user_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_form/data/models/models.dart';

void main() {
  group('UserEvent', () {
    final testUser = UserModel(
      id: '1',
      name: 'John',
      secondName: 'Doe',
      bornDate: '1990-01-01',
      addresses: [],
    );

    test('GetUsersEvent equality', () {
      expect(const GetUsersEvent(), const GetUsersEvent());
    });

    test('GetUsersSuccessEvent equality', () {
      final dictionary1 = {'1': testUser};
      final dictionary2 = {'1': testUser};
      
      expect(
        GetUsersSuccessEvent(dictionary1), 
        GetUsersSuccessEvent(dictionary2)
      );
    });

    test('CreateUserEvent equality', () {
      final user1 = testUser;
      final user2 = testUser.copyWith();
      
      expect(
        CreateUserEvent(user1), 
        CreateUserEvent(user2)
      );
    });

    test('EditUserEvent equality', () {
      final user1 = testUser;
      final user2 = testUser.copyWith();
      
      expect(
        EditUserEvent(user1), 
        EditUserEvent(user2)
      );
    });
  });
}