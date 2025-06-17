//representação do null

final class Nil {
  @override
  String toString() {
    return 'Nil';
  }
}

Nil get nil => Nil();
