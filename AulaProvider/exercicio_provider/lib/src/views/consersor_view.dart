import 'package:flutter/material.dart';

class ConversorView extends StatelessWidget {
  const ConversorView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Conversor'),
      ),
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: [
            Image.asset('lib/assets/medidas.png'),
            Row(
              children: [
                DropdownButton(items: const [], onChanged: (){},),
                const TextField(
                  decoration:  InputDecoration(),
                ),
                ElevatedButton(onPressed: (){}, child: const Text('Converter'))
                
              ],
            ),
          ],
        ),
      ),
    );
  }
}
