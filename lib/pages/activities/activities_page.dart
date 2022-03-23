import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:omni_datetime_picker/omni_datetime_picker.dart';
import 'package:task_aplicattion2/estilos/Colores_estilos.dart';
import 'package:task_aplicattion2/models/activity/activity_modelGet.dart';

class ActivitiesPage extends StatefulWidget {

  @override
  State<ActivitiesPage> createState() => _ActivitiesPageState();
}

class _ActivitiesPageState extends State<ActivitiesPage> {

  final formKey = GlobalKey<FormState>();
  final scaffoldkey = GlobalKey<ScaffoldState>();

  ActivityModelGet activityModelGet =  ActivityModelGet();
  Colores _colores = Colores();

  final DateFormat workerHistoryDateTimeFormat =
  DateFormat('2021-07-20T19:35:19.769891');
  DateTime date = DateTime.now().toUtc().add(const Duration(hours: -11));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       key: scaffoldkey,
      appBar: AppBar(
        backgroundColor: _colores.teal,
        title: Text('Crear Actividades',style: TextStyle(color:_colores.space ),),
        actions: [
        ],
        centerTitle: true,
      ),
        body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(left: 20,top: 20),
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Escoger fechas', style: TextStyle(color: _colores.black,fontWeight: FontWeight.bold,fontSize: 20)),
                SizedBox(height: 30),
                _buttonFechas(context,'Fecha de Inicio:'),
                SizedBox(height: 30,),
                _buttonFechas(context, 'Fecha final:'),

                // _crearName(),
                // Divider(),
                // _crearDescripcion(),
                // SizedBox(height: 20,),
                // _crearDisponible(context),
                // SizedBox(height: 20,),
                // _botonAgregar(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buttonFechas(BuildContext context, mensaje){
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          Text(mensaje,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15.0)),
          SizedBox(width: 10,),
         ElevatedButton(
          onPressed: () async{
            DateTime dateTime  = await showOmniDateTimePicker(
            context: context,
            is24HourMode: false,
            isShowSeconds: false,
            startInitialDate: date,
            startFirstDate: DateTime.now()
              .toLocal()
              .subtract(const Duration(days: 365)),
            startLastDate: DateTime.now().toUtc(),
            borderRadius: const Radius.circular(16),
            );
            log(dateTime.toString());
          },
          child: Text(workerHistoryDateTimeFormat.format(date)),
        ),
    
        ],
      ),
    );
  }

}