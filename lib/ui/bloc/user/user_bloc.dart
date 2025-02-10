import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_form/data/datasources/task_data_source.dart';
import 'package:flutter_form/data/models/models.dart';

part 'user_event.dart';
part 'user_state.dart';

/// Bloc de la tarea
class UserBloc extends Bloc<UserEvent, UserState> {
  /// Crea una instancia de UserBloc
  UserBloc() : super(const UserInitial({}, '')) {
    on<GetUsersEvent>(_onGetList);
    on<GetUsersSuccessEvent>(_onGetSuccess);
    on<GetUsersErrorEvent>(_onGetError);

    on<CreateUserEvent>(_onCreate);
    on<EditUserEvent>(_onEdit);
    on<DeleteUserEvent>(_onDelete);
  }

  /// Dispara evento [GetUsersEvent]
  void getUsers() {
    add(const GetUsersEvent());
  }

  /// Dispara evento [CreateUserEvent]
  void createUser(UserModel user) {
    add(CreateUserEvent(user));
  }

  /// Dispara evento [EditUserEvent]
  void editUser(UserModel user) {
    add(EditUserEvent(user));
  }

  /// Dispara evento [DeleteUserEvent]
  void deleteUser(String id) {
    add(DeleteUserEvent(id));
  }

  /// Obtiene la lista de tareas a partir de [UserDataSource]
  void _onGetList(GetUsersEvent event, Emitter<UserState> emit) async {
    try {
      emit(GetUserInProgress(state.dictionary, state.messageError));
      Map<String, UserModel> dictionary = await UserDataSource.getUserList();
      add(GetUsersSuccessEvent(dictionary));
    } catch (e) {
      add(GetUsersErrorEvent(e.toString()));
    }
  }

  /// Obtencion de lista es exitosa
  void _onGetSuccess(GetUsersSuccessEvent event, Emitter<UserState> emit) {
    if (state is GetUserInProgress) {
      emit(GetUserSuccess(event.dictionary, ''));
    }
  }

  /// Obtencion de lista es erronea
  void _onGetError(GetUsersErrorEvent event, Emitter<UserState> emit) async {
    if (state is GetUserInProgress) {
      emit(GetUserError(const {}, event.message));
    }
  }

  /// Crea tarea
  void _onCreate(CreateUserEvent event, Emitter<UserState> emit) async {
    emit(GetUserInProgress(state.dictionary, state.messageError));
    Map<String, UserModel> currDictionary = _cloneDictionary(state.dictionary);
    final currId = DateTime.now().millisecondsSinceEpoch.toString();
    currDictionary
        .addEntries([MapEntry(currId, event.user.copyWith(id: currId))]);
    add(GetUsersSuccessEvent(currDictionary));
  }

  /// Edita tarea
  void _onEdit(EditUserEvent event, Emitter<UserState> emit) async {
    emit(GetUserInProgress(state.dictionary, state.messageError));
    Map<String, UserModel> currDictionary = _cloneDictionary(state.dictionary);
    currDictionary.update(event.user.id, (value) => event.user);
    add(GetUsersSuccessEvent(currDictionary));
  }

  /// Elimina tarea
  void _onDelete(DeleteUserEvent event, Emitter<UserState> emit) async {
    emit(GetUserInProgress(state.dictionary, state.messageError));
    Map<String, UserModel> currDictionary = _cloneDictionary(state.dictionary);
    currDictionary.remove(event.id);
    add(GetUsersSuccessEvent(currDictionary));
  }

  /// Clona el diccionario profundamente
  Map<String, UserModel> _cloneDictionary(Map<String, UserModel> dictionary) {
    return dictionary.map((key, value) => MapEntry(key, value.copyWith()));
  }
}
