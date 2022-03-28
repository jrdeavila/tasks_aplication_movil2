
import 'package:flutter/material.dart';

class WidgetModalProvider extends ChangeNotifier {
  Widget widget;
  // String _heroe ='Aqui';
  BuildContext context;

  // String get heroe {
  //   return _heroe;
  // }

  Widget get widgetModal {
    return widget;
  }



  set selectedModal( Widget nombre ){
    widget = nombre;


    // Widget _showMaterialDialog() {
    // showDialog(
    //   context: context,
    //   builder: (context) {
    //     return widget;
    //   });
    // }
    notifyListeners();
  }


}