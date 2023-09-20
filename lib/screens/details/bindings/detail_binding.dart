import 'package:get/get.dart';
import 'package:mt_fitpage/screens/details/controllers/detail_controller.dart';

class DetailBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => DetailController());
  }
}
