class SignInEntity {
  final String accessToken;
  final String tokenType;
  final String role;

  SignInEntity({
    required this.accessToken,
    required this.tokenType,
    required this.role,
  });
}
