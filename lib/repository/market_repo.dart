import 'dart:convert';

import 'package:mt_fitpage/screens/home/models/sample.dart';

import '../helper/constants.dart';
import '../networking/api_service.dart';

class MyRepo {
  Future<List<Sample>> getScanReport() async {
    var response = await apiService.getRequest(apiUrl);
    return sampleFromJson(jsonEncode(response));
  }
}

final myRepo = MyRepo();
