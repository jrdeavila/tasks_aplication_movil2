import 'package:flutter/material.dart';

import 'login/login_bloc.dart';
export 'package:task_aplicattion2/blocs/login/login_bloc.dart';


class Providers  extends InheritedWidget{

  static Providers _instancia;
 
  factory Providers({Key key, Widget child}) {
    if (_instancia == null) {
      _instancia = new Providers._internal(key: key, child: child,);
    }
    return _instancia;
  }


  final loginBloc = LoginBLoc();

  Providers._internal({Key key, Widget child})
    :super(key: key, child: child);

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => true;


  static LoginBLoc of (BuildContext context){
    return context.dependOnInheritedWidgetOfExactType<Providers>().loginBloc;
  }


}