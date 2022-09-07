import 'package:exercicio_provider/src/views/consersor_view.dart';
import 'package:exercicio_provider/src/views/log_view.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int paginaAtual = 0;
  late PageController pc;

  void initState() {
    super.initState();
    pc = PageController(initialPage: paginaAtual);
  }

  setPaginaAtual(pagina) {
    setState(() {
      paginaAtual = pagina;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: pc,
        // ignore: sort_child_properties_last
        children: [
          ConversorView(),
          Log(),
        ],
        onPageChanged: setPaginaAtual,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: paginaAtual,
        // ignore: prefer_const_literals_to_create_immutables
        items: [
          const BottomNavigationBarItem(
            icon: Icon(
              Icons.calculate,
              color: Colors.blue,
            ),
            label: 'Conversor',
          ),
          const BottomNavigationBarItem(
            icon: Icon(
              Icons.list,
              color: Colors.blue,
            ),
            label: 'Log',
          ),
        ],

        onTap: ((pagina) {
          pc.animateToPage(pagina,
              duration: const Duration(milliseconds: 400), curve: Curves.ease);
        }),
      ),
    );
  }
}
