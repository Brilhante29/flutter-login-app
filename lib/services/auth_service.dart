class AuthenticationService {
  bool login(String username, String password) {
    // Mocked authentication
    return username == 'usuario' && password == 'senha123';
  }
}
