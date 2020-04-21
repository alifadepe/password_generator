import 'package:flutter/material.dart';

class CustomCheckbox extends StatelessWidget {
  final String text;
  final bool isChecked;
  final ValueChanged<bool> onChanged;

  CustomCheckbox({
    @required this.text,
    @required this.isChecked,
    @required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Checkbox(
          value: isChecked,
          onChanged: onChanged,
        ),
        Text(text),
      ],
    );
  }
}