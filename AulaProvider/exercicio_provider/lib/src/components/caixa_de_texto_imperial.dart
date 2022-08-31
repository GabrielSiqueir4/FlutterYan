// ignore_for_file: prefer_const_constructors

import 'package:exercicio_provider/src/conversor_repository.dart/medida_repository.dart';
import 'package:exercicio_provider/src/models/medida_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';

class CaixaDeTextoImperial extends StatelessWidget {
  final caixaValores = ValueNotifier('');
  final caixaOpcoes = ['Pes', 'Jarda'];

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
                  hint: const Text(
                    'Medida Imperial',
                  ),
                 
                 isExpanded: true,
                  value: (value.isEmpty) ? null : value,
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
