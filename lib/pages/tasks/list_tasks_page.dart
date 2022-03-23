import 'package:flutter/material.dart';
import 'package:task_aplicattion2/widgets/AppBar_widget.dart';

import '../../estilos/Colores_estilos.dart';
import '../../models/tareas/task_modelGet.dart';
import '../../providers/tasks_providers.dart';

class ListTaskPage extends StatefulWidget {

  @override
  State<ListTaskPage> createState() => ListTaskPageState();
}

class ListTaskPageState extends State<ListTaskPage> {

  final tasksProvider = new TasksProvider();
  Colores _colores = Colores();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
    return Container(
      child: Dismissible(
        key: UniqueKey(),
        background: Container(
          color:  Color.fromRGBO(57, 62, 70, 1),
        ),
        // onDismissed: (direccion){
        //   tasksProvider.borrarProducto(producto.id);
        // },
        child: Column(
          children: [
            GestureDetector(
              onTap: (){
                 Navigator.pushNamed(context, 'task',arguments: task);
              },
              child: Container(
                margin: EdgeInsets.all(15),
                width: double.infinity,
                height: 70,
                child: Card(
                  elevation: 10,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                    Text('${task.name}',style: TextStyle(color: _colores.grey,fontWeight: FontWeight.bold)),
                    Text(task.description,style: TextStyle(color: _colores.teal),),
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

  void initState() {
    setState(() {
    });
  }
}