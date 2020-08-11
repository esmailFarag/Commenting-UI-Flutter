class Topics {
  int id ;
  int userId ;
  int courseId ;
  int position;
  String slug;
  String name;
  String nameAr;
  String introduction;
  String introductionAr;
  String description;
  String descriptionAr;
  String imageFilename;

  List<Photographs> photographs ;

  Topics({this.id, this.slug, this.userId, this.courseId,
          this.position,this.name , this.nameAr , this.introduction,
          this.introductionAr, this.description, this.descriptionAr,
          this.imageFilename, photographs
  });

  factory Topics.fromJson(Map<String, dynamic> json) {
    return Topics(
      id: json["id"] as int,
      userId: json["user_id"] as int,
      courseId: json["course_id"] as int,
      position: json["position"] as int,
      slug: json["slug"] as String,
      name: json["name"] as String,
      nameAr: json["name_ar"] as String,
      introduction: json["introduction"] as String,
      introductionAr: json["introduction_ar"] as String,
      description: json["description"] as String,
      descriptionAr: json["description_ar"] as String,
      imageFilename: json["image_filename"] as String,

      photographs:
      _toObjectList(json['photographs'], (e) => Photographs.fromJson(e)),

    );
  }
}



class Photographs {
  final String path;

  Photographs({this.path,});

  factory Photographs.fromJson(Map<String, dynamic> json) {
    return Photographs(
      path: json['path'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'path': path,
    };
  }
}



List<T> _toObjectList<T>(data, T Function(Map<String, dynamic>) fromJson) {
  if (data == null) {
    return null;
  }
  var result = <T>[];
  for (var element in data) {
    T value;
    if (element != null) {
      value = fromJson(element as Map<String, dynamic>);
    }
    result.add(value);
  }
  return result;
}
