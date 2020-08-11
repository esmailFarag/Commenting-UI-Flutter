class Community {
  int id  , channelId , repliesCount  , visitsCount ;
  String slug;
  String title;
  String body;
  String createdAt;
  String nextPageUrl;
  Creator creator;
  //LastPage lastPage;

  List<Photographs> photographs ;

  Community({this.id, this.slug , this.title, this.createdAt,  this.repliesCount,  this.body , this.visitsCount ,  this.photographs  ,this.creator});

  factory Community.fromJson(Map<String, dynamic> json) {
    return Community(
      id: json["id"] as int,
      slug: json["slug"] as String,
      title: json["title"] as String,
      createdAt: json["created_at"] as String,
      repliesCount: json["replies_count"] as int,
      body: json["body"] as String,
      visitsCount: json["visitsCount"] as int,
      photographs:
      _toObjectList(json['photographs'], (e) => Photographs.fromJson(e)),
      creator: Creator.fromJson(json["creator"]),
    );
  }
}

class Creator {
  String name ,  avatar_path;
  Creator({this.name,  this.avatar_path});

  factory Creator.fromJson(Map<String, dynamic> json) {
    return Creator(
        name: json['name'] as String,
        avatar_path: json['avatar_path'] as String
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


/*
class LastPage {
  final int lastPage , currentPage;

  LastPage({this.lastPage , this.currentPage});

  factory LastPage.fromJson(Map<String, dynamic> json) {
    return LastPage(
      lastPage: json["last_page"] as int,
      currentPage: json["current_page"] as int,
    );
  }


}*/
