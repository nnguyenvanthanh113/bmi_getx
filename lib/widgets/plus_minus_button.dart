import 'package:bmi_getx/utils/constant.dart';
import 'package:flutter/widgets.dart';

class PlusMinusButton extends StatelessWidget {
  const PlusMinusButton({Key? key, required this.icon}) : super(key: key);

  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 26.0,
        height: 26.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5.0),
          border: Border.all(
            width: 3.0,
            color: colorGrey,
          ),
        ),
        child: Icon(
          icon,
          size: 18.0,
        ),
      ),
    );
  }
}
