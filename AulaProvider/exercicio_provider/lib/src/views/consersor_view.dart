// ignore_for_file: prefer_const_constructors

import 'package:exercicio_provider/src/components/text_field_valor.dart';
import 'package:exercicio_provider/src/components/drop_down_medidas.dart';
import 'package:exercicio_provider/src/controller/calculo_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ConversorView extends StatelessWidget {
  ConversorView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Conversor De Medidas',
        ),
      ),
      resizeToAvoidBottomInset: false,
      body: Consumer<CalculoController>(
        builder: (context, calculo, child) {
          return SingleChildScrollView(
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: Padding(
                padding:
                    EdgeInsets.only(top: 60, left: 30, right: 30, bottom: 20),
                child: Column(
                  children: [
                    Image.asset(
                      'lib/assets/medidas.png',
                      width: 150,
                      height: 150,
                    ),
                    SizedBox(height: 50),
                    CaixaDeValor(), //classe que traz minha caixa de valor
                    SizedBox(height: 40),
                    CaixaDeTexto(calculo), //classe que traz meu dropdown button //caixa de texto componentizada
                    SizedBox(height: 40),
                    Center(
                      child: ElevatedButton(
                        style: ButtonStyle(),
                        onPressed: () {},
                        child: const Text('CONVERTER'),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
