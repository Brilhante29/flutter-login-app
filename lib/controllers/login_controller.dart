 import 'package:flutter/material.dart';

import '../pages/home_page.dart';
import '../services/auth_service.dart';


class LoginController {
  final _authService = AuthenticationService();
  final _formKey = GlobalKey<FormState>();
  String _username = '';
  String _password = '';

  Widget buildLoginForm(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            TextFormField(
              decoration: const InputDecoration(labelText: 'Usuário'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Por favor, insira seu usuário';
                }
                return null;
              },
              onChanged: (value) => _username = value,
            ),
            const SizedBox(height: 16),
            TextFormField(
              decoration: const InputDecoration(labelText: 'Senha'),
              obscureText: true,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Por favor, insira sua senha';
                }
                return null;
              },
              onChanged: (value) => _password = value,
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () => _submit(context),
              child: const Text('Entrar'),
            ),
          ],
        ),
      ),
    );
  }

  void _submit(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      if (_authService.login(_username, _password)) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => HomePage()),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Usuário ou senha incorretos!')),
        );
      }
    }
  }
}
