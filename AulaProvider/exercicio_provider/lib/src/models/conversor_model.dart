import 'package:flutter/material.dart';

class Conversor extends ChangeNotifier {
  double? _valor;
  String? _descricao;
  String? _nome;
  String? _medidaimperial;

  final List<String> _medidas = <String>[];

  void set nome(String? nome) {
    _nome = nome;
    notifyListeners();
  }

  void set descricao(String? descricao) {
    _descricao = descricao;
    notifyListeners();
  }

  void set valor(double? valor) {
    _valor = valor;
    notifyListeners(); 
  }

  void set medidaimperial(String? medidaimperial) {
    _medidaimperial = medidaimperial;
    notifyListeners();
  }

  void set onChangeMedidas(String medida) {
    if (medidas!.contains(medida)) {
      medidas?.remove(medida);
    } else {
      medidas?.add(medida);
    }
    notifyListeners();
  }

  void set medidas(List<String>? medidas) {
    _medidas?.addAll(medidas!);
    notifyListeners();
  }

  String? get nome => _nome;
  String? get descricao => _descricao;
  double? get valor => _valor;
  List<String>? get medidas => _medidas;
  String? get medidaimperial => _medidaimperial;
}
