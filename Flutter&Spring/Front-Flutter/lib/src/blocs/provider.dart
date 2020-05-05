import 'package:design/src/blocs/login_bloc.dart';
import 'package:flutter/material.dart';
export 'package:design/src/blocs/login_bloc.dart';

class Provider extends InheritedWidget{

  static Provider _instance;

  factory Provider({ Key key, Widget child}){
    if(_instance == null){
      _instance = new Provider._internal(key: key,child: child,);
    }
    return _instance;
  }

  final loginBloc = LoginBloc();

 Provider._internal({ Key key, Widget child})
  : super(key: key, child: child);

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => true;

  static LoginBloc of (BuildContext context){
    return context.dependOnInheritedWidgetOfExactType<Provider>().loginBloc;
  }
}