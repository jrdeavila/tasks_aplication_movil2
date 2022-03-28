// import 'package:flutter/material.dart';

// import 'activities_bloc.dart';
// export 'package:task_aplicattion2/blocs/login/login_bloc.dart';


// class ProvidersActivities  extends InheritedWidget{

//   static ProvidersActivities _instancia;
 
//   factory ProvidersActivities({Key key, Widget child}) {
//     if (_instancia == null) {
//       _instancia = new ProvidersActivities._internal(key: key, child: child,);
//     }
//     return _instancia;
//   }


//   final activitiesBloc = ActivitiesBloc();


//   ProvidersActivities._internal({Key key, Widget child})
//     :super(key: key, child: child);

//   @override
//   bool updateShouldNotify(InheritedWidget oldWidget) => true;



//   static ActivitiesBloc of (BuildContext context){
//     return context.dependOnInheritedWidgetOfExactType<ProvidersActivities>().activitiesBloc;
//   }
// }