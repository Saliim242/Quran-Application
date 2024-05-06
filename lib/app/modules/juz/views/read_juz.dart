import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quraan_app/app/modules/juz/controllers/juz_controller.dart';
import 'package:quraan_app/app/modules/juz/models/juz_model.dart';

class ReadJuz extends StatelessWidget {
  const ReadJuz({super.key, required this.j});

  final JuzData j;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: GetBuilder<JuzController>(
        builder: (juz) {
          return Column(
            children: [
              ListView.builder(
                itemCount: j.ayahs!.length,
                shrinkWrap: true,
                itemBuilder: (_, int index) {
                  return Text("Saalim");
                },
              )
            ],
          );
        },
      ),
    );
  }
}
