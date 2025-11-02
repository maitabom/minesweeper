import 'package:flutter/material.dart';
import 'package:minesweeper/components/campo_widget.dart';
import 'package:minesweeper/components/resultado_widget.dart';
import 'package:minesweeper/models/campo.dart';

class CampoMinadoPage extends StatelessWidget {
  const CampoMinadoPage({super.key});

  void _reiniciar() {}

  void _abrir(Campo campo) {}

  void _alternarMarcacao(Campo campo) {}

  @override
  Widget build(BuildContext context) {
    Campo campo = Campo(linha: 0, coluna: 0);

    return MaterialApp(
      home: Scaffold(
        appBar: ResultadoWidget(onReiniciar: _reiniciar),
        body: Container(
          child: CampoWidget(
            campo: campo,
            onAbrir: _abrir(campo),
            onAlternarMarcacao: _alternarMarcacao(campo),
          ),
        ),
      ),
    );
  }
}
