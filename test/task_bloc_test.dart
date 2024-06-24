import 'package:flutter_test/flutter_test.dart';
import 'package:kodiks_app/feature/task/bloc/task_bloc.dart';
import 'package:kodiks_app/feature/task/bloc/task_event.dart';
import 'package:kodiks_app/feature/task/bloc/task_state.dart';
import 'package:kodiks_app/feature/task/model/task_model.dart';
import 'package:kodiks_app/feature/task/service/task_service.dart';


class MockTaskService extends TaskService {
  List<Task> tasks = [];

  @override
  Future<List<Task>> loadTasks() async {
    return tasks;
  }

  @override
  Future<void> addTask(Task task) async {
    tasks.add(task);
  }

  @override
  Future<void> deleteTask(Task task) async {
    tasks.remove(task);
  }
}

void main() {
  late MockTaskService mockTaskService;
  late TaskBloc taskBloc;

  setUp(() {
    mockTaskService = MockTaskService();
    taskBloc = TaskBloc(taskService: mockTaskService);
  });

  tearDown(() {
    taskBloc.close();
  });

  final testTask = Task(title: 'Test Task', description: 'Test Description', image: 'Test Url',dueDate: "Test Due Date");

  test('initial state is TaskLoading', () {
    expect(taskBloc.state, equals(TaskLoading()));
  });

  test('emits [TaskLoading, TaskLoaded] when LoadTasks is added and tasks are loaded successfully', () async {
    mockTaskService.tasks = [testTask];
    taskBloc.add(LoadTasks());

    await expectLater(
      taskBloc.stream,
      emitsInOrder([
        isA<TaskLoading>(),
        isA<TaskLoaded>().having((s) => s.tasks, 'tasks', [testTask]),
      ]),
    );
  });

  test('emits [TaskLoaded] when AddTask is added and task is added successfully', () async {
    taskBloc.emit(TaskLoaded(const []));
    taskBloc.add(AddTask(testTask));

    await expectLater(
      taskBloc.stream,
      emitsInOrder([
        isA<TaskLoaded>().having((s) => s.tasks, 'tasks', [testTask]),
      ]),
    );
  });

  test('emits [TaskLoaded] when DeleteTask is added and task is deleted successfully', () async {
    taskBloc.emit(TaskLoaded([testTask]));
    taskBloc.add(DeleteTask(testTask));

    await expectLater(
      taskBloc.stream,
      emitsInOrder([
        isA<TaskLoaded>().having((s) => s.tasks, 'tasks', []),
      ]),
    );
  });

  test('emits [TaskLoading, TaskError] when LoadTasks is added and there is an error', () async {
    mockTaskService = MockTaskServiceWithError();
    taskBloc = TaskBloc(taskService: mockTaskService);
    taskBloc.add(LoadTasks());

    await expectLater(
      taskBloc.stream,
      emitsInOrder([
        isA<TaskLoading>(),
        isA<TaskError>(),
      ]),
    );
  });
}

class MockTaskServiceWithError extends MockTaskService {
  @override
  Future<List<Task>> loadTasks() async {
    throw Exception('Failed to load tasks');
  }
}
