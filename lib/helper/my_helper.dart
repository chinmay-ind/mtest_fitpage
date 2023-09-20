import 'dart:io';

import 'package:flutter/material.dart';

class MyHelper {
  Future<bool> get hasNetwork async {
    try {
      final result = await InternetAddress.lookup('example.com');
      return result.isNotEmpty && result[0].rawAddress.isNotEmpty;
    } on SocketException catch (_) {
      return false;
    }
  }

  Color getColor(String color) {
    if (color == 'red') {
      return Colors.red;
    } else {
      return Colors.green;
    }
  }
}

final myHelper = MyHelper();
