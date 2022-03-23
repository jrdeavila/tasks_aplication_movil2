
import 'package:flutter/material.dart';
import 'package:pandabar/main.view.dart';
import 'package:pandabar/model.dart';
import 'package:provider/provider.dart';

import '../estilos/Colores_estilos.dart';
import '../providers/ui_provider.dart';



class ButtomNavigationBar extends StatelessWidget {

  String page = 'task';
  Colores _colores = Colores();

  @override
  Widget build(BuildContext context) {

    final uiProvider = Provider.of<UiProvider>(context);
    final currentIndex = uiProvider.selectedMenuOpt;

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
              uiProvider.selectedMenuOpt = 0;
                // Navigator.pushNamed(context, 'task');
            }
            if (page == 'task') {
              uiProvider.selectedMenuOpt = 1;
                // Navigator.pushNamed(context, 'activity');
            }
            // Navigator.pushNamed(context, routeName);
        },
        fabIcon: Icon(Icons.add),
        fabColors: [
          _colores.teal,
          _colores.grey,
        ],
        buttonSelectedColor: _colores.teal,
        backgroundColor: _colores.black,
        onFabButtonPressed: () {
          if (uiProvider.selectedMenuOpt ==1) {
            Navigator.pushNamed(context, 'task');
          }
          if(uiProvider.selectedMenuOpt ==0){
            Navigator.pushNamed(context, 'activity');
          }
        },
      );
  }
}