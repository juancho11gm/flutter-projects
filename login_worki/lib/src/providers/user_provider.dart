  
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:login_worki/src/models/workExperience_model.dart';
import 'package:login_worki/src/models/worker_model.dart';

class UserProvider {
   final String url = 'https://demo-worki.herokuapp.com';

  /*Needs authentication*/
  getAllWorkersSecured() async{
    final String workerSecuredUrl = '$url/api/secured/worker';
    String username = 'administrator@gmail.com';
    String password = '123456';
    String basicAuth = 'Basic ' + base64Encode(utf8.encode('$username:$password'));
    print("GET : " + workerSecuredUrl);
    final resp = await http.get(
      workerSecuredUrl,
      headers: {
        'authorization': basicAuth
      }
    );

    List<dynamic> workers = json.decode(resp.body); //get workers
    
    for (var item in workers) { //print workers
         Worker worker = Worker.fromJson(item);
         print(worker.toJson());
    }
  }

  /*Without authentication*/
   getAllWorkers() async{
    final String workerUrl = '$url/api/worker'; //url
    print("GET : " + workerUrl); //print method and url
    final resp = await http.get(  //request
      workerUrl,
    );

    List<dynamic> workers = json.decode(resp.body); //get workers
    
    for (var item in workers) { //print workers
         Worker worker = Worker.fromJson(item);
         print(worker.toJson());
    }
  }

  /*POST REQUEST*/
  saveWorker(File image) async{
    print(base64Encode(image.readAsBytesSync()));
    final String workerUrl = '$url/api/worker'; //url
    print("POST : " + workerUrl); //print method and url
    Worker worker = new Worker();
    worker.email = 'juan@gmail.com';
    worker.password = '123456';
    worker.age = 20;
    WorkExperience workExperience = new WorkExperience();
    workExperience.company = 'facebook';
    worker.workExperience.add(workExperience);
    worker.profilePic =  base64Encode(image.readAsBytesSync());

    final resp = await http.post(  //request
      workerUrl,
      headers: {"Content-type": "application/json"},
      body: jsonEncode(worker.toJson())
    );
    Map<String,dynamic> decodedResp = json.decode(resp.body);
    print(decodedResp);
    
  }

  /* DELETE */
  deleteWorker() async{
    final String id = '5e4b1b85faf9561e19539c31';
    final String workerUrl = '$url/api/worker/$id'; //url
    print("DELETE : " + workerUrl); //print method and url
    final resp = await http.delete(  //request
      workerUrl,
    );
    final  decodedResp = json.decode(resp.body);
    print(decodedResp);
  }

  //PUT
  updateWorker(File image) async{
    final String id = '5e4eba15eacc39537a32c7f3';
    final String workerUrl = '$url/api/worker/$id'; //url
    print("PUT : " + workerUrl); //print method and url
    Worker worker = new Worker();
    worker.id = '5e4eba15eacc39537a32c7f3';
    worker.email = 'juan@gmail.com';
    worker.profilePic =  base64Encode(image.readAsBytesSync());
    worker.password = '123456';
    worker.age = 22;
    worker.name = 'name updated';
    WorkExperience workExperience = new WorkExperience();
    workExperience.company = 'facebook';
    worker.workExperience.add(workExperience);
    
    final resp = await http.put(  //request
      workerUrl,
      headers: {"Content-type": "application/json"},
      body: jsonEncode(worker.toJson())
    );
    final decodedResp = json.decode(resp.body);
    print(decodedResp);
  }

  //get ProfilePic
  Future<dynamic> getPhotoFirstWorker() async{
    final String workerUrl = '$url/api/worker'; //url
    print("GET : " + workerUrl); //print method and url
    final resp = await http.get(  //request
      workerUrl,
    );
    List<dynamic> workers = json.decode(resp.body); //get workers

    Worker worker = Worker.fromJson(workers[2]);
    print(worker.toJson());
    return base64Decode(worker.profilePic);
    
    
  }
}