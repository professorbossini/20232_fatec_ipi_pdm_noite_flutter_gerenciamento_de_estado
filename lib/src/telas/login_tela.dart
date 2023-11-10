import 'package:flutter/material.dart';
import '../blocs/bloc.dart';
class LoginTela extends StatelessWidget{
  
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20.0),
      child: Column(
        children: [
          emailField(),
          passwordField(),
          Container(
            margin: EdgeInsets.only(top: 12.0),
            child: Row(
              children: [
                Expanded(
                  child: submitButton()
                )
              ],
            ),
          )
          
        ],
      ),
    );
  }

  Widget emailField(){
    return StreamBuilder(
      stream: bloc.email,
      builder: (context, AsyncSnapshot <String> snapshot){
        return TextField(
          onChanged: bloc.changeEmail,
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
            //se tem erro, mostro o erro, senão, associo null
            errorText: snapshot.hasError ? snapshot.error.toString() : null,
            hintText: 'seu@email.com',
            labelText: 'Endereço de e-mail'
          ),
        );
      }
    );
  }

  Widget passwordField(){
    return StreamBuilder(
      stream: bloc.password,
      builder: ((context, snapshot){
        return TextField(
          onChanged: (value) => bloc.changePassword(value),
          obscureText: true,
          decoration: InputDecoration(
            errorText: snapshot.hasError ? '${snapshot.error}' : null,
            hintText: "Senha",
            labelText: "Digite a sua senha" 
          ),
        );
      }),
    );
  }

  Widget submitButton(){
    return ElevatedButton(
      onPressed: (){},
      child: Text("Login"),
    );
  }

}