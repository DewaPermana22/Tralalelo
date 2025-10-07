import 'package:flutter/material.dart';
import 'package:tralalelo_pra_ukk/auth/widgets/input_credentials.dart';
import 'package:tralalelo_pra_ukk/widgets/custom_button.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SignInForm extends StatefulWidget {
  final VoidCallback? onSuccess;

  const SignInForm({super.key, this.onSuccess});

  @override
  State<SignInForm> createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isShowPassword = false;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email tidak boleh kosong';
    }
    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (!emailRegex.hasMatch(value)) {
      return 'Email tidak valid';
    }
    return null;
  }

  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password tidak boleh kosong';
    }
    if (value.length < 9) {
      return 'Password minimal 9 karakter';
    }
    final hasLetter = RegExp(r'[a-zA-Z]').hasMatch(value);
    final hasDigit = RegExp(r'[0-9]').hasMatch(value);
    final hasSpecialChar = RegExp(r'[!@#$%^&*(),.?":{}|<>]').hasMatch(value);

    if (!hasLetter || !hasDigit || !hasSpecialChar) {
      return 'Password harus terdiri dari huruf, angka, dan karakter khusus';
    }
    return null;
  }

  void _handleSignIn() {
    if (_formKey.currentState!.validate()) {
      // Panggil callback jika tersedia
      widget.onSuccess?.call();

      // Atau tampilkan alert seperti sebelumnya
      _showAlert('Success', 'Sign in berhasil! Selamat datang kembali.', true);
    }
  }

  void _showAlert(String title, String message, bool isSuccess) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(
          title,
          style: const TextStyle(
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w600,
          ),
        ),
        content: Text(
          message,
          style: const TextStyle(
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w500,
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              if (isSuccess) {
                Navigator.pushNamed(context, '/home');
              }
            },
            child: const Text(
              'OK',
              style: TextStyle(
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Card(
        color: Theme.of(context).colorScheme.surface,
        elevation: 1,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Welcome Back!',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: Theme.of(context).colorScheme.onSurface,
                  fontFamily: 'Poppins',
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'Sign in to your account to continue',
                style: TextStyle(
                  color: Theme.of(
                    context,
                  ).colorScheme.onSurface.withOpacity(0.7),
                  fontFamily: 'Poppins',
                ),
              ),
              const SizedBox(height: 22),
              InputCredentials(
                labelText: "Email address",
                icon: FontAwesomeIcons.at,
                keyboardType: TextInputType.emailAddress,
                controller: _emailController,
                validator: validateEmail,
              ),
              const SizedBox(height: 16),
              InputCredentials(
                labelText: "Password",
                icon: FontAwesomeIcons.lock,
                obscureText: !_isShowPassword,
                controller: _passwordController,
                validator: validatePassword,
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    "Show Password?",
                    style: TextStyle(
                      fontSize: 14,
                      color: Theme.of(context).colorScheme.onSurface,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Checkbox(
                    value: _isShowPassword,
                    onChanged: (bool? value) {
                      setState(() {
                        _isShowPassword = value ?? false;
                      });
                    },
                    activeColor: Theme.of(context).colorScheme.primary,
                    side: BorderSide(
                      color: Theme.of(context).colorScheme.outline,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 22),
              CustomButton(
                text: 'Sign In',
                onPressed: _handleSignIn,
                height: 50,
              ),
              const SizedBox(height: 10),
              const Row(
                children: [
                  Expanded(child: Divider(color: Colors.grey, thickness: 1)),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: Text(
                      "OR",
                      style: TextStyle(
                        fontSize: 14,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  Expanded(child: Divider(color: Colors.grey, thickness: 1)),
                ],
              ),
              const SizedBox(height: 10),
              SizedBox(
                width: double.infinity,
                child: OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    side: BorderSide(
                      color: Theme.of(context).colorScheme.outline,
                    ),
                  ),
                  onPressed: () {},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        'assets/svg/icons8-google.svg',
                        width: 24,
                        height: 24,
                      ),
                      const SizedBox(width: 12),
                      const Text(
                        "Sign in with Google",
                        style: TextStyle(
                          fontSize: 14,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
