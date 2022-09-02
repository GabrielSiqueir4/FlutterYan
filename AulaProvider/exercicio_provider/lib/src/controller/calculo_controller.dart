import 'package:exercicio_provider/src/models/calculo_model.dart';
import 'package:flutter/cupertino.dart';

class CalculoController extends ChangeNotifier {
 Calculo calculo = Calculo(0,'Pes','Quilometro', 0);

  get getInput => calculo.input;

  void setInput(input) {
    calculo.input = input;
    notifyListeners();
  }

  get getNomeFrom => calculo.nomeFrom;

  void setNomeFrom(nomeFrom) {
    calculo.nomeFrom = nomeFrom;
    notifyListeners();
  }

  get getNomeTo => calculo.nomeTo;

  set setNomeTo(nomeTo) {
    calculo.nomeFrom = nomeTo;
    notifyListeners();
  }

  get getResultado => calculo.resultado;

  set setResultado(resultado) {
    calculo.resultado = resultado;
    notifyListeners();
  }

  
}
