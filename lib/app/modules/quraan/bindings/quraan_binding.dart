import 'package:get/get.dart';

import '../controllers/quraan_controller.dart';

class QuraanBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<QuraanController>(
      () => QuraanController(),
    );
  }
}
