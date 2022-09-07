import 'package:flutter/material.dart';

class Conversao {
  double? _valorConvertido = 0;
  double? _valorPassado = 0;
  String? _dropDownValue = 'Milhas';
  String? _dropDownValue2 = 'Quilômetros';

  Conversao();

  double? get valorConvertido => _valorConvertido;
  double? get valorPassado => _valorPassado;
  String? get dropDownValue => _dropDownValue;
  String? get dropDownValue2 => _dropDownValue2;

  set valorConvertido(double? valor) {
    _valorConvertido = valor;
  }

  set valorPassado(double? valor) {
    _valorPassado = valor;
  }

  set dropDownValue(String? valor) {
    _dropDownValue = valor;
  }

  set dropDownValue2(String? valor) {
    _dropDownValue2 = valor;
  }

  double converteMedida() {
    print("funcionou");
    return 0;
  }

  double converteMilhaKm() {
    return _valorConvertido = _valorPassado! * 1.609;
  }

  double converteMilhaCm() {
    return _valorConvertido = _valorPassado! * 160934;
  }

  double converteJardaKm() {
    return _valorConvertido = _valorPassado! * 00009144;
  }

  double converteJardaCm() {
    return _valorConvertido = _valorPassado! * 0091;
  }

  @override
  String toString() {
    return _valorConvertido.toString();
  }
}