import 'package:design/src/blocs/provider.dart';
import 'package:design/src/providers/user_provider.dart';
import 'package:design/src/utils/utils.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatelessWidget {

  final userProvider = new UserProvider();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: <Widget>[_createBackground(context), _registerForm(context)],
    ));
  }

  Widget _createBackground(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final purpleBackground = Container(
      height: size.height * 0.4,
      width: double.infinity,
      decoration: BoxDecoration(
          gradient: LinearGradient(colors: <Color>[
        //Color.fromRGBO(63, 63,156 , 1.0),
        //Color.fromRGBO(90, 70, 178, 1.0),
        Color.fromRGBO(0, 128, 255, 1.0),
        Color.fromRGBO(53, 53, 255, 1.0),
      ])),
    );

    final circle = Container(
        width: 100.0,
        height: 100.0,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100.0),
            color: Color.fromRGBO(255, 255, 255, 0.05)));

    return Stack(
      children: <Widget>[
        purpleBackground,
        Positioned(top: 90.0, left: 30.0, child: circle),
        Positioned(top: -40.0, right: -30.0, child: circle),
        Positioned(bottom: -50.0, right: -10.0, child: circle),
        Positioned(bottom: 120.0, right: 20.0, child: circle),
        Positioned(right: -50.0, top: 200.0, child: circle),
        SafeArea(
          child: Container(
            padding: EdgeInsets.only(top: 20.0),
            child: Column(
              children: <Widget>[
                Image(
                  image: AssetImage('assets/WorkiA.png'),
                  width: 100.0,
                ),
                SizedBox(
                  height: 10.0,
                  width: double.infinity,
                ),
                Icon(Icons.person_pin_circle, color: Colors.white, size: 100.0),
              ],
            ),
          ),
        )
      ],
    );
  }

  Widget _registerForm(BuildContext context) {
    final bloc = Provider.of(context);
    final size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          SafeArea(
            child: Container(
              height: 180.0,
            ),
          ),
          Container(
            width: size.width * 0.85,
            margin: EdgeInsets.symmetric(vertical: 30.0),
            padding: EdgeInsets.symmetric(vertical: 50.0),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(5.0),
                boxShadow: <BoxShadow>[
                  BoxShadow(
                      color: Colors.black26,
                      blurRadius: 3.0,
                      offset: Offset(0.0, 5.0),
                      spreadRadius: 3.0)
                ]),
            child: Column(
              children: <Widget>[
                Text(
                  'Register, please fill all the fields',
                  style: TextStyle(fontSize: 20.0),
                ),
                SizedBox(
                  height: 60.0,
                ),
                _createEmail(bloc),
                SizedBox(
                  height: 30.0,
                ),
                _createPassword(bloc),
                SizedBox(
                  height: 30.0,
                ),
                _createButton('Register',bloc),
              ],
            ),
          ),
          FlatButton(
            child: Text('Do you have an account? Log In'),
            onPressed: () => Navigator.pushReplacementNamed(context, 'login'),
          ),
          SizedBox(height: 100.0)
        ],
      ),
    );
  }

  Widget _createEmail(LoginBloc bloc) {
    return StreamBuilder(
        stream: bloc.emailStream,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          return Container(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: TextField(
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                  icon: Icon(Icons.alternate_email, color: Colors.blueAccent),
                  hintText: 'example@email.com',
                  labelText: 'Email',
                  errorText: snapshot.error),
              onChanged: (value) => bloc.changeEmail(value),
            ),
          );
        });
  }

  Widget _createPassword(LoginBloc bloc) {
    return StreamBuilder(
        stream: bloc.passwordStream,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          return Container(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: TextField(
              obscureText: true,
              decoration: InputDecoration(
                  icon: Icon(Icons.lock_outline, color: Colors.blueAccent),
                  labelText: 'Password',
                  errorText: snapshot.error),
              onChanged: (value) => bloc.changePassword(value),
            ),
          );
        });
  }

  Widget _createButton(String text, LoginBloc bloc) {
    return StreamBuilder(
      stream: bloc.formValidStream,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return Container(
          child: RaisedButton(
            child: Container(
                height: 20.0,
                width: 200.0,
                child: Center(
                  child: Text(text),
                )),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0)),
            elevation: 0.0,
            color: Colors.blueAccent,
            textColor: Colors.white,
            onPressed: snapshot.hasData ? () => _register(bloc,context) : null,
          ),
        );
      },
    );
  }

  _register(LoginBloc bloc, BuildContext context)async{
    Map info = await userProvider.newUser(bloc.email, bloc.password);
    print(info);
    if(info['ok']){
      Navigator.pushReplacementNamed(context, 'scroll');
    }else{
      showAlert(context,info['message']);
    }
  }
 
}
