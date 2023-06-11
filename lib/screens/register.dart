import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../main.dart';
import '../utils.dart';

class RegisterScreen extends StatefulWidget {
  final Function() onTapLogin;

  const RegisterScreen({
    Key? key,
    required this.onTapLogin,
}) : super(key: key);

  @override
  _RegisterScreen createState() => _RegisterScreen();
}

class _RegisterScreen extends State<RegisterScreen> {
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double baseWidth = 360;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return MaterialApp(
      home: Scaffold(
        body: SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: SingleChildScrollView(
            child: Container(
              padding:
                  EdgeInsets.fromLTRB(15 * fem, 49 * fem, 16 * fem, 49 * fem),
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Color(0xffffffff),
              ),
              child: Form(
                key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.fromLTRB(
                        0 * fem, 0 * fem, 0 * fem, 20 * fem),
                    width: double.infinity,
                    height: 100 * fem,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("assets/images/WiredMaps_logo.png"),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 16 * fem,
                  ),
                  Container(
                    margin:
                        EdgeInsets.fromLTRB(0 * fem, 0 * fem, 1 * fem, 0 * fem),
                    padding: EdgeInsets.fromLTRB(
                        18 * fem, 15 * fem, 18 * fem, 12 * fem),
                    width: 328 * fem,
                    decoration: BoxDecoration(
                      border: Border.all(color: const Color(0xff000000)),
                      color: const Color(0xffffffff),
                      borderRadius: BorderRadius.circular(25 * fem),
                    ),
                    child: TextFormField(
                      controller: emailController,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (email) =>
                      email != null && !EmailValidator.validate(email)
                      ? 'Enter a valid email' : null,
                      style: SafeGoogleFont(
                        'Inter',
                        fontSize: 20 * ffem,
                        fontWeight: FontWeight.w400,
                        height: 1.2125 * ffem / fem,
                        color: const Color(0xff000000),
                      ),
                      decoration: const InputDecoration(
                        hintText: 'Email',
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 16 * fem,
                  ),
                  Container(
                    margin:
                        EdgeInsets.fromLTRB(1 * fem, 0 * fem, 0 * fem, 0 * fem),
                    padding: EdgeInsets.fromLTRB(
                        17 * fem, 14 * fem, 17 * fem, 13 * fem),
                    width: 328 * fem,
                    decoration: BoxDecoration(
                      border: Border.all(color: const Color(0xff000000)),
                      color: const Color(0xffffffff),
                      borderRadius: BorderRadius.circular(25 * fem),
                    ),
                    child: TextFormField(
                      controller: passwordController,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (value) => value != null && value.length < 6
                      ? 'Enter a valid password (6 characters min.)' : null,
                      obscureText: true,
                      enableSuggestions: false,
                      autocorrect: false,
                      style: SafeGoogleFont(
                        'Inter',
                        fontSize: 20 * ffem,
                        fontWeight: FontWeight.w400,
                        height: 1.2125 * ffem / fem,
                        color: const Color(0xff000000),
                      ),
                      decoration: const InputDecoration(
                        hintText: 'Password',
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 16 * fem,
                  ),
                  Container(
                    margin:
                        EdgeInsets.fromLTRB(1 * fem, 0 * fem, 0 * fem, 0 * fem),
                    padding: EdgeInsets.fromLTRB(
                        17 * fem, 14 * fem, 17 * fem, 13 * fem),
                    width: 328 * fem,
                    decoration: BoxDecoration(
                      border: Border.all(color: const Color(0xff000000)),
                      color: const Color(0xffffffff),
                      borderRadius: BorderRadius.circular(25 * fem),
                    ),
                    child: TextFormField(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (value) => value != null && value != passwordController.text
                          ? 'Enter the same password' : null,
                      obscureText: true,
                      enableSuggestions: false,
                      autocorrect: false,
                      style: SafeGoogleFont(
                        'Inter',
                        fontSize: 20 * ffem,
                        fontWeight: FontWeight.w400,
                        height: 1.2125 * ffem / fem,
                        color: const Color(0xff000000),
                      ),
                      decoration: const InputDecoration(
                      hintText: 'Confirm Password',
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 16 * fem,
                  ),
                  TextButton(
                    onPressed: register,
                    child: Container (
                    margin:
                        EdgeInsets.fromLTRB(1 * fem, 0 * fem, 0 * fem, 0 * fem),
                    width: 328 * fem,
                    height: 52 * fem,
                    decoration: BoxDecoration(
                      color: const Color(0xff0c747e),
                      borderRadius: BorderRadius.circular(25 * fem),
                    ),
                    child: Center(
                      child: Text(
                        'REGISTER',
                        style: SafeGoogleFont(
                          'Inter',
                          fontSize: 20 * ffem,
                          fontWeight: FontWeight.w400,
                          height: 1.2125 * ffem / fem,
                          color: const Color(0xffffffff),
                        ),
                      ),
                    ),
                    ),
                  ),
                  SizedBox(
                    height: 16 * fem,
                  ),
                  Container(
                    margin:
                        EdgeInsets.fromLTRB(0 * fem, 0 * fem, 2 * fem, 0 * fem),
                    child: RichText(
                      text: TextSpan(
                        style: SafeGoogleFont(
                          'Inter',
                          fontSize: 12 * ffem,
                          fontWeight: FontWeight.w400,
                          height: 1.2125 * ffem / fem,
                          color: const Color(0xff000000),
                        ),
                        children: [
                          const TextSpan(
                            text: 'Already have an account? ',
                          ),
                          TextSpan(
                            text: 'Login here!',
                            style: SafeGoogleFont(
                              'Inter',
                              fontSize: 12 * ffem,
                              fontWeight: FontWeight.w400,
                              height: 1.2125 * ffem / fem,
                              color: const Color(0xffff722d),
                            ),
                              recognizer: TapGestureRecognizer()
                                ..onTap = widget.onTapLogin,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future register() async {
    final isValid = formKey.currentState!.validate();
    if (!isValid) return;
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => const Center(child: CircularProgressIndicator()),
    );

    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailController.text.trim(),
          password: passwordController.text.trim(),
      );
    } on FirebaseAuthException catch (e) {
      print(e);
      Utils.showSnackBar(e.message);
    }

    navigatorKey.currentState!.popUntil((route) => route.isFirst);
  }
}
