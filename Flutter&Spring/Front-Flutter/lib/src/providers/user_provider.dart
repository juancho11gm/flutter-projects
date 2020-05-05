import 'dart:convert';
import 'package:http/http.dart' as http;

class UserProvider {
  
  final String _firebaseToken = 'AIzaSyCgJp450h_21C8kWJAY26SPEpd3OrBe5h8';
  final String url = 'http://192.168.1.62:8080/worker';

  Future<Map<String,dynamic>> login(String email, String password) async{
    final authData = {
      'email'   : email,
      'password': password,
      'returnSecureToken' : true
    };

    final resp = await http.post(
      'https://identitytoolkit.googleapis.com/v1/accounts:signInWithPassword?key=$_firebaseToken',
      body: json.encode(authData)
    );

    Map<String,dynamic> decodedResp = json.decode(resp.body);
    if(decodedResp.containsKey('idToken')){
      return {'ok':true,'token': decodedResp['idToken']};
    }else{
      return {'ok':false,'message': decodedResp['error']['message']};
    }
  }
  
  Future<Map<String,dynamic>> newUser(String email, String password) async{
    final authData = {
      'email'   : email,
      'password': password,
      'returnSecureToken' : true
    };
    final resp = await http.post(
      'https://identitytoolkit.googleapis.com/v1/accounts:signUp?key=$_firebaseToken',
      body: json.encode(authData)
    );

    Map<String,dynamic> decodedResp = json.decode(resp.body);
    print(decodedResp);

    if(decodedResp.containsKey('idToken')){
      saveUserMongo(email, password);
      return {'ok':true,'token': decodedResp['idToken']};

    }else{
      return {'ok':false,'message': decodedResp['error']['message']};

    }
  }

  saveUserMongo(String email, String password) async{
    final user = {
      "email"    : email,
      "password" : password
    };
    
    print(user);
    final resp = await http.post(
      url,
      headers: { 'content-type' : 'application/json'},
      body: json.encode(user)
    );
    print(json.encode(user));
    print("queeeeeeee");
    Map<String,dynamic> decodedResp = json.decode(resp.body);
    print(decodedResp);
  }
}