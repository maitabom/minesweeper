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
  Tabuleiro? _tabuleiro;

  void _reiniciar() {
    setState(() {
      _venceu = null;
      _tabuleiro?.reiniciar();
    });
  }

  void _abrir(Campo campo) {
    setState(() {
      if (_venceu != null) return;

      try {
        campo.abrir();

        if (_tabuleiro!.resolvido) {
          _venceu = true;
        }
      } on ExplosaoException {
        _venceu = false;
        _tabuleiro?.revelarBombas();
      }
    });
  }

  void _alternarMarcacao(Campo campo) {
    setState(() {
      if (_venceu != null) return;

      campo.alternarMarcacao();

      if (_tabuleiro!.resolvido) {
        _venceu = true;
      }
    });
  }

  Tabuleiro? _getTabuleiro(double largura, double altura) {
    if (_tabuleiro == null) {
      int quantidadeColunas = 12;
      double tamanhoCampo = largura / quantidadeColunas;
      int quantidadeLinhas = (altura / tamanhoCampo).floor();

      _tabuleiro = Tabuleiro(
        linhas: quantidadeLinhas,
        colunas: quantidadeColunas,
        quantidadeBombas: (quantidadeLinhas * quantidadeColunas * 0.1).round(),
      );
    }

    return _tabuleiro;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: ResultadoWidget(venceu: _venceu, onReiniciar: _reiniciar),
        body: Container(
          color: Colors.grey,
          child: LayoutBuilder(
            builder: (context, constraints) {
              return TabuleiroWidget(
                tabuleiro: _getTabuleiro(
                  constraints.maxWidth,
                  constraints.maxHeight,
                )!,
                onAbrir: _abrir,
                onAlternarMarcacao: _alternarMarcacao,
              );
            },
          ),
        ),
      ),
    );
  }
}
