import 'package:amazon/common/widgets/custom_button.dart';
import 'package:amazon/constants/global_variables.dart';
import 'package:flutter/material.dart';

import '../../../common/widgets/custom_textfield.dart';

enum Auth { login, signup }

class AuthScreen extends StatefulWidget {
  static const String routeName = "/auth-screen";

  const AuthScreen({Key? key}) : super(key: key);

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  Auth _auth = Auth.signup;
  final _signupFormKey = GlobalKey<FormState>();
  final _loginFormKey = GlobalKey<FormState>();

  final TextEditingController _nameTEController = TextEditingController();
  final TextEditingController _emailTEController = TextEditingController();
  final TextEditingController _passwordTEController = TextEditingController();

  /// May have any memory leaks or
  /// similar issues occurring, for
  /// that using this.
  @override
  void dispose() {
    super.dispose();
    _nameTEController.dispose();
    _emailTEController.dispose();
    _passwordTEController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: GlobalVariables.greyBackgroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Welcome',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w500,
                ),
              ),
              ListTile(
                tileColor: _auth == Auth.signup
                    ? GlobalVariables.backgroundColor
                    : GlobalVariables.greyBackgroundColor,
                title: const Text(
                  'Create Account.',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                leading: Radio(
                  value: Auth.signup,
                  groupValue: _auth,
                  onChanged: (Auth? value) {
                    setState(() {
                      if (value != null) {
                        _auth = value;
                      }
                    });
                  },
                ),
              ),
              if (_auth == Auth.signup)
                Container(
                  color: GlobalVariables.backgroundColor,
                  padding: const EdgeInsets.all(8),
                  child: Form(
                    key: _signupFormKey,
                    child: Column(
                      children: [
                        CustomTextField(
                          textEditingController: _nameTEController,
                          hintText: 'Username',
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        CustomTextField(
                          textEditingController: _emailTEController,
                          hintText: 'Email',
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        CustomTextField(
                          textEditingController: _passwordTEController,
                          hintText: 'Password',
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        CustomButton(text: 'Sign Up', onTap: () {})
                      ],
                    ),
                  ),
                ),
              ListTile(
                tileColor: _auth == Auth.login
                    ? GlobalVariables.backgroundColor
                    : GlobalVariables.greyBackgroundColor,
                title: const Text(
                  'Login.',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                leading: Radio(
                  value: Auth.login,
                  groupValue: _auth,
                  onChanged: (Auth? value) {
                    setState(() {
                      if (value != null) {
                        _auth = value;
                      }
                    });
                  },
                ),
              ),
              if (_auth == Auth.login)
                Container(
                  color: GlobalVariables.backgroundColor,
                  padding: const EdgeInsets.all(8),
                  child: Form(
                    key: _loginFormKey,
                    child: Column(
                      children: [
                        CustomTextField(
                          textEditingController: _emailTEController,
                          hintText: 'Email',
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        CustomTextField(
                          textEditingController: _passwordTEController,
                          hintText: 'Password',
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        CustomButton(text: 'Login', onTap: () {})
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
