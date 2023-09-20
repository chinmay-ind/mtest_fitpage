class Data {
  List<MarketScanResponse>? marketScanResponse = [];

  Data({
    this.marketScanResponse,
  });

  factory Data.fromJson(List<dynamic> parsedJson) {
    List<MarketScanResponse> marketScanList = [];
    marketScanList =
        parsedJson.map((e) => MarketScanResponse.fromJson(e)).toList();

    return Data(marketScanResponse: marketScanList);
  }
}

class MarketScanResponse {
  num? id;
  String? name;
  String? tag;
  String? color;
  List<Criteria>? criteria;

  MarketScanResponse({
    this.id,
    this.name,
    this.tag,
    this.color,
    this.criteria,
  });

  factory MarketScanResponse.fromJson(Map<String, dynamic> json) {
    return MarketScanResponse(
        id: json['id'],
        name: json['name'],
        tag: json['tag'],
        color: json['color'],
        criteria: json['criteria'] == null
            ? []
            : json['criteria'].forEach((v) {
                json['criteria'].add(Criteria.fromJson(v));
              }));
  }

  /* MarketScanResponse.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    tag = json['tag'];
    color = json['color'];
    if (json['criteria'] != null) {
      criteria = [];
      json['criteria'].forEach((v) {
        criteria?.add(Criteria.fromJson(v));
      });
    }
  }*/

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

class Criteria {
  String? type;
  String? text;
  Map<String, dynamic>? variable;

  Criteria({
    this.type,
    this.text,
    this.variable,
  });

  factory Criteria.fromJson(Map<String, dynamic> json) {
    return Criteria(
      type: json['type'],
      text: json['text'],
      variable: json['variable'],/* != {}
          ? json['variable'].forEach((key, value) {
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
            })
          : {},*/
    );
  }

  /*Criteria.fromJson(dynamic json) {
    type = json['type'];
    text = json['text'];
    variable = json['variable'];
    if (variable != {}) {
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
  }*/

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
    this.type,
    this.studyType,
    this.parameterName,
    this.minValue,
    this.maxValue,
    this.defaultValue,
    this.values,
  });

  factory Variable.fromJson(Map<String, dynamic> json) {
    return Variable(
      type: json['type'],
      studyType: json['study_type'],
      parameterName: json['parameter_name'],
      minValue: json['min_value'],
      maxValue: json['max_value'],
      defaultValue: json['default_value'],
      values: json['values'],
    );
  }

/*  Variable.fromJson(dynamic json) {
    type = json['type'];
    studyType = json['study_type'];
    parameterName = json['parameter_name'];
    minValue = json['min_value'];
    maxValue = json['max_value'];
    defaultValue = json['default_value'];
    values = json['values'];
  }*/

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
