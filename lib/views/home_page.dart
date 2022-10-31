import 'package:bmi_getx/controller/bmi_controller.dart';
import 'package:bmi_getx/utils/constant.dart';
import 'package:bmi_getx/views/bmi_details.dart';
import 'package:bmi_getx/widgets/home_widget/center_card_weight.dart';
import 'package:bmi_getx/widgets/home_widget/male_female_card.dart';
import 'package:bmi_getx/widgets/home_widget/nav_bottom.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);
  final BMIController _bmiController = Get.put(BMIController());

  void _calculatorBMIShowResult(BuildContext context) {
    _bmiController.calculatorBMI();
    final bmi = _bmiController.bmi;
    if (bmi != 0.0) {
      showModalBottomSheet(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(40.0)),
          context: context,
          builder: (ctx) {
            return BMIDetails();
          });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      bottomNavigationBar: const NavBottom(),
      floatingActionButton: FloatingActionButton(
        backgroundColor: colorDarkBlue,
        onPressed: () => _calculatorBMIShowResult(context),
        child: const Text('BMI'),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: SizedBox(
          width: double.maxFinite, //double maxFinite = 1.7976931348623157e+308;
          height: double.maxFinite,
          child: Container(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                kVerticalSpace(44.0),
                Text(
                  'BMI Calculator',
                  style: kTextStyleBold(24.0),
                ),
                kVerticalSpace(24.0),
                MaleFemaleCard(),
                kVerticalSpace(24.0),
                const CenterCardWeigh(),
                kVerticalSpace(24.0),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //   children: [
                //     WeightInfo(),
                //     AgeCard(),
                //   ],
                // )
              ],
            ),
          )),
    );
  }
}
