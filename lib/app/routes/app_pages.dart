import 'package:get/get.dart';

import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/juz/bindings/juz_binding.dart';
import '../modules/juz/views/juz_view.dart';
import '../modules/quraan/bindings/quraan_binding.dart';
import '../modules/quraan/views/quraan_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.QURAAN,
      page: () => const QuraanView(),
      binding: QuraanBinding(),
    ),
    GetPage(
      name: _Paths.JUZ,
      page: () => const JuzView(),
      binding: JuzBinding(),
    ),
  ];
}
