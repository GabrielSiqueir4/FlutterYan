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
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.black,
                Colors.blue,
              ],
              begin: Alignment.topRight,
              end: Alignment.bottomCenter,
            ),
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                Text(
                  'Aplicativo para tirar Fotos e Gravar audio.',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
                GestureDetector(onTap: () {
                  child:
                  Image.network(
                    'https://png.pngtree.com/element_our/md/20180314/md_5aa8fcedbdd99.jpg',
                    width: 200,
                   
                    fit: BoxFit.contain,
                  );
                  context.read<AuthService>().logout();
                })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
