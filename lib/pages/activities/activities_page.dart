import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:task_aplicattion2/estilos/Colores_estilos.dart';
import 'package:task_aplicattion2/models/activity/activity_modelGet.dart';
import 'package:task_aplicattion2/providers/task_provider.dart';

import '../../widgets/list_tasks_status.dart';

class ActivitiesPage extends StatefulWidget {

  @override
  State<ActivitiesPage> createState() => _ActivitiesPageState();
}

class _ActivitiesPageState extends State<ActivitiesPage> {

  final formKey = GlobalKey<FormState>();
  final scaffoldkey = GlobalKey<ScaffoldState>();


  ActivityModelGet activityModelGet =  ActivityModelGet();
  Colores _colores = Colores();
  DateTime dateTime;
  DateTime dateTime2;

  @override
  void initState() {
      super.initState();
  }

  @override
  Widget build(BuildContext context) {

    final taskProvider = Provider.of<TaskProvider>(context,listen: false);


    setState(() {
      taskProvider.selectedTask;
    });
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
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Form(
            key: formKey,
            child: Column(
              children: [
                SizedBox(height: 30),
                title('Escoger fechas'),
                SizedBox(height: 30),
                title('Fecha de Inicio'),
                buttonFecha(context,dateTime,'inicio'),
                SizedBox(height: 30),
                title('Fecha final'),
                buttonFecha(context,dateTime2,'final'),
                SizedBox(height: 30),
                buttonTareas(context),
                SizedBox(height: 30),
                cardSeleccionada()
              ],
            ),
          ),
        ),
      ),
    );



  }

  Widget buttonFecha(BuildContext context,DateTime _dateTime,String fecha){
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: _colores.grey
      ),
      onPressed: (){
        if (fecha=='inicio') {
          print('inicio');
        }
        pickDateTime(context,_dateTime, fecha);
      },
      child: Text(getText(fecha))
    );
  }


  Widget title(String mensaje){
  return Container(
    alignment: Alignment.bottomCenter, child:
    Text(mensaje, style: TextStyle(color: _colores.black,fontWeight: FontWeight.bold,fontSize: 20)));
  }

  Future pickDateTime(BuildContext context,_dateTime,fecha) async {

    if (fecha=='inicio') {
      final date = await pickDate(context);
      if (date == null) return;

      final time = await pickTime(context);
      if (time == null) return;
      setState(() {
        dateTime = DateTime(
          date.year,
          date.month,
          date.day,
          time.hour,
          time.minute,
        );
      });
    }

  if (fecha =='final') {
      final date2 = await pickDate(context);
      if (date2 == null) return;

      final time2 = await pickTime(context);
      if (time2 == null) return;
      setState(() {
        dateTime2 = DateTime(
          date2.year,
          date2.month,
          date2.day,
          time2.hour,
          time2.minute,
        );
      });
    }
  }

  String getText(String fecha){
    if (fecha=='inicio') {
      if (dateTime == null) {
        return 'Select DateTime';
      }else{
        return DateFormat('yyyy-MM-ddTHH:mm:ss').format(dateTime);
      }
    }
    if (fecha=='final') {
      if (dateTime2 == null) {
        return 'Select DateTime';
      }else{
        return DateFormat('yyyy-MM-ddTHH:mm:ss').format(dateTime2);
      }
    }
  }

  Future<DateTime> pickDate(BuildContext context) async {
    final initialDate = DateTime.now();
    final newDate = await showDatePicker(
      context: context,
      initialDate: dateTime ?? initialDate,
      firstDate: DateTime(DateTime.now().year - 5),
      lastDate: DateTime(DateTime.now().year + 5),
    );

    if (newDate == null) return null;

    return newDate;
  }

 Future<TimeOfDay> pickTime(BuildContext context) async {
    final initialTime = TimeOfDay(hour: 9, minute: 0);
    final newTime = await showTimePicker(
      context: context,
      initialTime: dateTime != null
        ? TimeOfDay(hour: dateTime.hour, minute: dateTime.minute,)
        : initialTime,
    );

  if (newTime == null) return null;

  return newTime;
  }

  Widget buttonTareas(BuildContext context) {

    return ElevatedButton(
      onPressed: (){

        // modalProvider.selectedModal = showMaterialDialog(context);

        // alertDialog(context);
        showMaterialDialog(context);
      },
      child: Text('Seleccionar tarea')
    );
  }

  Widget cardSeleccionada() {
    final taskProvider = Provider.of<TaskProvider>(context,listen: false);
    // final blocActivitiesProvider = ProvidersActivities.of(context);

    return  Container(
      width: 300,
      height: 70,
      child: Card(
        child: Center(child:
         Text(taskProvider.selectedTask.name,
         style: TextStyle(fontWeight: FontWeight.bold)),
      ),
    ));
  }


}