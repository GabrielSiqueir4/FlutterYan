// ignore_for_file: prefer_const_constructors
import 'dart:ui';
import 'package:atividade01/COMPONENTS/auth_service.dart';
import 'package:atividade01/COMPONENTS/notification.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    final firebaseMessaging = FCM();
    firebaseMessaging.setNotifications();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.only(top: 350),
        child: Center(
          child: Column(
            children: [
              Text(
                'Aplicativo para tirar Fotos e Gravar audio.',
                style: TextStyle(color: Colors.black, fontSize: 20),
              ),
              SizedBox(height: 40),
              ElevatedButton.icon(
                icon: Icon(Icons.arrow_back),
                label: Text('Sair'),
                onPressed: () async {
                  context.read<AuthService>().logout();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
