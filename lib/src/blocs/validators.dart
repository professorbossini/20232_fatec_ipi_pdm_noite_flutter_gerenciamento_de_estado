import 'dart:async';
import 'package:email_validator/email_validator.dart';
//daqui a pouco a gente vai transformar essa classe num "mixin"
mixin Validators{
  final validateEmail = StreamTransformer<String, String>.fromHandlers(
    handleData: (email, sink){
      if (EmailValidator.validate(email)){
        sink.add(email);
      }
      else{
        sink.addError("E-mail inválido");
      }
    }
  );
  //quero que a senha tenha pelo menos 4 caracteres
  final validatePassword = StreamTransformer<String, String>.fromHandlers(
    handleData: (password, sink){
      if (password.length > 3){
        sink.add(password);
      }
      else{
        sink.addError('Senha deve ter, pelo menos, 4 caracteres');
      }
    }
  );
}