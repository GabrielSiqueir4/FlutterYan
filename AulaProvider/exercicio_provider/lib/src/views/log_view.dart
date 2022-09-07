import 'package:exercicio_provider/src/controller/SalvarLogController.dart';
import 'package:exercicio_provider/src/views/consersor_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Log extends StatelessWidget {
  int _selectedIndex = 0;
  String logString = '';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      title: 'Conversor de medidas',
      home: Scaffold(
        appBar: AppBar(
          
          title: Text("Log de conversões",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              textAlign: TextAlign.left,
              ),
              elevation: 20,
               
          leading: IconButton(
            
            icon: Icon(Icons.backspace_outlined),
            iconSize: 25,
            padding: EdgeInsetsDirectional.only(end: 20),
            tooltip: 'Apagar Log',
            onPressed: () {
              Provider.of<SalvaLogController>(context, listen: false)
                  .limpaLog();
            },
          ),
        ),
        body: Consumer<SalvaLogController>(
          builder: (context, log, child) {
            return SingleChildScrollView(
              child: Column(
                children: log.getSalvaLog.valoresLog!.map(
                  (calculo) {
                    return Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Material(
                        color: Colors.lightBlue,
                        child: ListTile(
                          title: Text(calculo.toString()),
                          
                        ),
                      ),
                    );
                  },
                ).toList(),
              ),
            );
          },
        ),
      ),
    );
  }
}
