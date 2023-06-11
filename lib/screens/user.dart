import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../utils.dart';

class UserScreen extends StatefulWidget {
  @override
  _UserScreen createState() => _UserScreen();
}

class _UserScreen extends State<UserScreen> {
  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;
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
                EdgeInsets.fromLTRB(15 * fem, 98 * fem, 17 * fem, 356 * fem),
            width: double.infinity,
            decoration: const BoxDecoration(
              color: Color(0xffffffff),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.fromLTRB(
                      65 * fem, 0 * fem, 63 * fem, 28 * fem),
                  padding: EdgeInsets.fromLTRB(
                      11 * fem, 11 * fem, 11 * fem, 11 * fem),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: const Color(0xff0c747e),
                    borderRadius: BorderRadius.circular(100 * fem),
                  ),
                  child: Center(
                    child: SizedBox(
                      width: 178 * fem,
                      height: 178 * fem,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(90 * fem),
                        child: Image.asset(
                          'assets/images/profilePicture.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  margin:
                      EdgeInsets.fromLTRB(0 * fem, 0 * fem, 0 * fem, 14 * fem),
                  padding: EdgeInsets.fromLTRB(
                      18 * fem, 14 * fem, 18 * fem, 13 * fem),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    border: Border.all(color: const Color(0xff000000)),
                    color: const Color(0xffffffff),
                    borderRadius: BorderRadius.circular(25 * fem),
                  ),
                  child: Text(
                    (user?.email)!,
                    style: SafeGoogleFont(
                      'Inter',
                      fontSize: 20 * ffem,
                      fontWeight: FontWeight.w400,
                      height: 1.2125 * ffem / fem,
                      color: const Color(0xff000000),
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () => FirebaseAuth.instance.signOut(),
                  child: Container(
                  width: double.infinity,
                  height: 52 * fem,
                  decoration: BoxDecoration(
                    color: const Color(0xffff722d),
                    borderRadius: BorderRadius.circular(25 * fem),
                  ),
                  child: Center(
                    child: Text(
                      'LOGOUT',
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
              ],
            ),
          ),
        ),
      ),
    ),
    );
  }
}
