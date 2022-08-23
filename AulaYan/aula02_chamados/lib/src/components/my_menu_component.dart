 
import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';

class MyMenu extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      itemBuilder: ((context) {
        return <PopupMenuItem>[
          const PopupMenuItem(
            child: Text("Chamados"),
            value: "/chamados",
          ),
          const PopupMenuItem(
            child: Text("Cadastro"),
            value: "/cadastro",
          )
        ];
      }),
      onSelected: (value){
        Navigator.of(context).pop();
        Navigator.of(context).pushNamed(value.toString());
      },
    );
  }
}