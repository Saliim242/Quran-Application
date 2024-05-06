import 'dart:convert';
import 'dart:developer';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:quraan_app/app/modules/constant/constants.dart';

import '../models/juz_model.dart';

class JuzProvider extends GetConnect {
  getJuz() async {
    var response = await http.get(
      Uri.parse("${KQURANAPI}juz/30/quran-uthmani"),
    );

    if (response.statusCode == 200) {
      var decodeData = jsonDecode(response.body);

      // log("Response ${decodeData}");

      return JuzData.fromJson(decodeData);
    }
  }

  @override
  void onInit() {
    httpClient.baseUrl = 'YOUR-API-URL';
  }
}
