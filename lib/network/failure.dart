abstract class Failure {}

// General failure
class AuthenticationFailure extends Failure {
  String _message;

  AuthenticationFailure(this._message);

  String get message => _message;
}

class ServerFailure extends Failure {
  String _message;

  ServerFailure(this._message);

  String get message => _message;
}

class ConnectionFailure extends Failure {
  final message = 'A Network problem';
}

class CacheFailure extends Failure {
  final message = 'A Cache problem.';
}
