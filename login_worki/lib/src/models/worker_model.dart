import 'dart:convert';

import 'package:login_worki/src/models/education_model.dart';
import 'package:login_worki/src/models/physicalProfile_model.dart';
import 'package:login_worki/src/models/user_model.dart';
import 'package:login_worki/src/models/workExperience_model.dart';

class Workers {
  List<Worker> items = new List();
  Workers();
  Workers.fromJsonList(List<dynamic> jsonList) {
    if (jsonList == null) return;
    for (var item in jsonList) {
      final movie = new Worker.fromJson(item);
      items.add(movie);
    }
  }
}

class Worker extends User {
  int age;
  List<String> allergies;
  String cardId;
  String description;
  String nationality;
  String maritalStatus;
  String cityResidence;
  int secondaryPhone;
  String ocupation;
  String rh;
  String availability;
  List<String> physicalLimitation;
  List<String> languages;
  String personalReference;
  int referencePhone;
  String referenceEmail;
  List<String> interests;
  List<String> aptitudes;
  List<WorkExperience> workExperience;
  List<Education> education;
  PhysicalProfile physicalProfile;

  Worker() {
    this.interests = new List<String>();
    this.aptitudes = new List<String>();
    this.allergies = new List<String>();
    this.physicalLimitation = new List<String>();
    this.languages = new List<String>();
    this.workExperience = new List<WorkExperience>();
    this.education = new List<Education>();
  }

  Worker.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    email = json['email'];
    password = json['password'];
    address = json['address'];
    gender = json['gender'];
    name = json['name'];
    birthDate = json['birthDate'];
    creationDate = json['creationDate'];
    modificationDate = json['modificationDate'];
    phone = json['phone'];
    profilePic = json['profilePic'];
    roles = json['roles'];
    age = json['age'];
    allergies = json['aptitudes'] != null ? json['allergies'].cast<String>() : null;
    cardId = json['cardId'];
    description = json['description'];
    nationality = json['nationality'];
    maritalStatus = json['maritalStatus'];
    cityResidence = json['cityResidence'];
    secondaryPhone = json['secondaryPhone'];
    ocupation = json['ocupation'];
    rh = json['rh'];
    availability = json['availability'];
    physicalLimitation = json['physicalLimitation'] != null ? json['physicalLimitation'].cast<String>() : null;
    languages = json['languages'] != null ? json['languages'].cast<String>() : null;
    personalReference = json['personalReference'];
    referencePhone = json['referencePhone'];
    referenceEmail = json['referenceEmail'];
    interests = json['interests'] != null ? json['interests'].cast<String>() : null;
    aptitudes = json['aptitudes'] != null ? json['aptitudes'] .cast<String>() : null;
    workExperience = json['workExperience'] != null ? WorkExperiences.fromJsonList(json['workExperience']).items : null;
    education = json['education'] != null ? Educations.fromJsonList(json['education']).items : null;
    physicalProfile = json['physicalProfile'] != null ? PhysicalProfile.fromJson(json['physicalProfile']) :null;
  }

  Map<String, dynamic> toJson() {
    List<Map> workExperiences = this.workExperience != null
        ? this.workExperience.map((i) => i.toJson()).toList()
        : null;
    List<Map> educations = this.education != null
        ? this.education.map((i) => i.toJson()).toList()
        : null;
    Map physicalProfileAux =
        this.physicalProfile != null ? this.physicalProfile.toJson() : null;
    return {
      'id': id,
      'email': email,
      'password': password,
      'address': address,
      'gender': gender,
      'name': name,
      'birthDate': birthDate,
      'creationDate': creationDate,
      'modificationDate': modificationDate,
      'phone': phone,
      'profilePic': profilePic,
      'roles': roles,
      'age': age,
      'allergies': allergies,
      'cardId': cardId,
      'description': description,
      'nationality': nationality,
      'maritalStatus': maritalStatus,
      'cityResidence': cityResidence,
      'secondaryPhone': secondaryPhone,
      'ocupation': ocupation,
      'rh': rh,
      'availability': availability,
      'physicalLimitation': physicalLimitation,
      'languages': languages,
      'personalReference': personalReference,
      'referencePhone': referencePhone,
      'referenceEmail': referenceEmail,
      'interests': interests,
      'aptitudes': aptitudes,
      'workExperience': workExperiences,
      'education': educations,
      'physicalProfile': physicalProfileAux
    };
  }
}
