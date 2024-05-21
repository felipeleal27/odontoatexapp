import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DefaultRadioButton extends StatelessWidget {
  final String title;
  final String value;
  final IconData? icon;
  final String groupValue;
  final Function onChanged;

  const DefaultRadioButton({
    super.key,
    required this.title,
    required this.value,
    required this.groupValue,
    required this.onChanged,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return InkWell(
      onTap: () {
        onChanged(value);
      },
      child: Row(
        children: [
          Radio<String>(
            value: value,
            groupValue: groupValue,
            onChanged: onChanged as void Function(String?),
          ),
          Text(
            title,
            style: TextStyle(
              fontSize: 16,
              color: groupValue == value ? Colors.blue : null,
            ),
          ),
          Expanded(
            child: Align(
              alignment: Alignment.centerRight,
              child: Icon(
                icon,
                size: size.height.h * 0.02,
                color: groupValue == value ? Colors.blue : null,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
