import 'dart:convert';
import 'dart:developer';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:quraan_app/app/modules/constant/constants.dart';
import 'package:quraan_app/app/modules/quraan/model/quraan_ayah_model.dart';

class QuranProvider extends GetConnect {
  // Get all Quraan Kariiim

  getQuran() async {
    var response = await http.get(Uri.parse("${KQURANAPI}surah"));

    if (response.statusCode == 200) {
      var decodeData = jsonDecode(response.body);

      // log("${decodeData['data']}", name: "Quraaan Data");

      return decodeData['data'];
    }
  }

  getQuranAyah(int index) async {
    var response = await http.get(
        Uri.parse("${KQURANAPI}surah/$index")); //"${KQURANAPI}surah/$index")

    if (response.statusCode == 200) {
      var decodeData = jsonDecode(response.body);

      log("Quraan Detial ${decodeData['data']} ");

      return Data.fromJson(decodeData['data']);
      // return decodeData['result'];
    }
  }

  @override
  void onInit() {
    httpClient.baseUrl = 'YOUR-API-URL';
  }
}
