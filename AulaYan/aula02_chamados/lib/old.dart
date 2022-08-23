// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables


import 'package:aula02_chamados/src/models/chamados.dart';
import 'package:flutter/material.dart';

// void main() => (runApp(AppChamados()));

class AppChamados extends StatefulWidget {
  @override
  State<AppChamados> createState() => _AppChamadosState();
}

class _AppChamadosState extends State<AppChamados> {

  late Chamados chamado;
  late List<Chamados> chamados;


  List<String> materiais = ["Notebook", "HD", "Crimpador", "Multimetro"];
  Map<String, bool>  materiaisSelecionados = {
    "Notebook": false,
    "HD": false,
    "Crimpador": false,
    "Multimetro": false
  };

  List<String> tipo = ["Concerto", "Instalacao", "Manutencao"];


  void _refreshBasics({
    String? nome,
    String? descricao,
    DateTime? dia,
    TimeOfDay? hora,
    double? duracao,
    String? tipo,
    bool importante = false,
  }){
    chamado.nome = nome != null ? nome : chamado.nome;
    chamado.descricao = descricao != null ? descricao : chamado.descricao;
    chamado.dia = dia != null ? dia : chamado.dia;
    chamado.hora = hora != null ? hora : chamado.hora;
    chamado.duracao = duracao != null ? duracao : chamado.duracao;
    chamado.tipo = tipo != null ? tipo : chamado.tipo;
    chamado.importante = importante;

    setState(() {
      chamado = chamado;
    });

  }

  void _refresMateriais(String material, bool status){
    materiaisSelecionados[material] = status;

    setState(() {
      materiaisSelecionados = materiaisSelecionados;
    });
  }

  @override
  void initState() {
    chamado = Chamados();
    chamados = [];
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "Chamados",
        home: Scaffold(
            appBar: AppBar(
              title: Text("Chamados"),
            ),
            body: Builder(
              builder: (context) {
                return Column(
                  children: [
                    TextField(
                      
                      decoration: InputDecoration(label: Text("Nome")),
                      onChanged: (_nome) {
                        _refreshBasics(nome: _nome);
                      },
                    ),
                    Text(chamado.nome ?? ""),
                    TextField(
                      minLines: 3,
                      maxLines: 5,
                      decoration: InputDecoration(
                          hintText: "Insira a descrição do chamado",
                          label: Text("Descrição")),
                      onChanged: (_descricao) {
                        _refreshBasics(descricao: _descricao);
                      },
                    ),
                    Text(
                      "Horarios",
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    Row(
                      children: [
                        ElevatedButton(
                            child: Text("Hora do chamado"),
                            onPressed: () async {
                              DateTime? _dia = await showDatePicker(
                                context: context, 
                                initialDate: DateTime.now(), 
                                firstDate: DateTime(1900), 
                                lastDate: DateTime(2100)
                              );

                              if(_dia != null){
                                _refreshBasics(dia: _dia);
                              }
                              
                            }),
                        Text((chamado.dia != null)? '${chamado.dia!.day}/${chamado.dia!.month}/${chamado.dia!.year}' : "O chamado nao tem data")
                      ],
                    ),
                    Row(
                      children: [
                        ElevatedButton(
                            child: Text("Dia do chamado"),
                            onPressed: () async {
                              TimeOfDay? _hora = await showTimePicker(context: context, 
                                initialTime: TimeOfDay.now()
                              );

                              if(_hora != null){
                                _refreshBasics(hora: _hora);
                              }

                            }),
                        Text((chamado.hora != null) ? '${chamado.hora!.toString()}' : "O chamado nao tem dia")
                      ],
                    ),
                    Text(
                      "Materiais",
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    ListView.builder(
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        itemCount: materiais.length,
                        itemBuilder: (context, index) {
                          String _material = materiais[index];
                          // bool? _selecionado
                          return Row(
                            children: [
                              Checkbox(
                                value: materiaisSelecionados[_material], 
                                onChanged: (_status) {
                                _refresMateriais(_material, _status!);
                              }),
                              Text(_material)
                            ],
                          );
                        }),
                    Text(
                      "Tipo",
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    DropdownButton(
                        isExpanded: true,
                        value: chamado.tipo,
                        items: tipo.map((e) {
                          return DropdownMenuItem(
                            child: Text(e),
                            value: e,
                          );
                        }).toList(),
                        onChanged: (tipo) {
                          _refreshBasics(tipo: tipo.toString());
                        }),
                    Text((chamado.tipo != null) ? '${chamado.tipo!.toString()}' : "O chamado nao tem tipo "),

                    // Row(
                    //   children: [
                      Text("Importante"),
                      Switch(
                        value: chamado.importante, 
                        onChanged: (_importante){
                            _refreshBasics(importante: _importante);
                        }),
                    
                        Text("Duracao"),
                        TextField(
                          keyboardType: TextInputType.number,
                          onChanged: (_duracao){
                            double? _convertedDuracao = double.tryParse(_duracao);
                            _refreshBasics(duracao: _convertedDuracao);
                          },
                        ),
    

                    ElevatedButton(
                      onPressed: cadastrar, 
                      child: Text("Cadastrar")
                      ),

                    Text('Total de ${chamados.length} cadastrados'),

                    ListView.builder(
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          itemCount: chamados.length,
                          itemBuilder: (context, index) {
                            Chamados _chamado = chamados.elementAt(index);
                            return Card(
                              // child: Text(_chamado.nome.toString()),
                              child: Column(
                                children: [
                                  Text(_chamado.nome.toString()),
                                  Text(_chamado.materiais.toString()),
                                ],
                              ),
                              // child: Text('elemento $index'),
                            );
                          }
                    ),

                  ],
                );
              }
            )));
  }

  void cadastrar(){
    chamados.add(chamado);

    setState(() {
      chamado = Chamados();
      chamados = chamados;
    });

  }

}
