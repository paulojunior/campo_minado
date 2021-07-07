import 'package:campo_minado/models/campo.dart';
import 'package:campo_minado/exceptions/explosao_exception.dart';

class CampoViewModel {
  Campo campo;

  CampoViewModel({required this.campo});

  void adicionarVizinho(Campo vizinho) {
    final deltaLinha = (campo.linha - vizinho.linha).abs();
    final deltaColuna = (campo.coluna - vizinho.coluna).abs();

    if (deltaLinha == 0 && deltaColuna == 0) {
      return;
    }

    if (deltaLinha <= 1 && deltaColuna <= 1) {
      campo.vizinhos.add(vizinho);
    }
  }

  abrirCampo(Campo c) {
    if (c.aberto) {
      return;
    }

    c.abrir();

    if (c.minado) {
      c.explodir();
      throw ExplosaoException();
    }

    if (vizinhancaSegura(c)) {
      c.vizinhos.forEach((element) => abrirCampo(element));
    }
  }

  bool vizinhancaSegura(Campo c) {
    return c.vizinhos.every((element) => !element.minado);
  }

  void revelarBombas() {
    if (campo.minado) {
      campo.abrir();
    }
  }

  bool get resolvido {
    bool minadoEmarcado = campo.minado && campo.marcado;
    bool seguroEAberto = !campo.minado && campo.aberto;

    return minadoEmarcado || seguroEAberto;
  }

  int get qtdeMinasNaVizinhanca {
    return campo.vizinhos.where((element) => element.minado).length;
  }

  void minar() {
    campo.minar();
  }

  void abrir() {
    campo.abrir();
  }

  bool get aberto {
    return campo.aberto;
  }
}
