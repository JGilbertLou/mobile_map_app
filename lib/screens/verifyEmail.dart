import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../utils.dart';
import 'carModel.dart';

class VerifyEmailScreen extends StatefulWidget {
  @override
  _VerifyEmailScreen createState() => _VerifyEmailScreen();
}

class _VerifyEmailScreen extends State<VerifyEmailScreen> {
  final formKey = GlobalKey<FormState>();
  bool emailVerified = false;
  Timer? timer;

  @override
  initState() {
    super.initState();
    emailVerified = FirebaseAuth.instance.currentUser!.emailVerified;

    if (!emailVerified) {
      sendVerificationEmail();
      timer = Timer.periodic(
        const Duration(seconds: 5),
        (_) => checkVerificationEmail(),
      );
    }
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  Future checkVerificationEmail() async {
    await FirebaseAuth.instance.currentUser!.reload();
    setState(() {
      emailVerified = FirebaseAuth.instance.currentUser!.emailVerified;
    });
    if (emailVerified) {
      timer?.cancel();
    }
  }

  Future sendVerificationEmail() async {
    try {
      final user = FirebaseAuth.instance.currentUser!;
      await user.sendEmailVerification();
    } catch (e) {
      Utils.showSnackBar(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    double baseWidth = 360;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    if (emailVerified) {
      return CarModelScreen();
    } else {
      return MaterialApp(
        home: Scaffold(
          body: SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.fromLTRB(
                    16 * fem, 313 * fem, 16 * fem, 343 * fem),
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: Color(0xffffffff),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      margin: EdgeInsets.fromLTRB(
                          0 * fem, 0 * fem, 1 * fem, 22 * fem),
                      constraints: BoxConstraints(
                        maxWidth: 313 * fem,
                      ),
                      child: Text(
                        'A verification email has been sent to your\nemail.',
                        style: SafeGoogleFont(
                          'Inter',
                          fontSize: 16 * ffem,
                          fontWeight: FontWeight.w400,
                          height: 1.2125 * ffem / fem,
                          color: const Color(0xff000000),
                        ),
                      ),
                    ),
                    TextButton(
                      onPressed: sendVerificationEmail,
                      child: Container(
                        margin: EdgeInsets.fromLTRB(
                            0 * fem, 0 * fem, 0 * fem, 16 * fem),
                        width: double.infinity,
                        height: 52 * fem,
                        decoration: BoxDecoration(
                          color: const Color(0xffff722d),
                          borderRadius: BorderRadius.circular(25 * fem),
                        ),
                        child: Center(
                          child: Text(
                            'RESENT EMAIL',
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
                    TextButton(
                      onPressed: () => FirebaseAuth.instance.signOut(),
                      // cancelaN1 (114:33)
                      child: Text(
                        'Cancel',
                        style: SafeGoogleFont(
                          'Inter',
                          fontSize: 12 * ffem,
                          fontWeight: FontWeight.w400,
                          height: 1.2125 * ffem / fem,
                          color: const Color(0xff0c747e),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    }
  }
}
