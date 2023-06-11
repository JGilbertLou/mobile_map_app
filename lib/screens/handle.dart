

import 'package:flutter/cupertino.dart';
import 'package:untitled4/screens/register.dart';

import 'login.dart';

class Handler extends StatefulWidget {
  @override
  _Handler createState() => _Handler();
}

class _Handler extends State<Handler> {
  bool isLogin = true;

  @override
  Widget build(BuildContext context) =>
      isLogin ? LoginScreen(onTapRegister: toggle) : RegisterScreen(onTapLogin: toggle);
      void toggle() => setState(() {
        isLogin = !isLogin;
      });
}