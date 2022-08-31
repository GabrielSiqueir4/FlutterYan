import 'package:flutter/material.dart';

class MedidaNormalModel extends ChangeNotifier {
  String descricao;
  double quilometros;

  double metros;

  String nome;

  MedidaNormalModel({
    required this.descricao,
    required this.quilometros,
    required this.metros,
    required this.nome,
  });
}

class MedidaImperialModel extends ChangeNotifier {
  double pes;
  double jarda;
  String nome;
  String descricao;

  MedidaImperialModel({
    required this.descricao,
    required this.pes,
    required this.nome,
    required this.jarda,
  });
}
