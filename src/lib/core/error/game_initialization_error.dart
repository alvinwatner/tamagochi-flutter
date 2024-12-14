class GameInitializationError implements Exception {
  final String message;

  GameInitializationError(this.message);

  @override
  String toString() => 'GameInitializationError: $message';
}
