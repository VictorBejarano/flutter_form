import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_form/ui/bloc/user/user_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:flutter_form/data/datasources/user_data_source.dart';
import 'package:flutter_form/data/models/models.dart';

// Mock UserDataSource for testing
class MockUserDataSource extends Mock implements UserDataSource {}

void main() {
  group('UserBloc', () {
    late UserBloc userBloc;
    final testUser = UserModel(
      id: '1',
      name: 'John',
      secondName: 'Doe',
      bornDate: '1990-01-01',
      addresses: [],
    );

    setUp(() {
      userBloc = UserBloc();
      registerFallbackValue(testUser);
    });

    test('initial state is UserInitial', () {
      expect(userBloc.state, isA<UserInitial>());
    });

    blocTest<UserBloc, UserState>(
      'creates a new user with generated ID',
      build: () => userBloc,
      act: (bloc) {
        final newUser = testUser.copyWith(name: 'New User');
        bloc.add(CreateUserEvent(newUser));
      },
      expect: () => [
        isA<GetUserInProgress>(),
        isA<GetUserSuccess>(),
      ],
      verify: (bloc) {
        final state = bloc.state as GetUserSuccess;
        expect(state.dictionary.length, 1);
        expect(state.dictionary.values.first.name, 'New User');
        expect(state.dictionary.values.first.id, isNotNull);
      },
    );

    blocTest<UserBloc, UserState>(
      'edits an existing user',
      build: () => userBloc,
      seed: () => GetUserSuccess({'1': testUser}, ''),
      act: (bloc) {
        final editedUser = testUser.copyWith(name: 'Edited Name');
        bloc.add(EditUserEvent(editedUser));
      },
      expect: () => [
        isA<GetUserInProgress>(),
        isA<GetUserSuccess>(),
      ],
      verify: (bloc) {
        final state = bloc.state as GetUserSuccess;
        expect(state.dictionary['1']?.name, 'Edited Name');
      },
    );

    blocTest<UserBloc, UserState>(
      'deletes a user',
      build: () => userBloc,
      seed: () => GetUserSuccess({'1': testUser, '2': testUser.copyWith(id: '2')}, ''),
      act: (bloc) {
        bloc.add(const DeleteUserEvent('1'));
      },
      expect: () => [
        isA<GetUserInProgress>(),
        isA<GetUserSuccess>(),
      ],
      verify: (bloc) {
        final state = bloc.state as GetUserSuccess;
        expect(state.dictionary.length, 1);
        expect(state.dictionary.containsKey('1'), isFalse);
      },
    );
  });
}