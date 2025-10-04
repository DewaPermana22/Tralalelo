import 'package:flutter/material.dart';
import 'package:forui/forui.dart';
import 'package:tralalelo_pra_ukk/widgets/custom_button.dart';

class AuthFormWdget extends StatefulWidget {
  const AuthFormWdget({super.key});

  @override
  State<AuthFormWdget> createState() => _AuthFormWdgetState();
}

class _AuthFormWdgetState extends State<AuthFormWdget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: FTabs(
        children: [
          FTabEntry(
            label: const Text('Sign In'),
            child: FCard(
              title: const Text('Welcome Back!'),
              subtitle: const Text('Sign in to your account to continue'),
              child: Column(
                children: [
                  const SizedBox(height: 16),
                  const FTextField(
                    label: Text('Email'),
                    hint: 'Enter your email',
                  ),
                  const SizedBox(height: 10),
                  const FTextField(
                    label: Text('Password'),
                    hint: 'Enter password',
                  ),
                  const SizedBox(height: 16),
                  CustomButton(text: 'Sign In', onPressed: () {}),
                ],
              ),
            ),
          ),
          FTabEntry(
            label: const Text('Password'),
            child: FCard(
              title: const Text('Password'),
              subtitle: const Text(
                'Change your password here. After saving, you will be logged out.',
              ),
              child: Column(
                children: [
                  const FTextField(label: Text('Current password')),
                  const SizedBox(height: 10),
                  const FTextField(label: Text('New password')),
                  const SizedBox(height: 16),
                  CustomButton(text: 'Create Account', onPressed: () {}),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
