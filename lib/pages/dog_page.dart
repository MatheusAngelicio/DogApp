import 'package:dogapp/pages/hello_listview.dart';
import 'package:flutter/material.dart';

class DogPage extends StatelessWidget {

  final Dog dog;

  const DogPage({super.key, required this.dog});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(dog.nome),
      ),
      body: Image.asset(dog.foto),
    );
  }
}
