import 'package:flutter/material.dart';
import 'package:minesweeper/components/resultado_widget.dart';

class CampoMinadoPage extends StatelessWidget {
  const CampoMinadoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: ResultadoWidget(),
        body: Center(child: Text('Tabuleiro')),
      ),
    );
  }
}
