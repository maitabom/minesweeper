import 'package:flutter/material.dart';
import 'package:minesweeper/components/resultado_widget.dart';
import 'package:minesweeper/components/tabuleiro_widget.dart';
import 'package:minesweeper/models/campo.dart';
import 'package:minesweeper/models/tabuleiro.dart';

class CampoMinadoPage extends StatefulWidget {
  const CampoMinadoPage({super.key});

  @override
  State<CampoMinadoPage> createState() => _CampoMinadoPageState();
}

class _CampoMinadoPageState extends State<CampoMinadoPage> {
  void _reiniciar() {}

  void _abrir(Campo campo) {}

  void _alternarMarcacao(Campo campo) {}

  @override
  Widget build(BuildContext context) {
    Tabuleiro tabuleiro = Tabuleiro(
      linhas: 10,
      colunas: 10,
      quantidadeBombas: 10,
    );

    return MaterialApp(
      home: Scaffold(
        appBar: ResultadoWidget(onReiniciar: _reiniciar),
        body: Container(
          child: TabuleiroWidget(
            tabuleiro: tabuleiro,
            onAbrir: _abrir,
            onAlternarMarcacao: _alternarMarcacao,
          ),
        ),
      ),
    );
  }
}
