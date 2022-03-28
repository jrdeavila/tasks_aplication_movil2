import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_aplicattion2/blocs/provider.dart';
import 'package:task_aplicattion2/pages/activities/activities_page.dart';
import 'package:task_aplicattion2/pages/activities/list_Activity_page.dart';
import 'package:task_aplicattion2/pages/login_page.dart';
import 'package:task_aplicattion2/pages/tasks/list_tasks_page.dart';
import 'package:task_aplicattion2/pages/home_pages.dart';
import 'package:task_aplicattion2/pages/tasks/task_page.dart';
import 'package:task_aplicattion2/providers/modal_provider.dart';
import 'package:task_aplicattion2/providers/snacbar_provider.dart';
import 'package:task_aplicattion2/providers/task_provider.dart';
import 'package:task_aplicattion2/providers/ui_provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) =>  UiProvider()),
        ChangeNotifierProvider(create: (_) =>  WidgetModalProvider()),
        ChangeNotifierProvider(create: (_) =>  SnacBarProvider()),
        ChangeNotifierProvider(create: (_) =>  TaskProvider()),
      ],
      child: Providers(
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Books',
          initialRoute: 'homes',
          routes: {
            'listTaskPage'  : (BuildContext context) => ListTaskPage(),
            'homes'  : (BuildContext context) => HomePages(),
            'task'  : (BuildContext context) => TaskPage(),
            'listActivityPage'  : (BuildContext context) => ListACtivityPage(),
            'activity'  : (BuildContext context) => ActivitiesPage(),
            'login'  : (BuildContext context) => LoginPage(),
          },
        ),
      ),
    );
  }
}