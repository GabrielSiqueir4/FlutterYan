import 'package:atividade01/PAGES/Sheet/Googlesheets.dart';
import 'package:atividade01/PAGES/Sheet/SheetsColumn.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class Sheet extends StatefulWidget {
  Sheet({super.key});

  @override
  State<Sheet> createState() => _SheetState();
}

String? textoDigitado;

class _SheetState extends State<Sheet> {
  TextEditingController nameController = TextEditingController();
  TextEditingController coutryController = TextEditingController();
  TextEditingController feedbackController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(10, 200, 10, 10),
            child: Column(
              children: [
                // ignore: prefer_const_constructors
                Text(
                  'Relatorio',
                  // ignore: prefer_const_constructors
                  style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
                ),

                const SizedBox(height: 30),
                TextFormField(
                  controller: nameController,
                  decoration: InputDecoration(
                    hintText: 'Informe o Nome:',
                    hintStyle: TextStyle(fontSize: 10),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                TextFormField(
                  controller: coutryController,
                  decoration: InputDecoration(
                    hintText: 'Informe o Pais:',
                    hintStyle: TextStyle(fontSize: 10),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                TextFormField(
                  controller: feedbackController,
                  decoration: InputDecoration(
                    hintText: 'Informe o FeedBack:',
                    hintStyle: TextStyle(fontSize: 10),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                GestureDetector(
                  onTap: () async {
                    final feedback = {
                      SheetsColumn.name: nameController.text.trim(),
                      SheetsColumn.coutry: coutryController.text.trim(),
                      SheetsColumn.feedback: feedbackController.text.trim(),
                    };

                    await SheetsFlutter.insert([feedback]);
                    nameController.text = "";
                    coutryController.text = "";
                    feedbackController.text = "";
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    height: 50,
                    width: 300,
                    child: const Center(child: Text("Gere Seu Relatorio")),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
