import 'package:flutter_form/models/task_state_enum.dart';

abstract class TaskStateMapper {
  String getStateFromEnum(TaskStateEnum value);
  TaskStateEnum getEnumFromState(String value);
}

class DefaultTaskStateMapper implements TaskStateMapper {
  @override
  String getStateFromEnum(TaskStateEnum value) {
    switch (value) {
      case TaskStateEnum.pending:
        return 'Pendiente';
      case TaskStateEnum.inProgress:
        return 'En progreso';
      case TaskStateEnum.complete:
        return 'Completado';
      default:
        return 'ERROR';
    }
  }
  
  @override
  TaskStateEnum getEnumFromState(String value) {
    switch (value) {
      case 'Pendiente':
        return TaskStateEnum.pending;
      case 'En progreso':
        return TaskStateEnum.inProgress;
      case 'Completado':
        return TaskStateEnum.complete;
      default:
        return TaskStateEnum.pending;
    }
  }
}