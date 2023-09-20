import 'package:get/get.dart';
import 'package:mt_fitpage/screens/details/detail_screen.dart';
import 'package:mt_fitpage/screens/home/bindings/home_binding.dart';
import 'package:mt_fitpage/screens/home/home_screen.dart';

import '../screens/details/bindings/detail_binding.dart';

List<GetPage> pageRoutes = [
  GetPage(
    name: homeScreen,
    page: () => const HomeScreen(),
    binding: HomeBindings(),
  ),
  GetPage(
    name: detailScreen,
    page: () => const DetailScreen(),
    binding: DetailBindings(),
  ),
];

const String homeScreen = '/home';
const String detailScreen = '/detail';
