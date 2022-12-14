import 'package:bmi_getx/controller/bmi_controller.dart';
import 'package:bmi_getx/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HeightInfo extends StatelessWidget {
  HeightInfo({Key? key}) : super(key: key);
  final BMIController _bmiController = Get.find<BMIController>();
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50.0,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 160,
        itemBuilder: (ctx, index) {
          final height = 100 + index;
          return Center(
            child: InkWell(
              onTap: () {
                _bmiController.getSelectedHeightIndex(index, height);
              },
              child: Obx(() {
                final selectedIndex = _bmiController.selectedHeightIndex.value;
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    height.toString(),
                    style: selectedIndex == index
                        ? kTextStyleBold(24.0)
                        : kTextStyle(16),
                  ),
                );
              }),
            ),
          );
        },
      ),
    );
  }
}
