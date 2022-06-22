enum AuthenticationException {
  WRONG_PASSWORD,
  DONT_VERIFY,
}

extension AuthenticationExceptionDescription on AuthenticationException {
  String? get description {
    switch (this) {
      case AuthenticationException.WRONG_PASSWORD:
        return 'Email hoặc mật khẩu không chính xác';
      case AuthenticationException.DONT_VERIFY:
        return 'Tài khoản của bạn chưa được xác thực !!';

      default:
        return null;
    }
  }
}
