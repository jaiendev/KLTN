enum AuthenticationException {
  WRONG_PASSWORD,
  DONT_VERIFY,
}

extension AuthenticationExceptionDescription on AuthenticationException {
  String? get description {
    switch (this) {
      case AuthenticationException.WRONG_PASSWORD:
        return 'Incorrect email or password';
      case AuthenticationException.DONT_VERIFY:
        return 'Account not verified!';

      default:
        return null;
    }
  }
}
