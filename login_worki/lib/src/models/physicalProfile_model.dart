import 'dart:ffi';

import 'package:enum_to_string/enum_to_string.dart';
import 'package:login_worki/src/utils/contextureType_enum.dart';
import 'package:login_worki/src/utils/eyeType_enum.dart';
import 'package:login_worki/src/utils/hairColor_enum.dart';
import 'package:login_worki/src/utils/hairType_enum.dart';
import 'package:login_worki/src/utils/skinType_enum.dart';

class PhysicalProfile {

  ContextureType contexture;
  EyeType        eyeColor;
  HairColorType  hairColor;
  HairType       hairType;
  SkinType       skinColor;
  double         height;
  double         weight;
  int            pantsSize;
  String         shirtSize;
  int            shoesSize;

  PhysicalProfile.fromJson(Map<String, dynamic> json){
    contexture = EnumToString.fromString(ContextureType.values, json['contexture']);    
    eyeColor   = EnumToString.fromString(EyeType.values, json['eyeColor']); 
    hairColor  = EnumToString.fromString(HairColorType.values, json['hairColor']); 
    hairType   = EnumToString.fromString(HairType.values, json['hairType']); 
    skinColor  = EnumToString.fromString(SkinType.values, json['skinColor']); 
    height     = json['height']; 
    weight     = json['weight']; 
    pantsSize  = json['pantsSize']; 
    shirtSize  = json['shirtSize']; 
    shoesSize  = json['shoesSize']; 
  } 

  Map<String, dynamic> toJson() => {
    'contexture' : contexture,
    'eyeColor' : eyeColor,
    'hairColor' : hairColor,
    'hairType' : hairType,
    'skinColor' : skinColor,
    'height' : height,
    'weight' : weight,
    'pantsSize' : pantsSize,
    'shirtSize' : shirtSize,
    'shoesSize' : shoesSize
  };
  
}