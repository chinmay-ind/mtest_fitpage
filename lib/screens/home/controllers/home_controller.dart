import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:mt_fitpage/helper/page_routes.dart';
import 'package:mt_fitpage/screens/home/models/sample.dart';

import '../../../repository/market_repo.dart';

class HomeController extends GetxController {
  var data = <Sample>[].obs;

  @override
  void onInit() {
    super.onInit();
    callGetMarketRepo();
  }

  void callGetMarketRepo() {
    EasyLoading.show(status: 'loading...');
    myRepo.getScanReport().asStream().handleError((error) {
      EasyLoading.dismiss();
      Get.snackbar('Error occurred', error.toString());
    }).listen((response) {
      EasyLoading.dismiss();
      data.value = response;
    });
  }

  void onTileClick(int index) {
    Get.toNamed(detailScreen, arguments: {
      'response': data[index],
    });
  }
}
