import 'package:flutter/material.dart';


class HelloPage3 extends StatelessWidget {
  const HelloPage3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Page 3"),
      ),
      body: _body(context),
    );
  }

  _body(context) {
    return Center(
    child: ElevatedButton(onPressed: () {_onClickVoltar(context);},child: Text("Voltar")),);
  }

  _onClickVoltar(context) {
    Navigator.pop(context, "Tela 3");
  }
}
