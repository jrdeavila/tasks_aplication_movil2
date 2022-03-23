import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_aplicattion2/pages/tasks/task_page.dart';
import 'package:task_aplicattion2/widgets/buttom_bar.dart';

import '../providers/ui_provider.dart';
import 'activities/list_Activity_page.dart';
import 'tasks/list_tasks_page.dart';

class HomePages extends StatelessWidget {



  @override
  Widget build(BuildContext context) {
    return Scaffold(
    body: _HomePageBody(),
    bottomNavigationBar: ButtomNavigationBar(),
      // floatingActionButton: ScanButton(),
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
        return ListACtivityPage();

      case 1:
        return ListTaskPage();

      case 2:
        return TaskPage();


      default: 
        return ListTaskPage();

    }
  }
}