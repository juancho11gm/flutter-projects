import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:login_worki/src/providers/user_provider.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  UserProvider userProvider = new UserProvider();
  File _image;
  Future getImage() async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      _image = image;
    });
    print(image);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: <Widget>[
        SafeArea(
          child: SingleChildScrollView(
              child: Column(
            children: <Widget>[
              Center(
                child: RaisedButton(
                    child: Text('GET all workers'),
                    onPressed: () {
                      userProvider.getAllWorkers();
                    }),
              ),
              Center(
                child: RaisedButton(
                    child: Text('GET all workers with authentication'),
                    onPressed: () {
                      userProvider.getAllWorkersSecured();
                    }),
              ),
              Center(
                child: RaisedButton(
                    child: Text('POST worker'),
                    onPressed: () {
                      userProvider.saveWorker(_image);
                    }),
              ),
              Center(
                child: RaisedButton(
                    child: Text('Delete worker'),
                    onPressed: () {
                      userProvider.deleteWorker();
                    }),
              ),
              Center(
                child: RaisedButton(
                    child: Text('Update worker'),
                    onPressed: () {
                      userProvider.updateWorker(_image);
                    }),
              ),
              Center(
                child: _image == null
                    ? Text('No image selected.')
                    : Image.file(_image),
              ),
              FloatingActionButton(
                onPressed: getImage,
                tooltip: 'Pick Image',
                child: Icon(Icons.add_a_photo),
              ),
              FutureBuilder(
                future: userProvider.getPhotoFirstWorker(),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (snapshot.hasData) {
                    final img = snapshot.data;
                    return Image.memory(img);
                  } else {
                    return Container(
                        height: 400.0,
                        child: Center(child: CircularProgressIndicator()));
                  }
                },
              )
            ],
          )),
        )
      ],
    ));
  }
}
