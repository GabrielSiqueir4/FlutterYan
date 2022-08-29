// ignore_for_file: prefer_const_constructors

import 'package:exercicio_provider/src/components/caixa_de_texto.dart';
import 'package:flutter/material.dart';

class ConversorView extends StatelessWidget {
  String dropdownValue = 'One';

  ConversorView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Conversor'),
      ),
      resizeToAvoidBottomInset: false,
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Padding(
          padding:  EdgeInsets.only(top: 100, left: 30, right: 30, bottom: 20),
          child: ListView(
            children: [
              Image.asset(
                'lib/assets/medidas.png',
                width: 150,
                height: 150,
              ),
              SizedBox(height: 50),
              CaixaDeTexto(),
              SizedBox(height: 10),
              CaixaDeTexto(),         //caixa de texto componentizada
              SizedBox(height: 50),
              ElevatedButton(
                style: ButtonStyle(),
                onPressed: () {},
                child: const Text('CONVERTER'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
