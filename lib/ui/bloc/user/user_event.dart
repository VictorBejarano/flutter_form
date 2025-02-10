part of 'user_bloc.dart';

/// Clase sellada de la tareas
sealed class UserEvent extends Equatable {
  const UserEvent();

  @override
  List<Object> get props => [];
}

// Evento obtener listado tareas
class GetUsersEvent extends UserEvent {
  const GetUsersEvent();
}

/// Evento obtener listado tareas exitoso
class GetUsersSuccessEvent extends UserEvent {
  const GetUsersSuccessEvent(this.dictionary);
  final Map<String, UserModel> dictionary;
}

/// Evento obtener listado tareas erroneo
class GetUsersErrorEvent extends UserEvent {
  const GetUsersErrorEvent(this.message);
  final String message;
}

/// Evento crear tarea
class CreateUserEvent extends UserEvent {
  const CreateUserEvent(this.user);
  final UserModel user;
}

/// Evento editar tarea
class EditUserEvent extends UserEvent {
  const EditUserEvent(this.user);
  final UserModel user;
}

/// Evento eliminar tarea
class DeleteUserEvent extends UserEvent {
  const DeleteUserEvent(this.id);
  final String id;
}