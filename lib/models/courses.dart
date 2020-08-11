class Course {
  int id , user_id , channel_id , level ;
  String slug;
  String name;
  String name_ar;
  String description;
  String description_ar;
  String image_filename;

  Course({this.id, this.level ,  this.name, this.name_ar, this.channel_id, this.slug , this.image_filename , this.description });

  factory Course.fromJson(Map<String, dynamic> json) {
    return Course(
      id: json["id"] as int,
      channel_id: json["channel_id"] as int,
      slug: json["slug"] as String,
      level: json["level"] as int,
      name: json["name"] as String,
      name_ar: json["name_ar"] as String,
      image_filename: json["image_filename"] as String,
      description: json["description"] as String,


    );
  }
}
