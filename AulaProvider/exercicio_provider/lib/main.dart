import 'package:exercicio_provider/src/controller/ConversaoController.dart';
import 'package:exercicio_provider/src/controller/SalvarLogController.dart';
import 'package:exercicio_provider/src/views/bottom_navigation_view.dart';
import 'package:exercicio_provider/src/views/consersor_view.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

//* ChangeNotifierProvider : provedor de notificação  de mudança - objetivo do provider é instanciar somente   uma vez, e conseguir utilizar a classe (conversor) no app inteiro

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: ((context) => ConversaoController())),
        ChangeNotifierProvider(create: (context) => SalvaLogController())
      ],
      child: AppConversor(),
    ),
  );
}

class AppConversor extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      title: "Conversor de medidas",
      home: HomePage(),
    );
  }
}
