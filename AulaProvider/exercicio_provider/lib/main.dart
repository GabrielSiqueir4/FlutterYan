import 'package:exercicio_provider/src/conversor_repository.dart/medida_repository.dart';
import 'package:exercicio_provider/src/models/medida_model.dart';
import 'package:exercicio_provider/src/views/bottom_navigation_view.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

//* ChangeNotifierProvider : provedor de notificação  de mudança - objetivo do provider é instanciar somente   uma vez, e conseguir utilizar a classe (conversor) no app inteiro

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) {
            MedidaImperialRepository.tabela;
          },
        ),
        ChangeNotifierProvider(
          create: (context) {
            MedidaNormalRepository.tabela;
          },
        )
      ],
      child: AppConversor(),
      // passa a aplicação que ira iniciar como filho do provider
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
