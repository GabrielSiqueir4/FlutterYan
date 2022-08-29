// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class CaixaDeTexto extends StatelessWidget {
  const CaixaDeTexto({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 1,
          child: DropdownButton<String>(
            iconEnabledColor: Colors.blue,
            isExpanded: true,
            underline: Container(
              height: 1,
              color: Colors.blue,
            ),
            items: const [
              DropdownMenuItem(
                child: Text('Pes'),
              ),
              DropdownMenuItem(
                child: Text('jardas'),
              ),
            ],
            onChanged: (String? newValue) {},
          ),
        ),
        SizedBox(width: 5),
        Expanded(
          flex: 2,
          child: TextField(
            decoration: InputDecoration(
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.blue),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.blue),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
