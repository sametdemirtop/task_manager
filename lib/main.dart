import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kodiks_app/feature/task/view/fetch_task_screen.dart';

import 'feature/task/bloc/task_bloc.dart';
import 'feature/task/bloc/task_event.dart';
import 'feature/task/service/task_service.dart';
import 'feature/task/view/add_task_screen.dart';
import 'feature/task/view/detail_task_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  runApp(EasyLocalization(
    supportedLocales: const [Locale('en', 'US'), Locale('tr', 'TR')],
    path: 'assets/translation', // translation files path
    startLocale: const Locale("en"),
    fallbackLocale: const Locale('en', 'US'),
    child: TaskManagementApp(),
  ));
}

class TaskManagementApp extends StatelessWidget {
  final TaskService taskService = TaskService();

  TaskManagementApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TaskBloc(taskService: taskService)..add(LoadTasks()),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Task Management',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const FetchTaskScreen(),
        routes: {
          '/add': (context) => BlocProvider.value(
                value: BlocProvider.of<TaskBloc>(context),
                child: AddTaskScreen(),
              ),
          '/details': (context) => BlocProvider.value(
                value: BlocProvider.of<TaskBloc>(context),
                child: const DetailTaskScreen(),
              ),
        },
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
      ),
    );
  }
}
