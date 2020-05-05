import 'package:flutter/material.dart';
import 'package:flutter_vscode/src/pages/home_page.dart';
import 'package:flutter_vscode/src/pages/movie_details.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Peliculas',
      initialRoute: '/',
      routes: {
        '/': (BuildContext context) => HomePage(),
        'details': (BuildContext context) => MovieDetails(),

      }
    );
  }
}