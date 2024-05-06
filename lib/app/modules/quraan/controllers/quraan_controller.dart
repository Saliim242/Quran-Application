import 'dart:developer';
import 'dart:io';

import 'package:get/get.dart';
import 'package:quraan_app/app/modules/quraan/model/new_quran_detail_model.dart';
import 'package:quraan_app/app/modules/quraan/model/quraan_ayah_model.dart';
import 'package:quraan_app/app/modules/quraan/model/quraan_model.dart';
import 'package:quraan_app/app/modules/quraan/providers/quran_provider.dart';

class QuraanController extends GetxController {
  List<QuranDetailModel> det = [];
  List<QuraanKariim> quraan = [];
  List<Ayahs> ayhs = [];
  QuraanAyah ayah = QuraanAyah();
  bool isQuranLoading = false;
  bool isSocket = false;

  bool isQuranAayhLoading = false;
  bool isSocket2 = false;

  getQuraan() async {
    try {
      isQuranLoading = true;
      update();

      List newQuraan = await QuranProvider().getQuran();

      quraan = newQuraan.map((e) => QuraanKariim.fromJson(e)).toList();
      log("Quraan Kariim ${quraan[4].name}");
    } on SocketException {
      //showMessage("Please, check your Internet Connection!");
      log("No Internte");
      isSocket = true;
      update();
    } catch (e) {
      log("${e.toString()}", name: "Quraan Error");
    }
    isQuranLoading = false;
    isSocket = false;
    update();
  }

  getQuraanAyh(int index) async {
    try {
      isQuranAayhLoading = true;
      update();

      // List newQuraan = await QuranProvider().getQuranAyah(index);

      // det = newQuraan.map((e) => QuranDetailModel.fromJson(e)).toList();

       ayah.data = await QuranProvider().getQuranAyah(index);
      //List<Ayahs>? newayah = await ayah.data!.ayahs;

      // ayhs = newayah!
      //     .map((e) => Ayahs.fromJson(e as Map<String, dynamic>))
      //     .toList();
      // log("Quraan Ayh ${det[index].result![index].sura}");
    } on SocketException {
      //showMessage("Please, check your Internet Connection!");
      log("No Internte");
      isSocket2 = true;
      update();
    } catch (e) {
      log("${e.toString()}", name: "Quraan Ayah");
    }
    isQuranAayhLoading = false;
    isSocket = false;
    update();
  }

  @override
  void onInit() {
    super.onInit();
    getQuraanAyh(1);
  }

  @override
  void onClose() {
    super.onClose();
  }
}
