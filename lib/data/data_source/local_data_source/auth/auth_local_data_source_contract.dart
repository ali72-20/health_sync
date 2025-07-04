abstract interface class AuthLocalDataSourceContract {

  Future<void> saveToken({required String token});
  Future<String?> getToken();
  Future<void> deleteToken();
}