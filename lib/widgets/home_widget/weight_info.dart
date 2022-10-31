import 'package:bmi_getx/controller/bmi_controller.dart';
import 'package:bmi_getx/utils/constant.dart';
import 'package:bmi_getx/widgets/custom_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WeightInfo extends StatelessWidget {
  WeightInfo({Key? key}) : super(key: key);

  final BMIController _bmiController = Get.find<BMIController>();
  @override
  Widget build(BuildContext context) {
    return CustomCard(
      color: colorGrey,
      height: 170.0,
      child: Column(
        children: [
          Expanded(
            child: Text(
              'Cân nặng (kg)',
              style: kTextStyleBold(18.0),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              color: Colors.grey.withOpacity(0.1),
              borderRadius: BorderRadius.circular(40.0),
              border: Border.all(width: 2.0, color: colorGrey),
            ),
            child: SizedBox(
              height: 42.0,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 100,
                itemBuilder: (ctx, index) {
                  final weight = 40 + index;
                  return Center(
                    child: InkWell(
                      onTap: () {
                        _bmiController.getSelectedWeightIndex(index, weight);
                      },
                      child: Obx(() {
                        final selectIndex =
                            _bmiController.selectedWeightIndex.value;
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            weight.toString(),
                            style: selectIndex == index
                                ? kTextStyleBold(25.0)
                                : kTextStyle(16.0),
                          ),
                        );
                      }),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
