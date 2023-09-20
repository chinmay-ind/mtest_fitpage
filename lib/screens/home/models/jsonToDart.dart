/*class ApiResponse {
  ApiResponse({
    required this.data,
  });

  List<JsonToDart> data;

  factory ApiResponse.fromJson(dynamic json) => ApiResponse(
    data: List<JsonToDart>.from(
          json.map((x) => JsonToDart.fromJson(x)),
        ),
      );


}*/

class JsonToDart {
  JsonToDart({
    this.id,
    this.name,
    this.tag,
    this.color,
    this.criteria,
  });

  JsonToDart.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    tag = json['tag'];
    color = json['color'];
    criteria = json['criteria'];
  }

  num? id;
  String? name;
  String? tag;
  String? color;
  dynamic criteria;

  dynamic toJson() {
    final map = <dynamic, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['tag'] = tag;
    map['color'] = color;
    map['criteria'] = criteria;
    return map;
  }
}
