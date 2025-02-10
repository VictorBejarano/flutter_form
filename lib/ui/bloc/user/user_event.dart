part of 'user_bloc.dart';

/// Clase sellada de usuario
sealed class UserEvent extends Equatable {
  const UserEvent();

  @override
  List<Object> get props => [];
}

// Evento obtener listado usuarios
class GetUsersEvent extends UserEvent {
  const GetUsersEvent();
}

/// Evento obtener listado usuarios exitoso
class GetUsersSuccessEvent extends UserEvent {
  const GetUsersSuccessEvent(this.dictionary);
  final Map<String, UserModel> dictionary;
}

/// Evento obtener listado usuarios erroneo
class GetUsersErrorEvent extends UserEvent {
  const GetUsersErrorEvent(this.message);
  final String message;
}

/// Evento crear usuario
class CreateUserEvent extends UserEvent {
  const CreateUserEvent(this.user);
  final UserModel user;
}

/// Evento editar usuario
class EditUserEvent extends UserEvent {
  const EditUserEvent(this.user);
  final UserModel user;
}

/// Evento eliminar usuario
class DeleteUserEvent extends UserEvent {
  const DeleteUserEvent(this.id);
  final String id;
}