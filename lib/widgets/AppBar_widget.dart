import 'package:flutter/material.dart';
import 'package:task_aplicattion2/estilos/Colores_estilos.dart';

Widget appBar({String title}){
  Colores _colores = Colores();
  return AppBar(
      backgroundColor: _colores.grey,
      elevation: 0,
      title: Text(title),
      actions: [
        IconButton(
          onPressed: (){},
          icon: Icon(Icons.search)
        )
      ],
    );
}