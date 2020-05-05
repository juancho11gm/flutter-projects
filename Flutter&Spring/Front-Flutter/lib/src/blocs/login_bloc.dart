import 'dart:async';
import 'package:design/src/blocs/validator.dart';
import 'package:rxdart/rxdart.dart';

class LoginBloc with Validators{

  final _emailController    = BehaviorSubject<String>();
  final _passwordController = BehaviorSubject<String>();

  // Retrieve info
  Stream<String> get emailStream    => _emailController.stream.transform(verifyEmail);
  Stream<String> get passwordStream => _passwordController.stream.transform(verifyPassword);

  Stream<bool> get formValidStream => 
      CombineLatestStream.combine2(emailStream, passwordStream,(e,p) => true);

  // Insert values
  Function(String) get changeEmail    => _emailController.sink.add;
  Function(String) get changePassword => _passwordController.sink.add;

  // Get lastest value of streams
  String get email => _emailController.value;
  String get password => _passwordController.value;


  dispose(){
    _emailController?.close();
    _passwordController?.close();
  }
}