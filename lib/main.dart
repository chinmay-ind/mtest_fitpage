import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mt_fitpage/screens/home/home_screen.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'helper/page_routes.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Fitpage - MT',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      builder: EasyLoading.init(),
      getPages: pageRoutes,
      initialRoute: homeScreen,
    );
  }
}
