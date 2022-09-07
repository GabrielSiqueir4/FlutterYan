// ignore_for_file: prefer_const_constructors
import 'package:exercicio_provider/src/controller/ConversaoController.dart';
import 'package:exercicio_provider/src/controller/SalvarLogController.dart';
import 'package:exercicio_provider/src/models/Conversao_Model.dart';
import 'package:exercicio_provider/src/models/SalvarLog_Model.dart';
import 'package:exercicio_provider/src/views/log_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class ConversorView extends StatelessWidget {
  @override
  String dropdownValue = 'Milhas';
  String dropdownValue2 = 'Quilômetros';
  double top = 0.0;
  double valorConversao = 0;
  int _selectedIndex = 0;

  List<String> imperiais = ["Milhas", "Jardas"];

  Conversao C = new Conversao();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //flecha para voltar a pagina
        title: Text("Conversor de Medidas",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
      ),
      
      resizeToAvoidBottomInset: false,
      body: Consumer<ConversaoController>(
        builder: (context, conversao, child) {
          return SingleChildScrollView(
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: Padding(
                padding:
                    EdgeInsets.only(top: 60, left: 30, right: 30, bottom: 20),
                child: Column(
                  children: [
                    Image.asset(
                      'lib/assets/medidas.png',
                      width: 150,
                      height: 150,
                    ),
                    SizedBox(height: 50),
                    //
                    TextField(
                      
                      inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.digitsOnly
                      ],
                      keyboardType: TextInputType.number,
                      textAlign: TextAlign.center,
                      
                      decoration: InputDecoration(
                          hintText: "Insira Um Valor",),
                      onSubmitted: (String value) {
                        conversao.valorPassado = double.parse(value);
                      },
                      onChanged: (String value) {
                        conversao.valorPassado = double.parse(value);
                      },
                    ),
//
                    SizedBox(height: 40),
                    Text(
                      "Converter de",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),

                    SizedBox(
                      width: 400,
                      child: Container(
                        child: DropdownButton<String>(
                          isExpanded: true,
                          iconEnabledColor: Colors.blue,
                          value: conversao.dropDownValue,
                          icon: const Icon(Icons.arrow_drop_down_outlined),
                          elevation: 16,
                          style: const TextStyle(
                              color: Colors.blue,
                              fontSize: 15,
                              fontWeight: FontWeight.bold),
                          underline: Container(
                            height: 2,
                            color: Colors.blue,
                          ),
                          onChanged: (String? newValue) {
                            conversao.dropDownValue = newValue!;
                          },
                          items: <String>[
                            'Milhas',
                            'Jardas',
                          ].map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                        ),
                      ),
                    ),

                    Text(
                      "Para",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),

                    SizedBox(
                      width: 400,
                      child: Container(
                        child: DropdownButton<String>(
                          isExpanded: true,
                          iconEnabledColor: Colors.blue,
                          value: conversao.dropDownValue2,
                          icon: const Icon(Icons.arrow_drop_down_outlined),
                          elevation: 16,
                          style: const TextStyle(
                              color: Colors.blue,
                              fontSize: 15,
                              fontWeight: FontWeight.bold),
                          underline: Container(
                            height: 2,
                            color: Colors.blue,
                          ),
                          onChanged: (String? newValue) {
                            conversao.dropDownValue2 = newValue!;
                          },
                          items: <String>['Quilômetros', 'Centímetros']
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                        ),
                      ),
                    ),

                    Padding(
                      padding: EdgeInsets.only(top: 20.0),
                      child: TextButton(
                        style: TextButton.styleFrom(
                          backgroundColor: Color.fromARGB(255, 85, 49, 248),
                          elevation: 15,
                        ),
                        child: Text(
                          'Converter',
                          style: TextStyle(
                              color: Color.fromARGB(255, 255, 255, 255),
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        ),
                        onPressed: () {
                          if (dropdownValue2.contains('Quilômetros') &&
                              dropdownValue.contains('Milhas')) {
                            valorConversao =
                                conversao.getConversao.converteMilhaKm();
                            conversao.valorConvertido = valorConversao;
                            SalvaLog.setValoreslog(valorConversao.toString());
                          } else if (dropdownValue2.contains('Quilômetros') &&
                              dropdownValue.contains('Jardas')) {
                            valorConversao =
                                conversao.getConversao.converteJardaKm();
                            conversao.valorConvertido = valorConversao;
                          } else if (dropdownValue2.contains('Centímetros') &&
                              dropdownValue.contains('Milhas')) {
                            valorConversao =
                                conversao.getConversao.converteMilhaCm();
                            conversao.valorConvertido = valorConversao;
                          } else if (dropdownValue2.contains('Centímetros') &&
                              dropdownValue.contains('Jardas')) {
                            valorConversao =
                                conversao.getConversao.converteJardaCm();
                            conversao.valorConvertido = valorConversao;
                          }
                        },
                      ),
                    ),
                    SizedBox(height: 30),
                    Text(
                      // ignore: prefer_interpolation_to_compose_strings
                      "Valor convertido: " +
                          conversao.getConversao.valorConvertido!
                              .toStringAsFixed(5),
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
