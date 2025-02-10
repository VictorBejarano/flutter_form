part of 'user_bloc.dart';

// Clase sellada del estado de usuario
sealed class UserState extends Equatable {
  const UserState(this.dictionary, this.messageError);
  final Map<String, UserModel> dictionary;
  final String messageError;

  @override
  List<Object> get props => [messageError];
}

/// Estado usuario inicial
final class UserInitial extends UserState {
  const UserInitial(super.dictionary, super.messageError);
}

/// Estado Obtener listado en progreso
final class GetUserInProgress extends UserState {
  const GetUserInProgress(super.dictionary, super.messageErrorZ);
}

/// Estado Obtener listado ha sido exitoso
final class GetUserSuccess extends UserState {
  const GetUserSuccess(super.dictionary, super.messageError);
}

/// Estado Obtener listado tiene error
final class GetUserError extends UserState {
  const GetUserError(super.dictionary, super.messageError);
}