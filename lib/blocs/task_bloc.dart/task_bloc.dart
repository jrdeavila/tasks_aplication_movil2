
import 'dart:async';

import 'package:rxdart/rxdart.dart';
import 'package:task_aplicattion2/blocs/task_bloc.dart/validators_task.dart';


class TaskBLoc with ValidatorsTask{

  final _nameController = BehaviorSubject<String>();
  final _descriptionController = BehaviorSubject<String>();


  //Recuperar los datos del stream
  Stream<String> get nameStream => _nameController.stream.transform(validarname);
  Stream<String> get descriptionStream => _descriptionController.stream.transform(validarDescription);

  // Stream<String> get  passwordStream => _passwordController.stream.transform(validarPassword);

  Stream<bool> get formValidStream =>
      Rx.combineLatest2(nameStream, descriptionStream, (e, p) => true);

  //Insertar valores al Stream
  Function(String) get changeEmail => _nameController.sink.add;
  Function(String) get changePassword => _descriptionController.sink.add;

  //obtener el ultimo valor ingresar a los streams

  String get email => _nameController.value;

  String get password => _descriptionController.value;


  dispose() {
    _nameController.close();
    _descriptionController.close();

  }
}



