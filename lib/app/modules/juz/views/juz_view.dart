import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';
import 'package:quraan_app/app/modules/juz/views/read_juz.dart';

import '../../constant/colors.dart';
import '../controllers/juz_controller.dart';

class JuzView extends GetView<JuzController> {
  const JuzView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Juz',
          style: TextStyle(
            fontSize: 17,
            fontFamily: "Metrophobic",
            color:
                Get.isDarkMode ? AppColor.kBgColor : AppColor.kTextStyleColor,
            fontWeight: FontWeight.w400,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: ListView(
          children: [
            Column(
              children: [
                AnimatedContainer(
                  duration: const Duration(milliseconds: 375),
                  child: AnimationLimiter(
                    child: GridView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: 30,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        // mainAxisExtent: MediaQuery.of(context).size.height * 0.22,
                        mainAxisSpacing: 10,
                        crossAxisSpacing: 10,
                      ),
                      itemBuilder: (context, index) =>
                          AnimationConfiguration.staggeredGrid(
                        duration: const Duration(milliseconds: 375),
                        columnCount: 30,
                        position: index,
                        child: ScaleAnimation(
                          delay: const Duration(milliseconds: 200),
                          // horizontalOffset: 50,
                          // verticalOffset: 50.0,
                          child: ScaleAnimation(
                            delay: const Duration(milliseconds: 300),
                            child: JuzQuranCard(
                              index: index + 1,
                              onTap: () {
                                // Get.to(() => ReadJuz(j: ju));
                                // log("Index of Juz ${index + 1}");
                              },
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class JuzQuranCard extends StatelessWidget {
  const JuzQuranCard({
    super.key,
    required this.index,
    this.onTap,
  });
  final int index;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          width: 100,
          height: 100,
          decoration: BoxDecoration(
            color: Get.isDarkMode
                ? Theme.of(context).cardColor
                : Colors.white.withOpacity(0.6),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Stack(
            alignment: Alignment.center,
            children: [
              SvgPicture.asset(
                "assets/start.svg",
                width: 60,
                height: 60,
                fit: BoxFit.cover,
              ),
              Text(
                "$index",
                style: TextStyle(
                  fontSize: 17,
                  fontFamily: "Metrophobic",
                  color: Get.isDarkMode
                      ? AppColor.kBgColor
                      : AppColor.kTextStyleColor,
                  fontWeight: FontWeight.w600,
                ),
                textAlign: TextAlign.center,
              )
            ],
          ),
        ),
      ),
    );
  }
}
