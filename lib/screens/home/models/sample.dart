import 'dart:convert';

/// id : 1
/// name : "Top gainers"
/// tag : "Intraday Bullish"
/// color : "green"
/// criteria : [{"type":"plain_text","text":"Sort - %price change in descending order"}]
List<Sample> sampleFromJson(String str) {
  final jsonData = json.decode(str);
  return List<Sample>.from(jsonData.map((x) => Sample.fromJson(x)));
}

String sampleToJson(List<Sample> data) {
  final dyn = List<Sample>.from(data.map((x) => x.toJson()));
  return json.encode(dyn);
}

class Sample {
  Sample({
    this.id,
    this.name,
    this.tag,
    this.color,
    this.criteria,
  });

  Sample.fromJson(dynamic json) {
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
  List<dynamic>? criteria;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['tag'] = tag;
    map['color'] = color;
    if (criteria != null) {
      map['criteria'] = criteria?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}
