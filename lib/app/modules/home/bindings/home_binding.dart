import 'package:get/get.dart';
import 'package:quraan_app/app/modules/juz/controllers/juz_controller.dart';

import '../../quraan/controllers/quraan_controller.dart';
import '../controllers/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(
      () => HomeController(),
    );

    Get.put(QuraanController(), permanent: true);
    Get.put(JuzController(), permanent: true);
  }
}
