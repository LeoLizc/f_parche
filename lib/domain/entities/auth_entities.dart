/// Represents a user's authentication credentials.
class Credentials {
  final String email;
  final String password;

  Credentials({required this.email, required this.password});
}

/// Represents an authenticated user.
class User {
  final String id;
  final String email;

  User({required this.id, required this.email});
}

/// Represents the result of an authentication attempt.
class AuthResult {
  final User user;
  final String token;

  AuthResult({required this.user, required this.token});
}
