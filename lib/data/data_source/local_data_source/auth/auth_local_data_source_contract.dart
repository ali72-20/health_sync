abstract interface class AuthLocalDataSourceContract {

  Future<void> saveToken({required String token});
  Future<String?> getToken();
  Future<void> saveRefreshToken({required String refreshToken});
  Future<String?> getRefreshToken();
  Future<void> deleteRefreshToken();
  Future<void> deleteToken();
}