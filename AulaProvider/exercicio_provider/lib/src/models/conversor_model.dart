import 'package:flutter/material.dart';

class ConversorModel extends ChangeNotifier {
  final String descricao;
  final double milha;
  final double quilometros;
  final double pes;
  final double metros;
  final double centimetros;
  final double polegadas;
  final double jarda;
  final String nome;
  final double milimetro;

  ConversorModel({                        //falta fazer das outras medidas
    required this.descricao,
    required this.milha,
    required this.quilometros,
    required this.pes,
    required this.metros,
    required this.centimetros,
    required this.polegadas,
    required this.nome,
    required this.jarda,
    required this.milimetro,
  });

  static List<ConversorModel> getConversor() {
    return <ConversorModel>[
      ConversorModel(
          nome: 'Quilometro',
          descricao: 'Valor do quilometro para cada medida',
          milha: 062,
          quilometros: 1,
          pes: 328083,
          metros: 1000,
          centimetros: 100000,
          polegadas: 393701,
          jarda: 1093613888889,
          milimetro: 1000000540),
          
      ConversorModel(
          nome: 'Milhas',
          descricao: 'Valor da milha para cada medida',
          milha: 1,
          quilometros: 1.60,
          pes: 0.05,
          metros: 1609.34,
          centimetros: 160933.99,
          polegadas: 63359.84,
          jarda: 1759.995,
          milimetro: 1609339.99),
    ];
  }
}
