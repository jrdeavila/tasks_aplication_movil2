
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

class SnacBarProvider extends ChangeNotifier {
  int _mensajeCode = 1;

  int get selectedStatusCode {
    return _mensajeCode;
  }

  set selectedStatusCode( int i ){

    _mensajeCode = i;

    notifyListeners();
  }
}