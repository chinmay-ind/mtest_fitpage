import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:get/get.dart';

import '../helper/constants.dart';
import '../helper/my_helper.dart';
import 'custom_exception.dart';

class ApiService extends GetConnect {
  Future<dynamic> getRequest(String endpoint,
      {Map<String, dynamic>? query}) async {
    if (!await myHelper.hasNetwork) {
      throw FetchDataException(noInternet);
    }
    Response response;
    try {
      response = await get(endpoint, query: query)
          .timeout(const Duration(seconds: 15));
    } on TimeoutException {
      throw FetchDataException(timeout);
    }
    return responseHandler(endpoint, response);
  }

  dynamic responseHandler(String url, Response response) {
    switch (response.statusCode) {
      case 200:
        return response.body;
      case 500:
        throw CatchException(serverIssue);
      default:
        throw FetchDataException('$communicationError ${response.statusCode}');
    }
  }
}

final apiService = Get.put(ApiService());
