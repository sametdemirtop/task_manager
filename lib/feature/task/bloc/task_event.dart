import '../model/task_model.dart';

abstract class TaskEvent {}

class AddTask extends TaskEvent {
  final Task task;

  AddTask(this.task);
}

class DeleteTask extends TaskEvent {
  final Task task;

  DeleteTask(this.task);
}

class LoadTasks extends TaskEvent {}
