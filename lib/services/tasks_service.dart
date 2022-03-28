import 'package:dio/dio.dart';
import 'package:hotreloader/hotreloader.dart';

import '../models/tareas/task_modelGet.dart';
import '../models/tareas/task_modelPost.dart';

class TasksService {
  final String _url = 'http://192.168.1.97:3000';
  Dio dio = Dio();

  TaskModelPost task = new TaskModelPost();

  Future<int> crearTask(TaskModelPost task) async {
    final url = '$_url/tasks';

    final resp = await dio.post(url, data: taskModelToJson(task));

    print(resp.data);
    // print(resp.statusCode);
    return resp.statusCode;
  }

  Future<List<TaskModelGet>> cargarTasks() async {

    final url = '$_url/tasks';

    final resp = await dio.get(url);

    final List<TaskModelGet> tasks = [];
    //Imprimir array que llega
    // print(resp.data['data'][0]['id']);
      resp.data['data'].forEach((item) {
        // print(item);
        final prodTemp = TaskModelGet.fromJson(item);
        tasks.add(prodTemp);
      }
    );

    return tasks;
  }

  Future<List<TaskModelGet>> cargarTasksTrue() async {
    final url = '$_url/tasks';
    // Map<String, dynamic> query;

    final resp = await dio.get(url);

    final List<TaskModelGet> tasks = [];
    //Imprimir array que llega
    // print(resp.data['data'][0]['id']);
    resp.data['data'].forEach((item) {
      // print(item);
      final prodTemp = TaskModelGet.fromJson(item);
      tasks.add(prodTemp);
    }
    );
    return tasks;
  }

  Future<bool> editartask(TaskModelGet taskModelGet) async {
    final url = '$_url/tasks/${taskModelGet.id}';

   await dio.put(url, data: taskModelGetToJson(taskModelGet));

    return true;
  }

  Future<String> editarEstadoTask(String id)async{
    final url = '$_url/tasks/$id/status';
    await dio.put(url);

    return 'AQUIII';
  }

  Future<int> deleteTask(String id) async {
    final url = '$_url/tasks/$id';

   final resp = await dio.delete(url);


    return resp.statusCode;
  }
}
