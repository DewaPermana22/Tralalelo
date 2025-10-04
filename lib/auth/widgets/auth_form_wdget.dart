import 'package:flutter/material.dart';
import 'package:forui/forui.dart';
import 'package:tralalelo_pra_ukk/auth/widgets/input_credentials.dart';
import 'package:tralalelo_pra_ukk/widgets/custom_button.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AuthFormWdget extends StatefulWidget {
  const AuthFormWdget({super.key});

  @override
  State<AuthFormWdget> createState() => _AuthFormWdgetState();
}

class _AuthFormWdgetState extends State<AuthFormWdget> {
  // Sign In Controllers
  final _signInFormKey = GlobalKey<FormState>();
  final _signInEmailController = TextEditingController();
  final _signInPasswordController = TextEditingController();
  bool isShowPassword = false;

  // Sign Up Controllers
  final _signUpFormKey = GlobalKey<FormState>();
  final _signUpEmailController = TextEditingController();
  final _signUpPasswordController = TextEditingController();
  final _signUpConfirmPasswordController = TextEditingController();
  bool isShowConfirmPassword = false;

  @override
  void dispose() {
    _signInEmailController.dispose();
    _signInPasswordController.dispose();
    _signUpEmailController.dispose();
    _signUpPasswordController.dispose();
    _signUpConfirmPasswordController.dispose();
    super.dispose();
  }

  // Email Validation
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

  // Password Validation
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

  // Confirm Password Validation
  String? validateConfirmPassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Confirm password tidak boleh kosong';
    }
    if (value != _signUpPasswordController.text) {
      return 'Password tidak sesuai';
    }
    return null;
  }

  // Show Alert Dialog
  void showAlert(String title, String message, bool isSuccess) {
    showDialog(
      context: context,
      builder: (context) => FDialog(
        title: Text(
          title,
          style: const TextStyle(
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w600,
          ),
        ),
        body: Text(
          message,
          style: const TextStyle(
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w500,
          ),
        ),
        actions: [
          FButton(
            child: Text("button"),
            // label:  Text('OK'),
            onPress: () {
              Navigator.of(context).pop();
              if (isSuccess) {
                // Navigate to main page
                Navigator.pushNamed(context, '/home');
              }
            },
          ),
        ],
      ),
    );
  }

  // Sign In Handler
  void handleSignIn() {
    if (_signInFormKey.currentState!.validate()) {
      // Validasi berhasil
      showAlert('Success', 'Sign in berhasil! Selamat datang kembali.', true);
    }
  }

  // Sign Up Handler
  void handleSignUp() {
    if (_signUpFormKey.currentState!.validate()) {
      // Validasi berhasil
      showAlert('Success', 'Akun berhasil dibuat! Selamat datang.', true);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: FTabs(
        children: [
          FTabEntry(
            label: const Text(
              'Sign In',
              softWrap: true,
              style: TextStyle(
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w600,
              ),
            ),
            child: SingleChildScrollView(
              child: Form(
                key: _signInFormKey,
                child: FCard(
                  title: const Text(
                    'Welcome Back!',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  subtitle: const Text(
                    'Sign in to your account to continue',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const SizedBox(height: 22),
                      InputCredentials(
                        labelText: "Email address",
                        icon: FontAwesomeIcons.at,
                        keyboardType: TextInputType.emailAddress,
                        controller: _signInEmailController,
                        validator: validateEmail,
                      ),
                      const SizedBox(height: 10),
                      InputCredentials(
                        labelText: "Password",
                        icon: FontAwesomeIcons.lock,
                        obscureText: !isShowPassword,
                        controller: _signInPasswordController,
                        validator: validatePassword,
                      ),
                      const SizedBox(height: 3),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          const Text(
                            "Show Password?",
                            style: TextStyle(
                              fontSize: 16,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Checkbox(
                            value: isShowPassword,
                            onChanged: (bool? value) {
                              setState(() {
                                isShowPassword = value ?? false;
                              });
                            },
                            activeColor: Colors.green,
                          ),
                        ],
                      ),
                      const SizedBox(height: 22),
                      CustomButton(
                        text: 'Sign In',
                        onPressed: handleSignIn,
                        height: 40,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),

          FTabEntry(
            label: const Text(
              'Create Account',
              style: TextStyle(
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w600,
              ),
            ),
            child: SingleChildScrollView(
              child: Form(
                key: _signUpFormKey,
                child: FCard(
                  title: const Text(
                    'Create New Account',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  subtitle: const Text(
                    'Fill in the details below to register your account.',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const SizedBox(height: 22),
                      InputCredentials(
                        labelText: "Email address",
                        icon: FontAwesomeIcons.at,
                        keyboardType: TextInputType.emailAddress,
                        controller: _signUpEmailController,
                        validator: validateEmail,
                      ),
                      const SizedBox(height: 10),
                      InputCredentials(
                        labelText: "Password",
                        icon: FontAwesomeIcons.lock,
                        obscureText: !isShowConfirmPassword,
                        controller: _signUpPasswordController,
                        validator: validatePassword,
                      ),
                      const SizedBox(height: 3),
                      const SizedBox(height: 10),
                      InputCredentials(
                        labelText: "Confirm Password",
                        icon: FontAwesomeIcons.lock,
                        obscureText: !isShowConfirmPassword,
                        controller: _signUpConfirmPasswordController,
                        validator: validateConfirmPassword,
                      ),
                      const SizedBox(height: 3),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          const Text(
                            "Show Password?",
                            style: TextStyle(
                              fontSize: 16,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Checkbox(
                            value: isShowConfirmPassword,
                            onChanged: (bool? value) {
                              setState(() {
                                isShowConfirmPassword = value ?? false;
                              });
                            },
                            activeColor: Colors.green,
                          ),
                        ],
                      ),
                      const SizedBox(height: 22),
                      CustomButton(
                        text: 'Create Account',
                        onPressed: handleSignUp,
                        height: 40,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
