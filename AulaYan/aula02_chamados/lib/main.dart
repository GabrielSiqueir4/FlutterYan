import 'package:aula02_chamados/src/components/my_menu_component.dart';
import 'package:aula02_chamados/src/models/chamados.dart';
import 'package:aula02_chamados/src/view/cadastro_view.dart';
import 'package:aula02_chamados/src/view/chamados_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => (runApp(MultiProvider(
      providers: [
        
        ChangeNotifierProvider(create: (context) => Chamados())],
      child: AppChamados(),
    )));

class AppChamados extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Chamados",
      home: CadastroView(),
      routes: {
        "/cadastro": (context) => CadastroView(),
        "/chamados": (context) => ChamadosView(),
      },
    );
  }
}
