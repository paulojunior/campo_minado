class Campo {
  final int linha;
  final int coluna;
  final List<Campo> vizinhos = [];

  Campo({required this.linha, required this.coluna});

  bool _aberto = false;
  bool _marcado = false;
  bool _minado = false;
  bool _explodido = false;

  bool get minado {
    return _minado;
  }

  bool get explodido {
    return _explodido;
  }

  bool get aberto {
    return _aberto;
  }

  bool get marcado {
    return _marcado;
  }

  void minar() {
    _minado = true;
  }

  void abrir() {
    _aberto = true;
  }

  void explodir() {
    _explodido = true;
  }

  void alterarMarcacao() {
    _marcado = !_marcado;
  }

  void reiniciar() {
    _aberto = false;
    _marcado = false;
    _minado = false;
    _explodido = false;
  }
}
