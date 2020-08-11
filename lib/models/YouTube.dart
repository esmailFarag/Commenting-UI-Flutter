class YouTube {
  int id , course_id , is_youtube;
  String title;
  String title_ar;
  String description;
  String description_ar;
  String yt_url;
  bool isNew;

  YouTube({this.id, this.course_id ,  this.is_youtube, this.title, this.title_ar, this.description , this.description_ar , this.yt_url , this.isNew });

  factory YouTube.fromJson(Map<String, dynamic> json) {
    return YouTube(
      id: json["id"] as int,
      course_id: json["course_id"] as int,
      is_youtube: json["is_youtube"] as int,
      title: json["title"] as String,
      title_ar: json["title_ar"] as String,
      description: json["description"] as String,
      description_ar: json["description_ar"] as String,
      yt_url: json["yt_url"] as String,
      isNew: json["isNew"] as bool,


    );
  }
}
