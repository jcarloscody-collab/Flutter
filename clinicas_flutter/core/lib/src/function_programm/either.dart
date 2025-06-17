//Left:
//Right:
sealed class Either<L, R> {}

class Left<L, R> extends Either<L, R> {
  final L value;

  Left({required this.value});
}

class Right<L, R> extends Either<L, R> {
  final R value;

  Right({required this.value});
}
