import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/ui_provider.dart';

class ScanButton extends StatelessWidget {



  @override
  Widget build(BuildContext context) {
    final uiProvider = Provider.of<UiProvider>(context);
    return FloatingActionButton(
      backgroundColor: Color.fromRGBO(238, 238, 238, 1),
      elevation: 0,
      onPressed: () {
          Navigator.pushNamed(context, 'task');  
      },
      child: Icon(Icons.add,color: Color.fromRGBO(57,62, 70, 1),),
    );
  }
}