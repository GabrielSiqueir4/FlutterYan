
import 'package:atividade01/COMPONENTS/auth_check.dart';
import 'package:flutter/material.dart';

class Intermediario extends StatelessWidget {
  const Intermediario({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return MaterialApp(
      title: 'APP',
      debugShowCheckedModeBanner: false,
            theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home: const AuthCheck(),
    );
  }
}