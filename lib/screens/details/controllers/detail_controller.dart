import 'package:get/get.dart';

import '../../home/models/sample.dart';

class DetailController extends GetxController {
  var detailSample = Sample().obs;
  List<dynamic> criteria = [];
  Map variableMap = {};
  var mapKeys = [];
  var valuesList = [];

  @override
  void onInit() {
    super.onInit();
    if (Get.arguments != null) {
      detailSample.value = Get.arguments['response'];
      detailSample.value.criteria?.forEach((element) {
        criteria.add(element);
      });
      getDollarFromText();
    }
  }

  void getVariableFromCriteria() {
    if (criteria.isNotEmpty) {
      for (var element in criteria) {
        if (element['variable'] != null) {
          variableMap = element['variable'];
          mapKeys.add(variableMap.keys);
        }
      }
    }
  }

  void getDollarFromText() {
    getVariableFromCriteria();
    for (var model in variableMap.values) {
      if (model['type'] == 'value') {
        List list = model['values'];
        for (var element in list) {
          valuesList.add(element);
        }
      }
    }
  }
}
