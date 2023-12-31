import 'dart:async';
import 'validators.dart';
import 'package:rxdart/rxdart.dart';
class Bloc with Validators{
  final _emailController = BehaviorSubject <String>();
  
  final _passwordController = BehaviorSubject<String>();

  Stream <String> get email => _emailController.stream.transform(validateEmail);

  Stream <String> get password => _passwordController.stream.transform(validatePassword);

  Stream<bool> get emailAndPasswordAreOk => CombineLatestStream.combine2(email, password, (e, p) => true);

  Function(String) get changeEmail => _emailController.sink.add;

  Function(String) get changePassword => _passwordController.sink.add;
  
  void submitForm(){
    final email = _emailController.value;
    final password = _passwordController.value;
    print('$email, $password');
  }
}

//final bloc = Bloc();