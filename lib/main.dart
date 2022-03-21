import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_aplicattion2/pages/activity_page.dart';
import 'package:task_aplicattion2/pages/home_page.dart';
import 'package:task_aplicattion2/pages/home_pages.dart';
import 'package:task_aplicattion2/pages/task_page.dart';
import 'package:task_aplicattion2/providers/ui_provider.dart';

void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
   
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) =>  UiProvider())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Books',
        initialRoute: 'homes',
        routes: {
          'home'  : (BuildContext context) => HomePage(),
          'homes'  : (BuildContext context) => HomePages(),
          'task'  : (BuildContext context) => TaskPage(),
          'activity'  : (BuildContext context) => ActivityPage(),
        },
      ),
    );
  } 
}