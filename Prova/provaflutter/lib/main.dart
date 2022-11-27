import 'package:atividade01/COMPONENTS/auth_service.dart';
import 'package:atividade01/COMPONENTS/navigation.dart';
import 'package:atividade01/PAGES/Home/Intermediario.dart';
import 'package:atividade01/PAGES/Sheet/Googlesheets.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  await init();
  await SheetsFlutter.init();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => AuthService()),
      ],
      child: const Intermediario(),
    ),
  );
}

Future init() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
}
