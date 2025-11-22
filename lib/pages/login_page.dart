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
  String? _message; // Can hold email or error message

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
                  if (_message != null)
                    Text(
                      _message!,
                      textAlign: TextAlign.center,
                      style: const TextStyle(fontSize: 16),
                    ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () async {
                      setState(() => _loading = true);
                      try {
                        final user = await _authService.signInWithGoogle();
                        setState(() {
                          _message = user?.email ?? 'Login cancelled';
                        });
                      } catch (e) {
                        setState(() {
                          _message = 'Error: $e';
                        });
                      } finally {
                        setState(() => _loading = false);
                      }
                    },
                    child: const Text('Sign in with Google'),
                  ),
                  const SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () async {
                      await _authService.signOut();
                      setState(() {
                        _message = 'Signed out';
                      });
                    },
                    child: const Text('Sign out'),
                  ),
                ],
              ),
      ),
    );
  }
}
