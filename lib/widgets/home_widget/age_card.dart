import 'package:bmi_getx/controller/bmi_controller.dart';
import 'package:bmi_getx/utils/constant.dart';
import 'package:bmi_getx/widgets/custom_card.dart';
import 'package:bmi_getx/widgets/plus_minus_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AgeCard extends StatelessWidget {
  AgeCard({Key? key}) : super(key: key);

  final BMIController _bmiController = Get.find<BMIController>();
  @override
  Widget build(BuildContext context) {
    return CustomCard(
      color: colorGrey,
      height: 170.0,
      child: Column(
        children: [
          Text(
            'Tuổi',
            style: kTextStyleBold(18.0),
          ),
          const SizedBox(
            height: 32.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                child: const PlusMinusButton(icon: Icons.remove_sharp),
                onTap: () {
                  _bmiController.decreaseAge();
                },
              ),
              Obx(() {
                final age = _bmiController.age.value;
                return Text(
                  age.toString(),
                  style: kTextStyleBold(25.0),
                );
              }),
              InkWell(
                child: const PlusMinusButton(icon: Icons.add),
                onTap: () {
                  _bmiController.increaseAge();
                },
              )
            ],
          ),
        ],
      ),
    );
  }
}
