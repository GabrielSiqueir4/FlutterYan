import 'package:atividade01/COMPONENTS/auth_service.dart';
import 'package:atividade01/COMPONENTS/navigation.dart';
import 'package:atividade01/PAGES/Login/Login_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';

class AuthCheck extends StatefulWidget {
  const AuthCheck({Key? key}) : super(key: key);

  @override
  State<AuthCheck> createState() => _AuthCheckState();
}

class _AuthCheckState extends State<AuthCheck> {
  @override
  Widget build(BuildContext context) {
    AuthService auth = Provider.of<AuthService>(context);

    if (auth.isLoading)
      return loading();
    else if (auth.usuario == null) //faz as validações, para se a pessoa não tiver login, direciona para a tela de login
      return LoginPage();
    else
      return Navigation();  //se estiver tudo ok, direciona para a aplição
  }

  loading() {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
