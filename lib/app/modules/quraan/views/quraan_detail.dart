import 'dart:async';

import 'package:after_layout/after_layout.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:quraan_app/app/modules/quraan/controllers/quraan_controller.dart';
import 'package:quraan_app/app/modules/quraan/model/quraan_ayah_model.dart';

class QuraanReadingDetail extends StatefulWidget {
  const QuraanReadingDetail({
    super.key,
    required this.ayah,
    required this.index,
  });

  final QuraanAyah ayah;

  final int index;

  @override
  State<QuraanReadingDetail> createState() => _QuraanReadingDetailState();
}

class _QuraanReadingDetailState extends State<QuraanReadingDetail>
    with AfterLayoutMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<QuraanController>(
        builder: (aya) {
          if (aya.isQuranAayhLoading) {
            return CircularProgressIndicator();
          }
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 12),
            child: SafeArea(
              child: Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                      itemCount: widget.ayah.data!.ayahs!.length,
                      itemBuilder: (_, int index) {
                        return _ayatItem(ayat: widget.ayah.data!.ayahs![index]);

                        // Column(
                        //   crossAxisAlignment: CrossAxisAlignment.end,
                        //   children: [
                        //     Container(
                        //       margin: EdgeInsets.symmetric(
                        //           horizontal: 10, vertical: 8),
                        //       decoration: BoxDecoration(
                        //         color: Get.isDarkMode
                        //             ? Theme.of(context).cardColor
                        //             : Colors.white,
                        //       ),
                        //       child: Text(
                        //         "${widget.ayah.data!.ayahs![index].text ?? ""}",
                        //       ),
                        //     ),
                        //     //"${widget.ayah.data!.ayahs![index].text ?? ""}",
                        //   ],
                        // );
                      },
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  @override
  FutureOr<void> afterFirstLayout(BuildContext context) {
    //Get.find<QuraanController>().getQuraanAyh(widget.index);
    Get.find<QuraanController>().getQuraanAyh(widget.index);
    // TODO: implement afterFirstLayout
  }
}

Widget _ayatItem({required Ayahs ayat}) => Padding(
      padding: const EdgeInsets.only(top: 25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // const SizedBox(
          //   height: 24,
          // ),
          Row(
            children: [
              Expanded(
                child: Text(
                  ayat.text.toString(),
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18),
                  textAlign: TextAlign.right,
                ),
              ),
            ],
          ),
          // const SizedBox(
          //   height: 16,
          // ),
          // Text(
          //   ayat.number.toString(),
          //   style: TextStyle(color: Colors.grey, fontSize: 16),
          // )
        ],
      ),
    );
