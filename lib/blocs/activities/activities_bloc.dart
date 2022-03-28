
// import 'dart:async';

// import 'package:rxdart/rxdart.dart';
// import 'package:task_aplicattion2/blocs/activities/validators_activities.dart';
// import 'package:task_aplicattion2/models/tareas/task_modelGet.dart';


// class ActivitiesBloc with ValidatorsAvtivities{

//   final _task = BehaviorSubject<TaskModelGet>();


//   //Recuperar los datos del stream
//   Stream<TaskModelGet> get taskStream => _task.stream.transform(validartask);



//   //Insertar valores al Stream
//   Function(TaskModelGet) get changeTask => _task.sink.add;

//   //obtener el ultimo valor ingresar a los streams

//   TaskModelGet get email => _task.value;



//   dispose() {
//     _task.close();

//   }
// }



