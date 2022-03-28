import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_aplicattion2/providers/snacbar_provider.dart';
import 'package:task_aplicattion2/services/tasks_service.dart';
import 'package:task_aplicattion2/widgets/AppBar_widget.dart';
import 'package:task_aplicattion2/widgets/snacbar_widget.dart';

import '../../estilos/Colores_estilos.dart';
import '../../models/tareas/task_modelGet.dart';

class ListTaskPage extends StatefulWidget {

  @override
  State<ListTaskPage> createState() => ListTaskPageState();
}

class ListTaskPageState extends State<ListTaskPage> {

  final tasksProvider = new TasksService();
  Colores _colores = Colores();
  bool loading = false;
  TasksService tasksService = TasksService();



 @override
 void initState() {
   tasksService.cargarTasks;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

  // final heroesInfo = Provider.of<SnacBarProvider>(context);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: appBar(title: 'Lista de tareas'),
      // body: Center(child: Text('Home Page'),),
      // floatingActionButton: _crearBoton(context),
      // floatingActionButton: ButtomNavigationBar(),

      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: _crearListado()
    );
  }

  Widget _crearListado(){
    return FutureBuilder(
      future: tasksProvider.cargarTasks(),
      builder: (BuildContext context, AsyncSnapshot<List<TaskModelGet>> snapshot){
        if (snapshot.hasData) {
          final tasks = snapshot.data;
          return ListView.builder(
            itemCount: tasks.length,
            itemBuilder: (context,i) => _crearItem(tasks[i],context)
          );

        }else{
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }



  Widget _crearItem( TaskModelGet task,BuildContext context){
    final snacbarProvider = Provider.of<SnacBarProvider>(context,listen: false);

    return Container(
      child: Dismissible(
        key: UniqueKey(),
        background: Container(
          color:  Colors.white,
        ),
        onDismissed: (direccion) async {
         snacbarProvider.selectedStatusCode = await tasksProvider.deleteTask(task.id);

        //  print(snacbarProvider.selectedStatusCode);
         mostrarSnacbar(
           status: snacbarProvider.selectedStatusCode,
           context: context,
            typeModel: 'task',
            typeConsult: 'delete'
         );

        },
        child: Column(
          children: [
            GestureDetector(
              onTap: (){
                 Navigator.pushNamed(context, 'task',arguments: task).then((value) {setState(() {
                   build(context);
                 });});
              },
              child: Container(
                margin: EdgeInsets.all(15),
                width: double.infinity,
                height: 80,
                child: Card(
                  elevation: 10,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // _crearDisponible(context,task),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container( padding: EdgeInsets.only(left: 10), child: Text('${task.name}',style: TextStyle(color: _colores.grey,fontWeight: FontWeight.bold))),
                          Container(padding: EdgeInsets.only(left: 10), child: Text(task.description == null ? '' : task.description,style: TextStyle(color: _colores.grey,fontWeight: FontWeight.w300),)),
                        ],
                      ),
                     _statusTask(context,task),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }


  Widget _statusTask(BuildContext context,TaskModelGet taskModelGet) {
    // print(tipo.toString());
      return Container(
        padding: EdgeInsets.only(right: 20),
        child: Switch(
          value: taskModelGet.status,
          activeColor: _colores.teal,
          onChanged:  (value)  async{
            await tasksProvider.editarEstadoTask(taskModelGet.id);
            setState(() {
              taskModelGet.status = value;
            });
          },
      ));
  }

}