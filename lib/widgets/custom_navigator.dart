import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/ui_provider.dart';

class CustomNavigationBar extends StatelessWidget {


  @override
  Widget build(BuildContext context) {

    final uiProvider = Provider.of<UiProvider>(context);
    final currentIndex = uiProvider.selectedMenuOpt;

    Color colorIconos =  Color.fromRGBO(0, 173, 181, 1);

    return Padding(
      
      padding: EdgeInsets.only(bottom: 10),
      child: ClipRRect(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.0),
          topRight: Radius.circular(20.0),
        ),
        child: BottomNavigationBar(
          
          fixedColor: colorIconos,
          unselectedItemColor: Color.fromRGBO(238, 238, 238, 1) ,
          // unselectedLabelStyle: TextStyle(color: Colors.red),
          backgroundColor: Color.fromRGBO(57, 62, 70, 1),
          onTap: (int i) =>  uiProvider.selectedMenuOpt = i,
          currentIndex: currentIndex,
          elevation: 1,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.local_activity_outlined,color: colorIconos),
              label: 'Actividades',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.task_alt_outlined,color: colorIconos),
              label: 'Tareas',
            )
          ],
        ),
      ),
    );
  }


}