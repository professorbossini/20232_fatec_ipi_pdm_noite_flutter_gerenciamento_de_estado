import 'package:flutter/material.dart';
import '../src/telas/login_tela.dart';
import './blocs/provider.dart';
class App extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Provider(
      child: MaterialApp(
        title: 'Login',
        home: Scaffold(
          body: LoginTela()
        )
      )
    );
  }
}