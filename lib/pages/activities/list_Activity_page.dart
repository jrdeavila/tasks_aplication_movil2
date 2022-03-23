import 'package:flutter/material.dart';
import 'package:task_aplicattion2/widgets/AppBar_widget.dart';

class ListACtivityPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(title: 'Lista de Actividades'),
      body: Center(child: Text('List Activity')),
    );
  }
}