import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:quraan_app/app/data/quran_service.dart';
import 'package:quraan_app/app/modules/home/controllers/home_controller.dart';

import 'modules/constant/colors.dart';

class InfoServices extends StatelessWidget {
  final void Function()? onTap;
  const InfoServices({
    super.key,
    this.onTap,
    required this.sr,
  });

  final QuranServices sr;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (hom) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        // crossAxisAlignment: CrossAxisAlignment.center,

        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: GestureDetector(
              onTap: sr.onTap,
              child: Container(
                //padding: EdgeInsets.all(15),
                // margin: EdgeInsets.only(right: 3),
                width: MediaQuery.of(context).size.width,
                // height: MediaQuery.of(context).size.height * 0.15,
                height: 120,

                decoration: BoxDecoration(
                  color: Get.isDarkMode
                      ? Theme.of(context).cardColor
                      : Colors.white.withOpacity(0.6),
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    Get.isDarkMode
                        ? const BoxShadow()
                        : BoxShadow(
                            color: Get.isDarkMode
                                ? Colors.black12.withOpacity(0.3)
                                : Colors.grey.shade300, //.withOpacity(0.35),
                            offset: const Offset(-1, 3),
                            spreadRadius: 0,
                            blurRadius: 7,
                          ),
                  ],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 55,
                      height: 55,
                      child: SvgPicture.asset(
                        sr.iconPath.toString(),
                        color: Get.isDarkMode
                            ? AppColor.kBgColor
                            : AppColor.kPrameryColor,
                        fit: BoxFit.cover,
                        alignment: Alignment.center,
                      ),
                    ),
                    //   SizedBox(height: MediaQuery.of(context).size.height * 0.013),
                    Text(
                      sr.title,
                      style: TextStyle(
                        fontSize: 17,
                        fontFamily: "Metrophobic",
                        color: Get.isDarkMode
                            ? AppColor.kBgColor
                            : AppColor.kTextStyleColor,
                        fontWeight: FontWeight.w400,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      );
    });
  }
}


/*

Container(
      margin: EdgeInsets.symmetric(vertical: 3),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Get.isDarkMode
                ? Colors.black.withOpacity(0.3)
                : Colors.grey.withOpacity(0.35),
            offset: Offset(0, 0),
            spreadRadius: 0,
            blurRadius: 7,
          ),
        ],
      ),
      child: Column(
        children: [
          Text("data"),
        ],
      ),
    )

------

Material(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(10),
        child: InkWell(
          customBorder:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          onTap: sr.onTap,
          child: ListTile(
            leading: Container(
              width: 50,
              height: 50,
              child: SvgPicture.asset(
                sr.iconPath.toString(),
                color: Get.isDarkMode
                    ? AppColor.kBgColor
                    : AppColor.kSecondaryLightColor,
              ),
            ),
            title: Text(
              sr.title.toString(),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: GoogleFonts.metrophobic(fontWeight: FontWeight.w600),
            ),
            // subtitle: Text(
            //   subTitle.toString(),
            //   style: GoogleFonts.poppins(wordSpacing: 2),
            // ),
            // trailing: Container(
            //   width: 50,
            //   height: 50,
            //   child: Icon(
            //     suffixICon,
            //     color: Get.isDarkMode ? Colors.grey : null,
            //     size: 20,
            //   ),
            //   decoration: BoxDecoration(
            //       color: Get.isDarkMode
            //           ? Colors.transparent
            //           : Color(0xff25292C).withOpacity(0.1),
            //       borderRadius: BorderRadius.circular(35)),
            // ),
          ),
        ),
      ),






*/