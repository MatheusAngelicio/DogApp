
import 'package:flutter/material.dart';

import '../pages/hello_page2.dart';
import '../utils/nav.dart';

class BlueButton extends StatelessWidget {

  String text;
  Color color;

  BlueButton(this.text, {super.key, this.color = Colors.blue});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () {},
        child: Text(text));
  }
}
