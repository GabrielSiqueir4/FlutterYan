import 'package:exercicio_provider/src/models/conversor_model.dart';
import 'package:exercicio_provider/src/views/consersor_view.dart';
import 'package:exercicio_provider/src/views/log_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

//* ChangeNotifierProvider : provedor de notificação  de mudança - objetivo do provider é instanciar somente   uma vez, e conseguir utilizar a classe (conversor) no app inteiro

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ConversorModel(centimetros: 00, descricao: 'teste', jarda: 00, metros: 00, milha: 00,milimetro: 00,nome: 'teste', pes: 00, polegadas: 00, quilometros: 100)),  
      ],
      child: AppConversor(),            // passa a aplicação que ira iniciar como filho do provider
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
      home: ConversorView(),
      routes: {
        "/Conversor": (context) => ConversorView(),
        "/Log":(context) =>LogView(),
      },
    );
  }
}
