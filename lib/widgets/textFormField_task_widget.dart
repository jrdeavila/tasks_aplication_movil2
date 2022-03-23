import 'package:flutter/material.dart';
import 'package:task_aplicattion2/estilos/Colores_estilos.dart';
import 'package:task_aplicattion2/models/tareas/task_modelGet.dart';
import 'package:task_aplicattion2/models/tareas/task_modelPost.dart';

Widget formField(
{
    TaskModelGet taskModelGet,
    TaskModelPost taskModelPost,
    String labelText,
    String hintext,
    String validatorTrue,
    String validatorFalse,
    Icon icon,
    String type,
}

  ) {
    Colores colores = Colores();
    return TextFormField(
      textCapitalization: TextCapitalization.sentences,
      initialValue:
        taskModelGet == null ? type=='name' ? taskModelPost.name:taskModelPost.description: type=='descripcion' ? taskModelGet.description : taskModelGet.name,
      decoration: InputDecoration(
        labelText: labelText,
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: colores.grey),
        ),
        icon: icon,
        hintText: hintext,
        labelStyle: TextStyle(color: colores.grey),
      ),
      onSaved: (value) =>
           taskModelGet == null
          ? type=='name' ? taskModelPost.name = value  : taskModelPost.description = value
          : type=='descripcion' ? taskModelGet.description = value :taskModelGet.description = value,
      validator: (value) {
        if (value.length < 1) {
          if (value.length > 45) {
            return validatorTrue;
          }
          return validatorFalse;
        } else {
          return null;
        }
      },
    );
  }