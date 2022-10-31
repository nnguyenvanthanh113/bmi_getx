import 'package:bmi_getx/utils/constant.dart';
import 'package:bmi_getx/widgets/custom_card.dart';
import 'package:bmi_getx/widgets/home_widget/height_info.dart';
import 'package:bmi_getx/widgets/home_widget/scale_ruler.dart';
import 'package:flutter/material.dart';

class CenterCardWeigh extends StatelessWidget {
  const CenterCardWeigh({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      height: 190,
      color: colorGrey,
      child: Center(
        child: Column(
          children: [
            Text(
              'Chiều cao (cm)',
              style: kTextStyleBold(20.0),
            ),
            HeightInfo(),
            const ScaleRuler(),
          ],
        ),
      ),
      isCenterCard: true,
    );
  }
}
