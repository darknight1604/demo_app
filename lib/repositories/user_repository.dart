class UserRepository {
  Future<bool> signup(String username, String password) {
    return Future.delayed(
      const Duration(milliseconds: 1000),
      () => true,
    );
  }

  Future<bool> login(String username, String password) {
    return Future.delayed(
      const Duration(milliseconds: 1000),
      () => true,
    );
  }
}
