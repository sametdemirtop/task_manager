import 'package:equatable/equatable.dart';
import '../model/task_model.dart';

abstract class TaskState extends Equatable {
  @override
  List<Object> get props => [];
}

class TaskLoading extends TaskState {}

class TaskLoaded extends TaskState {
  final List<Task> tasks;

  TaskLoaded(this.tasks);

  @override
  List<Object> get props => [tasks];
}

class TaskError extends TaskState {}
