import 'package:flutter/material.dart';

class CampoMinadoPage extends StatelessWidget {
  const CampoMinadoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Campo Minado')),
        body: Center(child: Text('Tabuleiro')),
      ),
    );
  }
}
