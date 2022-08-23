import 'package:exercicio_provider/src/models/conversor_model.dart';
import 'package:exercicio_provider/src/view/conversor_view.dart';
import 'package:exercicio_provider/src/view/log_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => Conversor()),
      ],
      child: AppConversor(),
    ),
  );
}

class AppConversor extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Conversor de medidas",
      home: ConversorView(),
      routes: {
        "/Conversor": (context) => ConversorView(),
        "/Log":(context) =>LogView(),
      },
    );
  }
}
