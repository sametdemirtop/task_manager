import 'package:flutter_bloc/flutter_bloc.dart';
import '../service/task_service.dart';
import 'task_event.dart';
import 'task_state.dart';

class TaskBloc extends Bloc<TaskEvent, TaskState> {
  final TaskService taskService;

  TaskBloc({required this.taskService}) : super(TaskLoading()) {
    on<AddTask>(_onAddTask);
    on<DeleteTask>(_onDeleteTask);
    on<LoadTasks>(_onLoadTasks);
  }

  Future<void> _onAddTask(AddTask event, Emitter<TaskState> emit) async {
    if (state is TaskLoaded) {
      final state = this.state as TaskLoaded;
      await taskService.addTask(event.task);
      emit(TaskLoaded(List.from(state.tasks)..add(event.task)));
    }
  }

  Future<void> _onDeleteTask(DeleteTask event, Emitter<TaskState> emit) async {
    if (state is TaskLoaded) {
      final state = this.state as TaskLoaded;
      await taskService.deleteTask(event.task);
      emit(TaskLoaded(List.from(state.tasks)..remove(event.task)));
    }
  }

  Future<void> _onLoadTasks(LoadTasks event, Emitter<TaskState> emit) async {
    emit(TaskLoading());// Burada açıkça TaskLoading emit ediyoruz
    try {
      final tasks = await taskService.loadTasks();
      emit(TaskLoaded(tasks));
    } catch (e) {
      emit(TaskError());
    }
  }
}
