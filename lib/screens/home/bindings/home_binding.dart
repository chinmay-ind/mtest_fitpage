import 'package:get/get.dart';
import 'package:mt_fitpage/screens/home/controllers/home_controller.dart';

class HomeBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeController());
  }
}