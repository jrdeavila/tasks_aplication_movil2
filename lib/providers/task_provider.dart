
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:task_aplicattion2/models/tareas/task_modelGet.dart';

class TaskProvider extends ChangeNotifier {
  TaskModelGet _taskModelGet = TaskModelGet();

  TaskModelGet get selectedTask {
    return _taskModelGet;
  }

  set selectedTask( TaskModelGet taskModelGet ){

    _taskModelGet = taskModelGet;

    notifyListeners();
  }
}