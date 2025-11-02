import 'package:flutter/material.dart';
import 'package:minesweeper/components/resultado_widget.dart';
import 'package:minesweeper/components/tabuleiro_widget.dart';
import 'package:minesweeper/exceptions/explosao_exception.dart';
import 'package:minesweeper/models/campo.dart';
import 'package:minesweeper/models/tabuleiro.dart';

class CampoMinadoPage extends StatefulWidget {
  const CampoMinadoPage({super.key});

  @override
  State<CampoMinadoPage> createState() => _CampoMinadoPageState();
}

class _CampoMinadoPageState extends State<CampoMinadoPage> {
  bool? _venceu;

  final Tabuleiro _tabuleiro = Tabuleiro(
    linhas: 15,
    colunas: 12,
    quantidadeBombas: 4,
  );

  void _reiniciar() {
    setState(() {
      _venceu = null;
      _tabuleiro.reiniciar();
    });
  }

  void _abrir(Campo campo) {
    setState(() {
      if (_venceu != null) return;

      try {
        campo.abrir();

        if (_tabuleiro.resolvido) {
          _venceu = true;
        }
      } on ExplosaoException {
        _venceu = false;
        _tabuleiro.revelarBombas();
      }
    });
  }

  void _alternarMarcacao(Campo campo) {
    setState(() {
      if (_venceu != null) return;

      campo.alternarMarcacao();

      if (_tabuleiro.resolvido) {
        _venceu = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: ResultadoWidget(venceu: _venceu, onReiniciar: _reiniciar),
        body: Container(
          child: TabuleiroWidget(
            tabuleiro: _tabuleiro,
            onAbrir: _abrir,
            onAlternarMarcacao: _alternarMarcacao,
          ),
        ),
      ),
    );
  }
}
