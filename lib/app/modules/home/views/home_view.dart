import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

import 'package:get/get.dart';
import 'package:quraan_app/app/data/quran_service.dart';
import 'package:quraan_app/app/modules/juz/views/juz_view.dart';
import 'package:quraan_app/app/modules/quraan/views/quraan_view.dart';

import '../../../quran_services.dart';
import '../../../themes/theme_services.dart';
import '../../constant/colors.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (hom) {
        var listServices = [
          QuranServices(
            iconPath: "assets/quran.svg",
            title: 'Al Quraan',
            onTap: () => Navigator.push(
              Get.context!,
              MaterialPageRoute(
                builder: (context) => const QuraanView(),
              ),
            ),
          ),
          QuranServices(
            iconPath: 'assets/quran.svg',
            title: 'Juz',
            onTap: () => Navigator.push(
              Get.context!,
              MaterialPageRoute(
                builder: (context) => const JuzView(),
              ),
            ),
            //=> Navigator.push(
            //   Get.context!,
            //   MaterialPageRoute(
            //     builder: (context) => ExamScreen(),
            //   ),
            // ),
          ),
          QuranServices(
              iconPath: 'assets/quran.svg', title: 'Asma Ullah', onTap: () {}
              // Navigator.push(Get.context!,
              //     MaterialPageRoute(builder: (context) => const FinanceScreen()),),

              ),
          QuranServices(iconPath: 'assets/quran.svg', title: 'Dua', onTap: () {}
              // Navigator.push(
              //   Get.context!,
              //   MaterialPageRoute(
              //     builder: (context) => const DailySchedule(),
              //   ),
              // ),

              ),
          QuranServices(
              iconPath: 'assets/quran.svg',
              title: 'Prayer Time'.tr,
              onTap: () {}
              // Navigator.push(
              //   Get.context!,
              //   MaterialPageRoute(
              //     builder: (context){},
              //   ),
              // ),

              ),
          QuranServices(
              iconPath: 'assets/quran.svg', title: 'Tasbih'.tr, onTap: () {}
              // Navigator.push(
              //   Get.context!,
              //   MaterialPageRoute(
              //     builder: (context){},
              //   ),
              // ),

              ),
        ];
        return Scaffold(
          appBar: AppBar(
            title: Text(
              'Quraan ',
              style: TextStyle(
                fontSize: 17,
                fontFamily: "Metrophobic",
                color: Get.isDarkMode
                    ? AppColor.kBgColor
                    : AppColor.kTextStyleColor,
                fontWeight: FontWeight.w400,
              ),
            ),
            centerTitle: true,
            actions: [
              IconButton(
                onPressed: () {
                  ServicesThemes().changeThemeDynamically();
                },
                icon: Icon(Icons.sanitizer),
              )
            ],
          ),
          body: Column(
            children: [
              AnimatedContainer(
                duration: const Duration(milliseconds: 375),
                child: AnimationLimiter(
                  child: GridView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: listServices.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      // mainAxisExtent: MediaQuery.of(context).size.height * 0.22,
                      //mainAxisSpacing: 8,
                      //crossAxisSpacing: 15,
                    ),
                    itemBuilder: (context, index) =>
                        AnimationConfiguration.staggeredGrid(
                      duration: const Duration(milliseconds: 375),
                      columnCount: listServices.length,
                      position: index,
                      child: ScaleAnimation(
                        delay: const Duration(milliseconds: 200),
                        // horizontalOffset: 50,
                        // verticalOffset: 50.0,
                        child: ScaleAnimation(
                          delay: const Duration(milliseconds: 300),
                          child: InfoServices(
                            sr: listServices[index],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
