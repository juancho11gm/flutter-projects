import 'dart:convert';

import 'package:enum_to_string/enum_to_string.dart';
import 'package:login_worki/src/utils/degreeType_enum.dart';

class Educations {
    List<Education> items = new List();
    Educations();
    
    Educations.fromJsonList(List<dynamic> jsonList){
      if(jsonList == null) return;
      for(var item in jsonList){
        final education = new Education.fromJson(item);
        items.add(education);
      }
    }

    toJson() {
      return this.items != null ? this.items.map((i) => i.toJson()).toList() : null;
    }
    
}

class Education {
  int        duration;
  String     fieldOfStudy;
  int        initialYear;
  int        finalYear;
  String     school;
  DegreeType type;

  Education.fromJson(Map<String, dynamic> json){
    duration     = json['duration'];
    fieldOfStudy = json['fieldOfStudy'];
    initialYear  = json['initialYear'];
    finalYear    = json['finalYear'];
    school       = json['school'];
    type         = EnumToString.fromString(DegreeType.values, json['type']);
  }

   Map<String, dynamic> toJson() => {
     'duration':  duration,
     'fieldOfStudy': fieldOfStudy,
     'initialYear': initialYear,
     'finalYear': finalYear,
     'school': school,
     'type': type
   };
}