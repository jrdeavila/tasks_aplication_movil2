
import 'package:flutter/material.dart';
import 'package:pandabar/main.view.dart';
import 'package:pandabar/model.dart';



class ButtomNavigationBar extends StatelessWidget {

   String page = 'task';

  @override
  Widget build(BuildContext context) {

  //  final uiProvider = Provider.of<UiProvider>(context);
  //  final currenIndex = uiProvider.selectedMenuOpt;

    
    return PandaBar(

        buttonData: [
          PandaBarButtonData(
            id: 'task',
            icon: Icons.task_outlined,
            title: 'Tareas'
          ),
          
          PandaBarButtonData(
            id: 'activity',
            icon: Icons.local_activity_outlined,
            title: 'Actividades',
          ),
          PandaBarButtonData(
            id: 'favoritas',
            icon: Icons.star,
            title: 'Favoritas',
          ),
          
        ],
        onChange: (id) {

            page = id;
            if (page=='activity') {
              
                Navigator.pushNamed(context, 'activity');
            }
            if (page == 'task') {
                Navigator.pushNamed(context, 'home');
            }
            // Navigator.pushNamed(context, routeName);
        },
        fabIcon: Icon(Icons.add),
        fabColors: [
          Color.fromRGBO(0, 173, 181, 1),
          Color.fromRGBO(57, 62, 70, 1),
        ],
        buttonSelectedColor: Color.fromRGBO(0, 173, 181, 1),
        backgroundColor: Color.fromRGBO(34, 40, 49, 1),
        onFabButtonPressed: () {
          Navigator.pushNamed(context, 'task');
        },
      );
  }
}