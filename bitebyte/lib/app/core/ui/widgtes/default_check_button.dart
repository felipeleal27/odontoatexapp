import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DefaultCheckButton extends StatelessWidget {
  final String title;
  final String value;
  final IconData? icon;
  final bool isSelected;
  final Function onChanged;

  const DefaultCheckButton(
      {super.key,
      required this.title,
      required this.value,
      required this.isSelected,
      required this.onChanged,
      required this.icon});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return InkWell(
      child: Row(
        children: [
          Checkbox(
            value: isSelected,
            onChanged: onChanged as void Function(bool?),
          ),
          Text(
            title,
            style: TextStyle(
              fontSize: 16,
              color: isSelected ? Colors.blue : null,
            ),
          ),
          Expanded(
            child: Align(
              alignment: Alignment.centerRight,
              child: Icon(
                icon,
                size: size.height.h * 0.02,
                color: isSelected ? Colors.blue : null,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
