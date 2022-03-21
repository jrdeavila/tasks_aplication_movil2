import 'package:flutter/material.dart';

import '../models/tareas/task_modelGet.dart';
import '../providers/tasks_providers.dart';

class HomePage extends StatefulWidget {

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final tasksProvider = new TasksProvider();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // body: Center(child: Text('Home Page'),),
      
      // floatingActionButton: _crearBoton(context),
      // floatingActionButton: ButtomNavigationBar(),

      
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: _crearListado()
    );
    
  }

  // Widget _crearBoton(BuildContext context){
  //   return FloatingActionButton(
  //     onPressed: (){
  //       Navigator.pushNamed(context, 'task').then((value) => initState);
  //     },
  //     child: Center(child: Icon(Icons.add)),
  //     backgroundColor: Color.fromRGBO(57, 62, 70, 1),
  //   );
  // }


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
                    Text('${task.name}',style: TextStyle(color: Color.fromRGBO(57, 62, 70, 1),fontWeight: FontWeight.bold)),
                    Text(task.description,style: TextStyle(color: Color.fromRGBO(0, 173, 181, 1)),),
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