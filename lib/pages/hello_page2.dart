import 'package:flutter/material.dart';

import '../widgetssssss/blue_button.dart';

class HelloPage2 extends StatelessWidget {
  const HelloPage2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Page 2"),
      ),
      body: _body(context),
    );
  }

  _body(context) {
    return Center(child: BlueButton("Voltar",));
  }

  _onClickVoltar(context) {
    Navigator.pop(context, "Tela 2");
  }
}
