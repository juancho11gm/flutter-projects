

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:login_worki/src/pages/register_page.dart';

void main() async {
  runApp(MyApp());
} 
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
   
    SystemChrome.setSystemUIOverlayStyle( SystemUiOverlayStyle.light.copyWith(
      statusBarColor: Colors.transparent
    ) ); 

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Design App',
      initialRoute: 'register',
      routes: {
        'register' : (BuildContext context) => RegisterPage(),
      },
      theme: ThemeData(
        primaryColor: Colors.blueAccent
      ),
    );
  }
}