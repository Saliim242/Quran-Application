import 'dart:async';
import 'package:after_layout/after_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../../constant/colors.dart';
import '../controllers/quraan_controller.dart';
import '../model/quraan_model.dart';
import 'quraan_detail.dart';

//GetView<QuraanController>
class QuraanView extends StatefulWidget {
  const QuraanView({Key? key}) : super(key: key);

  @override
  State<QuraanView> createState() => _QuraanViewState();
}

class _QuraanViewState extends State<QuraanView> with AfterLayoutMixin {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<QuraanController>(
      builder: (qur) {
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
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: ListView(
              children: [
                Column(
                  children: [
                    GetBuilder<QuraanController>(
                      builder: (qu) {
                        if (qu.isQuranLoading) {
                          return Center(
                            child: CircularProgressIndicator.adaptive(),
                          );
                        } else if (qu.quraan.isEmpty) {
                          return Center(
                            child: Text("Quraan Data Not found"),
                          );
                        } else if (qu.isSocket) {
                          return Center(
                            child: Text("No Internet Connection"),
                          );
                        }

                        return ListView.builder(
                          itemCount: qur.quraan.length,
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemBuilder: (_, int index) {
                            return QuraanKariimCard(
                              quran: qur.quraan[index],
                              onTap: () async {
                                //await qur.getQuraanAyh(index);
                                Get.to(
                                  () => QuraanReadingDetail(
                                   
                                    ayah: qu.ayah,
                                    index: index + 1,
                                  ),
                                );
                                print('${index}');
                              },
                            );
                          },
                        );
                      },
                    ),
                  ],
                )
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  FutureOr<void> afterFirstLayout(BuildContext context) {
    Get.find<QuraanController>().getQuraan();
    //throw UnimplementedError();
  }
}

class QuraanKariimCard extends StatelessWidget {
  const QuraanKariimCard({
    super.key,
    required this.quran,
    this.onTap,
  });

  final QuraanKariim quran;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(bottom: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Stack(
                  alignment: Alignment.center,
                  children: [
                    SvgPicture.asset(
                      "assets/start.svg",
                      width: 45,
                      height: 45,
                      fit: BoxFit.cover,
                    ),
                    Text(
                      "${quran.number}",
                      style: TextStyle(
                        fontSize: 17,
                        fontFamily: "Metrophobic",
                        color: Get.isDarkMode
                            ? AppColor.kBgColor
                            : AppColor.kTextStyleColor,
                        fontWeight: FontWeight.w400,
                      ),
                      textAlign: TextAlign.center,
                    )
                  ],
                ),
                SizedBox(width: MediaQuery.of(context).size.width * 0.05),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "${quran.englishName}",
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
                    Text(
                      "${quran.revelationType}",
                      style: TextStyle(
                        fontSize: 14,
                        fontFamily: "Metrophobic",
                        color: Get.isDarkMode
                            ? AppColor.kBgColor.withOpacity(0.65)
                            : AppColor.kTextStyleColor.withOpacity(0.65),
                        fontWeight: FontWeight.w400,
                      ),
                      textAlign: TextAlign.center,
                    )
                  ],
                ),
              ],
            ),
            Text(
              "${quran.name}",
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
    );
  }
}
