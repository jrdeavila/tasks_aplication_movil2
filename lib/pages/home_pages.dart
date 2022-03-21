import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_aplicattion2/pages/task_page.dart';

import '../providers/ui_provider.dart';
import '../widgets/custom_navigator.dart';
import '../widgets/scan_button.dart';
import 'activity_page.dart';
import 'home_page.dart';

class HomePages extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    appBar: AppBar(
      backgroundColor: Color.fromRGBO(57, 62, 70, 1),
      elevation: 0,
      title: Text('Apps Task'),
      actions: [
        IconButton(
          onPressed: (){},
          icon: Icon(Icons.search)
        )
      ],
    ),
    body: _HomePageBody(),
    bottomNavigationBar: CustomNavigationBar(),
      floatingActionButton: ScanButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

  );
  }
}

class _HomePageBody extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    //obtener el selects menu opt
    final uiProvider = Provider.of<UiProvider>(context); 

    //Cambiar para mostrar la pagina respectiva
    final currentIndex = uiProvider.selectedMenuOpt;

    switch(currentIndex){

      case 0:
        return ActivityPage();

      case 1:
        return HomePage();

      case 2:
        return TaskPage();


      default: 
        return HomePage();

    }

    //Obtener el select menu opt
    // final uiProvider = Provider.of<UiProvider>(context);

    
    // switch(currentIndex) {

    //   case 0:
    //   return TaskPage();

    //   case 1: 
    //     return ActivityPage();
      

    //   default:
    //     return HomePages();
    // }

  }
}