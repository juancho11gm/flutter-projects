import 'package:design/src/blocs/provider.dart';
import 'package:design/src/pages/login_page.dart';
import 'package:design/src/pages/register_page.dart';
import 'package:design/src/pages/scroll_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
 
void main() async {
  runApp(MyApp());
} 
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
   
    SystemChrome.setSystemUIOverlayStyle( SystemUiOverlayStyle.light.copyWith(
      statusBarColor: Colors.transparent
    ) ); 

    return Provider(
      child: MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Design App',
      initialRoute: 'login',
      routes: {
        'scroll' : (BuildContext context) => ScrollPage(),
        'login' : (BuildContext context) => LoginPage(),
        'register' : (BuildContext context) => RegisterPage(),
      },
      theme: ThemeData(
        primaryColor: Colors.blueAccent
      ),
    ),
    );
  }
}