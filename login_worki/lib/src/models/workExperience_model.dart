class WorkExperiences {
    List<WorkExperience> items = new List();
    WorkExperiences();
    
    WorkExperiences.fromJsonList(List<dynamic> jsonList){
      if(jsonList == null) return;
      for(var item in jsonList){
        final workExperience = new WorkExperience.fromJson(item);
        items.add(workExperience);
      }
    }
}

class WorkExperience {
  String city;
  String company;
  String description;
  int    finalYear;
  int    initialYear;
  String position;

  WorkExperience();

  WorkExperience.fromJson(Map<String, dynamic> json){
    city        = json['city'];
    company     = json['company'];
    description = json['description'];
    finalYear   = json['finalYear'];
    initialYear = json['initialYear'];
    position    = json['position'];
  }

  Map<String, dynamic> toJson() => {
    'city' : city,
    'company' : company,
    'description' : description,
    'finalYear' : finalYear,
    'initialYear' : initialYear,
    'position' : position
  };

}