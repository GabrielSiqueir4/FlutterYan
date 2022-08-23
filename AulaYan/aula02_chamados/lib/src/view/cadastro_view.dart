import 'package:flutter/material.dart';

import '../components/my_menu_component.dart';

class CadastroView extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          MyMenu()
        ],
        title: Text("Cadastro de chamados"),
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
            )
    );
  }
}