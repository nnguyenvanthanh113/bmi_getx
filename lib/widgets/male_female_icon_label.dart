import 'package:bmi_getx/utils/constant.dart';
import 'package:flutter/material.dart';

class MaleFemaleIconLabel extends StatelessWidget {
  const MaleFemaleIconLabel({Key? key, required this.label, required this.icon})
      : super(key: key);
  final String label;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(icon,
            color: label == 'Male' ? Colors.orange : Colors.pink, size: 60.0),
        Text(
          label,
          style: kTextStyleBold(18.0),
        )
      ],
    );
  }
}
