import 'dart:developer';

import 'package:get/get.dart';
import 'package:quraan_app/app/modules/juz/providers/juz_provider.dart';
import 'package:quraan_app/app/modules/quraan/model/quraan_ayah_model.dart';

import '../models/juz_model.dart';

class JuzController extends GetxController {
  List<Ayahs> ayah = [];
  JuzData dat = JuzData();

  getJuzAyh() async {
    try {
      var data = await JuzProvider().getJuz();

      dat = data;
      // ayah = dat.ayahs!
      //     .map((e) => Ayahs.fromJson(e as Map<String, dynamic>))
      //     .toList();

      //  .map((e) => Ayahs.fromJson(e)).toList();

      log("${dat.ayahs![1].text}");
    } catch (e) {
      log("${e.toString()}", name: "Juz Eror");
    }
  }

  @override
  void onInit() {
    super.onInit();
    getJuzAyh();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
