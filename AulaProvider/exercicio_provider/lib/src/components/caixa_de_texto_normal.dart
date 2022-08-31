// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class CaixaDeTextoNormal extends StatelessWidget {
  final caixaValores = ValueNotifier('');
  final caixaOpcoes = ['Metros', 'Quilometros'];

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 1,
          child: ValueListenableBuilder(
              valueListenable: caixaValores,
              builder: (BuildContext context, String value, _) {
                return DropdownButton<String>(
                  hint: const Text('Medida Normal'),
                  value: (value.isEmpty) ? null : value,
                  isExpanded: true,
                  onChanged: (escolha) =>
                      caixaValores.value = escolha.toString(),
                  items: caixaOpcoes
                      .map((op) => DropdownMenuItem(
                            value: op,
                            child: Text(op),
                          ))
                      .toList(),
                );
              }),
        ),
      ],
    );
  }
}
