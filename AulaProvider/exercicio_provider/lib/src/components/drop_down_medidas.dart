// ignore_for_file: prefer_const_constructors
import 'package:exercicio_provider/src/controller/calculo_controller.dart';
import 'package:exercicio_provider/src/models/calculo_model.dart';
import 'package:flutter/material.dart';

class CaixaDeTexto extends StatelessWidget {
  final caixaValores = ValueNotifier('');

  final caixaOpcoesFrom = ['Pes', 'Jarda'];
  final caixaOpcoesTo = ['Metro', 'Quilometro'];

 //CaixaDeTexto(CalculoController calculo);

  CaixaDeTexto(CalculoController calculo) {
    this.calculo = calculo;
  }

  late CalculoController calculo;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Converter de',
          style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.bold, color: Colors.blue),
        ),
        SizedBox(height: 20),
        ValueListenableBuilder(
            valueListenable: caixaValores,
            builder: (BuildContext context, String value, _) {
              return DropdownButton<String>(
                hint: const Text(
                  'Medida Imperial',
                ),
                isExpanded: true,
                value: (calculo.getNomeFrom.toString()),
                onChanged: (escolha) =>
                    calculo.setNomeFrom(escolha.toString(),),
                items: caixaOpcoesFrom
                    .map((op) => DropdownMenuItem(
                          value: op,
                          child: Text(op),
                        ))
                    .toList(),
              );
            }),
        SizedBox(height: 20),
        Text(
          'Para',
          style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.bold, color: Colors.blue),
        ),
        ValueListenableBuilder(
            valueListenable: caixaValores,
            builder: (BuildContext context, String value, _) {
              return DropdownButton<String>(
                hint: const Text('Medida Normal'),
                value: (calculo.getNomeTo.toString()),
                isExpanded: true,
                onChanged: (escolha) => calculo.setNomeTo(escolha.toString(),),
                items: caixaOpcoesTo
                    .map((op) => DropdownMenuItem(
                          value: op,
                          child: Text(op),
                        ))
                    .toList(),
              );
            }),
      ],
    );
  }
}
