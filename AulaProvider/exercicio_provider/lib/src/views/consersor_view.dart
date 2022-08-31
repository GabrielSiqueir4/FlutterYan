// ignore_for_file: prefer_const_constructors

import 'package:exercicio_provider/src/components/caixa_de_texto_imperial.dart';
import 'package:exercicio_provider/src/components/caixa_de_texto_normal.dart';
import 'package:flutter/material.dart';

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
      body: SingleChildScrollView(
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Padding(
            padding: EdgeInsets.only(top: 100, left: 30, right: 30, bottom: 20),
            child: Column(
              children: [
                Image.asset(
                  'lib/assets/medidas.png',
                  width: 200,
                  height: 200,
                ),
                SizedBox(height: 50),
                Text(
                  'Valor:',
                  style: TextStyle(fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color:  Colors.blue
                  ),
                ),
                TextField(
                  decoration: InputDecoration(
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue),
                    ),
                    
                  ),
                ),
                SizedBox(height: 50),
                Text(
                  'Converter de',
                  style: TextStyle(fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color:  Colors.blue
                  ),
                ),
                CaixaDeTextoImperial(),
                SizedBox(height: 20),
                Text(
                  'Para',
                  style: TextStyle(fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color:  Colors.blue
                  ),
                ),
                CaixaDeTextoNormal(),
                //CaixaDeTexto(), //caixa de texto componentizada
                SizedBox(height: 80),
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
      ),
    );
  }
}
