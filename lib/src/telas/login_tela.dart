import 'package:flutter/material.dart';
import '../blocs/bloc.dart';
import '../blocs/provider.dart';
class LoginTela extends StatelessWidget{
  
  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of(context);
    return Container(
      margin: EdgeInsets.all(20.0),
      child: Column(
        children: [
          emailField(bloc),
          passwordField(bloc),
          Container(
            margin: EdgeInsets.only(top: 12.0),
            child: Row(
              children: [
                Expanded(
                  child: submitButton(bloc)
                )
              ],
            ),
          )
          
        ],
      ),
    );
  }

  Widget emailField(Bloc bloc){
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

  Widget passwordField(Bloc bloc){
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

  Widget submitButton(Bloc bloc){
    return StreamBuilder(
      stream: bloc.emailAndPasswordAreOk, 
      builder: (context, AsyncSnapshot <bool> snapshot){
        return ElevatedButton(
          onPressed: snapshot.hasData ? bloc.submitForm : null,
          child: Text("Login"),
        );
      }
    );
  }

}