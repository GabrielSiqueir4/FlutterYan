import 'package:flutter/material.dart';

import '../components/my_menu_component.dart';

class ChamadosView extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          MyMenu()
        ],
        title: Text("Listagem de chamados"),
      ),
      body: Center(child: Text("Tela de listagem de chamados")),
    );
  }
}