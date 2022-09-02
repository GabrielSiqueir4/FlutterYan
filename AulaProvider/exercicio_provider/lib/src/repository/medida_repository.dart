import 'package:exercicio_provider/src/models/medida_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class MedidaNormalRepository {
  static List<MedidaNormalModel> tabela = [
    MedidaNormalModel(
      descricao: 'Valor Do Quilometro Para:',
      quilometros: 1,
      metros: 1000,
      nome: 'Quilometro',
    ),
  ];
}

class MedidaImperialRepository {
  static List<MedidaImperialModel> tabela = [
    MedidaImperialModel(
      descricao: 'Valor Do Metro Para: ',
      pes: 3.28084,
      nome: 'Metro',
      jarda: 1.09361,
    ),


    
    MedidaImperialModel(
      descricao: 'Valor Da Jarda Para:',
      pes: 3,
      nome: 'Jarda',
      jarda: 1,
    ),
    
  ];
}