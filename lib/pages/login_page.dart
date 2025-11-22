import 'package:exercise_app/services/auth_service.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final AuthService _authService = AuthService();
  bool _loading = false;
  String? _userEmail;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Google Sign-In')),
      body: Center(
        child: _loading
            ? const CircularProgressIndicator()
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (_userEmail != null) Text('Signed in as: $_userEmail'),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () async {
                      setState(() => _loading = true);
                      final user = await _authService.signInWithGoogle();
                      setState(() {
                        _loading = false;
                        _userEmail = user?.email;
                      });
                    },
                    child: const Text('Sign in with Google'),
                  ),
                ],
              ),
      ),
    );
  }
}
