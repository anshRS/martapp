import 'package:client/routes/routes.dart';
import 'package:client/services/auth_service.dart';
import 'package:client/utils/constants.dart';
import 'package:client/widgets/common/custom_button.dart';
import 'package:client/widgets/common/custom_text_field.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _logInFormKey = GlobalKey<FormState>();
  final AuthService authService = AuthService();

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  void logInUser() {
    authService.signInUser(
      context: context,
      email: _emailController.text,
      password: _passwordController.text,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            const SizedBox(
              height: 30,
            ),
            const Center(
              child: Text(
                'Login',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 15),
            const Center(
              child: Text(
                'Welcome back! Login with your credentials',
                style: TextStyle(color: Colors.blueGrey),
              ),
            ),
            const SizedBox(height: 30),
            Container(
              padding: const EdgeInsets.all(8),
              child: Form(
                  key: _logInFormKey,
                  child: Column(
                    children: [
                      CustomTextField(
                        controller: _emailController,
                        hintText: 'youremail@example.com',
                        labelText: 'Email',
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      CustomTextField(
                        controller: _passwordController,
                        hintText: 'Enter strong password',
                        labelText: 'Password',
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      CustomButton(
                        text: 'Sign In',
                        onTap: () {
                          if(_logInFormKey.currentState!.validate()) {
                            logInUser();
                          }  
                        },
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              "Don't have an account?",
                              style: TextStyle(color: Colors.blueGrey),
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            InkWell(
                              onTap: () {
                                Navigator.pushNamed(
                                    context, RouteManager.signupScreen);
                              },
                              child: const Text(
                                'Sign Up',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: UtilityClass.primaryColor,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  )),
            )
          ],
        ),
      ),
    );
  }
}
