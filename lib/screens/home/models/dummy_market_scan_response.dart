class MarketScanResponse {
  String? id;
  String? name;
  String? tag;
  String? color;
  List<Criteria>? criteria;

  MarketScanResponse({
    required this.id,
    required this.name,
    required this.tag,
    required this.color,
    required this.criteria,
  });

  MarketScanResponse.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    tag = json['tag'];
    color = json['color'];
    criteria = json['criteria'];
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['tag'] = tag;
    map['color'] = color;
    map['criteria'] = criteria;
    return map;
  }
}

class Criteria {
  String? type;
  String? text;
  Map<String, dynamic>? variable;

  Criteria({
    required this.type,
    required this.text,
    required this.variable,
  });

  Criteria.fromJson(dynamic json) {
    type = json['type'];
    text = json['text'];
    variable = json['variable'];
    if (variable!.isNotEmpty) {
      variable?.forEach((key, value) {
        var variableList = [];
        for (var element in variableList) {
          variableList.add(Variable(
              type: element['type'] ?? '',
              studyType: element['study_type'] ?? '',
              parameterName: element['parameter_name'] ?? '',
              minValue: element['min_value'] ?? '',
              maxValue: element['max_value'] ?? '',
              defaultValue: element['default_value'] ?? '',
              values: element['values'] ?? []));
        }
      });
    }
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['type'] = type;
    map['text'] = text;
    map['variable'] = variable;
    return map;
  }
}

class Variable {
  String? type;
  String? studyType;
  String? parameterName;
  String? minValue;
  String? maxValue;
  String? defaultValue;
  List<num>? values;

  Variable({
    required this.type,
    required this.studyType,
    required this.parameterName,
    required this.minValue,
    required this.maxValue,
    required this.defaultValue,
    required this.values,
  });

  Variable.fromJson(dynamic json) {
    type = json['type'];
    studyType = json['study_type'];
    parameterName = json['parameter_name'];
    minValue = json['min_value'];
    maxValue = json['max_value'];
    defaultValue = json['default_value'];
    values = json['values'];
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['type'] = type;
    map['study_type'] = studyType;
    map['parameter_name'] = parameterName;
    map['min_value'] = minValue;
    map['max_value'] = maxValue;
    map['default_value'] = defaultValue;
    map['values'] = values;
    return map;
  }
}
