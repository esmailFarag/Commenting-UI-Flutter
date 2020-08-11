class Channel {
  int id ;
  String name;
  String name_ar;
  String short_name;
  String slug;
  String item_one_description_en;
  List<Photographs> photographs ;

  Channel({this.id, this.name, this.name_ar, this.short_name, this.slug , this.item_one_description_en , this.photographs });

  factory Channel.fromJson(Map<String, dynamic> json) {
    return Channel(
      id: json["id"] as int,
      name: json["name"] as String,
      name_ar: json["name_ar"] as String,
      short_name: json["short_name"] as String,
      slug: json["slug"] as String,
      item_one_description_en: json["item_one_description_en"] as String,
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
