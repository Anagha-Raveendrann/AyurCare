import 'dart:ui' show ImageFilter;
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void _onLogin() {
    if (_formKey.currentState!.validate()) {
      // ✅ All validations passed
      print('Email: ${emailController.text}');
      print('Password: ${passwordController.text}');

      // TODO: Call Login API here
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            /// Top Image Section
            Stack(
              alignment: Alignment.center,
              children: [
                Image.asset(
                  'assets/a8b961715b401b955622ed1c02596fecdc965edc.jpg',
                  height: 380,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
                BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 7, sigmaY: 7),
                  child: Container(color: Colors.black.withOpacity(0.35)),
                ),
                Image.asset('assets/Asset 1 2.png', height: 80),
              ],
            ),

            const SizedBox(height: 60),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Login Or Register To Book\nYour Appointments',
                      style:
                          TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                    ),

                    const SizedBox(height: 24),

                    const Text('Email'),
                    const SizedBox(height: 6),
                    _inputField(
                      controller: emailController,
                      hint: 'Enter your email',
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Email is required';
                        }
                        if (!RegExp(
                                r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
                            .hasMatch(value)) {
                          return 'Enter a valid email';
                        }
                        return null;
                      },
                    ),

                    const SizedBox(height: 20),

                    const Text('Password'),
                    const SizedBox(height: 6),
                    _inputField(
                      controller: passwordController,
                      hint: 'Enter password',
                      obscure: true,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Password is required';
                        }
                        if (value.length < 6) {
                          return 'Password must be at least 6 characters';
                        }
                        return null;
                      },
                    ),

                    const SizedBox(height: 80),

                    /// Login Button
                    SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: ElevatedButton(
                        onPressed: _onLogin,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF0A6C3B),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: const Text(
                          'Login',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 140),

                    Center(
                      child: Text.rich(
                        TextSpan(
                          text:
                              'By creating or logging into an account you are agreeing\nwith our ',
                          style:
                              TextStyle(fontSize: 12, color: Colors.grey),
                          children: const [
                            TextSpan(
                                text: 'Terms and Conditions',
                                style: TextStyle(color: Colors.blue)),
                            TextSpan(text: ' and '),
                            TextSpan(
                                text: 'Privacy Policy.',
                                style: TextStyle(color: Colors.blue)),
                          ],
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Reusable Input Field with Validation
  Widget _inputField({
    required String hint,
    required TextEditingController controller,
    bool obscure = false,
    String? Function(String?)? validator,
  }) {
    return TextFormField(
      controller: controller,
      obscureText: obscure,
      validator: validator,
      decoration: InputDecoration(
        hintText: hint,
        filled: true,
        fillColor: const Color(0xFFF5F5F5),
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
