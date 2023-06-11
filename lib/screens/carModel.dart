import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../main.dart';
import '../utils.dart';

class CarModelScreen extends StatefulWidget {
  @override
  _CarModelScreen createState() => _CarModelScreen();
}

class _CarModelScreen extends State<CarModelScreen> {
  @override
  Widget build(BuildContext context) {
    double baseWidth = 360;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    List<int> electricVehicleRanges = [
      417,
      376,
      402,
      230,
      458,
      311,
      537,
      647,
      537,
      507,
      260
    ];
    return MaterialApp(
      home: Scaffold(
        body: SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: SingleChildScrollView(
            child: Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Color(0xffffffff),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    width: double.infinity,
                    height: 241 * fem,
                    child: Stack(
                      children: [
                        Positioned(
                          left: 0 * fem,
                          top: 0 * fem,
                          child: Align(
                            child: SizedBox(
                              width: 360 * fem,
                              height: 174 * fem,
                              child: Container(
                                decoration: BoxDecoration(
                                  color: const Color(0xff0c747e),
                                  borderRadius: BorderRadius.only(
                                    bottomRight: Radius.circular(35 * fem),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          left: 19 * fem,
                          top: 50 * fem,
                          child: Align(
                            child: SizedBox(
                              width: 143 * fem,
                              height: 25 * fem,
                              child: Text(
                                'Select your car',
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
                        Positioned(
                          left: 19 * fem,
                          top: 91 * fem,
                          child: Align(
                            child: SizedBox(
                              width: 150 * fem,
                              height: 123 * fem,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(25 * fem),
                                child: GestureDetector(
                                  onTap: () {
                                    print(electricVehicleRanges[0]);
                                  },
                                child: Image.asset(
                                  'assets/images/Chevy Bolt EVEUV.png',
                                  fit: BoxFit.cover,
                                ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          left: 189 * fem,
                          top: 91 * fem,
                          child: Align(
                            child: SizedBox(
                              width: 150 * fem,
                              height: 123 * fem,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(25 * fem),
                                child: GestureDetector(
                                  onTap: () {
                                    print(electricVehicleRanges[1]);
                                  },
                                child: Image.asset(
                                  'assets/images/Ford F-150 LightningRivian R1T.png',
                                  fit: BoxFit.cover,
                                ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          left: 19 * fem,
                          top: 190 * fem,
                          child: Align(
                            child: SizedBox(
                              width: 150 * fem,
                              height: 51 * fem,
                              child: Container(
                                decoration: BoxDecoration(
                                  color: const Color(0xffff722d),
                                  borderRadius: BorderRadius.only(
                                    bottomRight: Radius.circular(25 * fem),
                                    bottomLeft: Radius.circular(25 * fem),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          left: 189 * fem,
                          top: 190 * fem,
                          child: Align(
                            child: SizedBox(
                              width: 150 * fem,
                              height: 51 * fem,
                              child: Container(
                                decoration: BoxDecoration(
                                  color: const Color(0xffff722d),
                                  borderRadius: BorderRadius.only(
                                    bottomRight: Radius.circular(25 * fem),
                                    bottomLeft: Radius.circular(25 * fem),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          left: 43 * fem,
                          top: 192 * fem,
                          child: Align(
                            child: SizedBox(
                              width: 103 * fem,
                              height: 49 * fem,
                              child: Text(
                                'Chevy Bolt EVEUV',
                                textAlign: TextAlign.center,
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
                        Positioned(
                          left: 214 * fem,
                          top: 192 * fem,
                          child: Align(
                            child: SizedBox(
                              width: 103 * fem,
                              height: 49 * fem,
                              child: Text(
                                'Ford F-150 Ligthning',
                                textAlign: TextAlign.center,
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
                  Container(
                    padding: EdgeInsets.fromLTRB(
                        19 * fem, 17 * fem, 17 * fem, 0 * fem),
                    width: double.infinity,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          margin: EdgeInsets.fromLTRB(
                              0 * fem, 0 * fem, 2 * fem, 17 * fem),
                          width: double.infinity,
                          height: 150 * fem,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                margin: EdgeInsets.fromLTRB(
                                    0 * fem, 0 * fem, 20 * fem, 0 * fem),
                                width: 150 * fem,
                                height: double.infinity,
                                child: Stack(
                                  children: [
                                    Positioned(
                                      left: 0 * fem,
                                      top: 0 * fem,
                                      child: Align(
                                        child: SizedBox(
                                          width: 150 * fem,
                                          height: 123 * fem,
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(25 * fem),
                                            child: GestureDetector(
                                              onTap: () {
                                                print(electricVehicleRanges[2]);
                                              },
                                            child: Image.asset(
                                              'assets/images/Ford Mustang Mach-E.png',
                                              fit: BoxFit.cover,
                                            ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      left: 0 * fem,
                                      top: 99 * fem,
                                      child: Align(
                                        child: SizedBox(
                                          width: 150 * fem,
                                          height: 51 * fem,
                                          child: Container(
                                            decoration: BoxDecoration(
                                              color: const Color(0xffff722d),
                                              borderRadius: BorderRadius.only(
                                                bottomRight:
                                                    Radius.circular(25 * fem),
                                                bottomLeft:
                                                    Radius.circular(25 * fem),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      left: 6.5 * fem,
                                      top: 101 * fem,
                                      child: Align(
                                        child: SizedBox(
                                          width: 136 * fem,
                                          height: 49 * fem,
                                          child: Text(
                                            'Ford Mustang Mach-E',
                                            textAlign: TextAlign.center,
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
                              SizedBox(
                                width: 152 * fem,
                                height: double.infinity,
                                child: Stack(
                                  children: [
                                    Positioned(
                                      left: 0 * fem,
                                      top: 0 * fem,
                                      child: Align(
                                        child: SizedBox(
                                          width: 152 * fem,
                                          height: 124 * fem,
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(25 * fem),
                                            child: GestureDetector(
                                              onTap: () {
                                                print(electricVehicleRanges[3]);
                                              },
                                            child: Image.asset(
                                              'assets/images/Hyundai IONIQ 5.png',
                                              fit: BoxFit.cover,
                                            ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      left: 0 * fem,
                                      top: 99 * fem,
                                      child: Align(
                                        child: SizedBox(
                                          width: 152 * fem,
                                          height: 51 * fem,
                                          child: Container(
                                            decoration: BoxDecoration(
                                              color: const Color(0xffff722d),
                                              borderRadius: BorderRadius.only(
                                                bottomRight:
                                                    Radius.circular(25 * fem),
                                                bottomLeft:
                                                    Radius.circular(25 * fem),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      left: 1.5 * fem,
                                      top: 100 * fem,
                                      child: Align(
                                        child: SizedBox(
                                          width: 146 * fem,
                                          height: 25 * fem,
                                          child: Text(
                                            'Hyundai IONIQ 5',
                                            textAlign: TextAlign.center,
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
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(
                              0 * fem, 0 * fem, 2 * fem, 17 * fem),
                          width: double.infinity,
                          height: 150 * fem,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                margin: EdgeInsets.fromLTRB(
                                    0 * fem, 0 * fem, 22 * fem, 0 * fem),
                                width: 150 * fem,
                                height: double.infinity,
                                child: Stack(
                                  children: [
                                    Positioned(
                                      left: 0 * fem,
                                      top: 0 * fem,
                                      child: Align(
                                        child: SizedBox(
                                          width: 150 * fem,
                                          height: 123 * fem,
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(25 * fem),
                                            child: GestureDetector(
                                              onTap: () {
                                                print(electricVehicleRanges[4]);
                                              },
                                            child: Image.asset(
                                              'assets/images/Kia EV6.png',
                                              fit: BoxFit.cover,
                                            ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      left: 0 * fem,
                                      top: 99 * fem,
                                      child: Align(
                                        child: SizedBox(
                                          width: 150 * fem,
                                          height: 51 * fem,
                                          child: Container(
                                            decoration: BoxDecoration(
                                              color: const Color(0xffff722d),
                                              borderRadius: BorderRadius.only(
                                                bottomRight:
                                                    Radius.circular(25 * fem),
                                                bottomLeft:
                                                    Radius.circular(25 * fem),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      left: 37.5 * fem,
                                      top: 113 * fem,
                                      child: Align(
                                        child: SizedBox(
                                          width: 74 * fem,
                                          height: 25 * fem,
                                          child: Text(
                                            'Kia EV6',
                                            textAlign: TextAlign.center,
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
                              SizedBox(
                                width: 150 * fem,
                                height: double.infinity,
                                child: Stack(
                                  children: [
                                    Positioned(
                                      left: 0 * fem,
                                      top: 0 * fem,
                                      child: Align(
                                        child: SizedBox(
                                          width: 150 * fem,
                                          height: 123 * fem,
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(25 * fem),
                                            child: GestureDetector(
                                              onTap: () {
                                                print(electricVehicleRanges[5]);
                                              },
                                            child: Image.asset(
                                              'assets/images/Tesla Model 3.png',
                                              fit: BoxFit.cover,
                                            ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      left: 0 * fem,
                                      top: 99 * fem,
                                      child: Align(
                                        child: SizedBox(
                                          width: 150 * fem,
                                          height: 51 * fem,
                                          child: Container(
                                            decoration: BoxDecoration(
                                              color: const Color(0xffff722d),
                                              borderRadius: BorderRadius.only(
                                                bottomRight:
                                                    Radius.circular(25 * fem),
                                                bottomLeft:
                                                    Radius.circular(25 * fem),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      left: 8.5 * fem,
                                      top: 111 * fem,
                                      child: Align(
                                        child: SizedBox(
                                          width: 132 * fem,
                                          height: 25 * fem,
                                          child: Text(
                                            'Tesla Model 3',
                                            textAlign: TextAlign.center,
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
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(
                              0 * fem, 0 * fem, 2 * fem, 16 * fem),
                          width: double.infinity,
                          height: 150 * fem,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                margin: EdgeInsets.fromLTRB(
                                    0 * fem, 0 * fem, 22 * fem, 0 * fem),
                                width: 150 * fem,
                                height: double.infinity,
                                child: Stack(
                                  children: [
                                    Positioned(
                                      left: 0 * fem,
                                      top: 0 * fem,
                                      child: Align(
                                        child: SizedBox(
                                          width: 150 * fem,
                                          height: 123 * fem,
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(25 * fem),
                                            child: GestureDetector(
                                              onTap: () {
                                                print(electricVehicleRanges[6]);
                                              },
                                            child: Image.asset(
                                              'assets/images/Tesla Model S.png',
                                              fit: BoxFit.cover,
                                            ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      left: 0 * fem,
                                      top: 99 * fem,
                                      child: Align(
                                        child: SizedBox(
                                          width: 150 * fem,
                                          height: 51 * fem,
                                          child: Container(
                                            decoration: BoxDecoration(
                                              color: const Color(0xffff722d),
                                              borderRadius: BorderRadius.only(
                                                bottomRight:
                                                    Radius.circular(25 * fem),
                                                bottomLeft:
                                                    Radius.circular(25 * fem),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      left: 9.5 * fem,
                                      top: 111 * fem,
                                      child: Align(
                                        child: SizedBox(
                                          width: 132 * fem,
                                          height: 25 * fem,
                                          child: Text(
                                            'Tesla Model S',
                                            textAlign: TextAlign.center,
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
                              SizedBox(
                                width: 150 * fem,
                                height: double.infinity,
                                child: Stack(
                                  children: [
                                    Positioned(
                                      left: 0 * fem,
                                      top: 0 * fem,
                                      child: Align(
                                        child: SizedBox(
                                          width: 150 * fem,
                                          height: 123 * fem,
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(25 * fem),
                                            child: GestureDetector(
                                              onTap: () {
                                                print(electricVehicleRanges[7]);
                                              },
                                              child: Image.asset(
                                                'assets/images/Tesla Model Y.png',
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      left: 0 * fem,
                                      top: 99 * fem,
                                      child: Align(
                                        child: SizedBox(
                                          width: 150 * fem,
                                          height: 51 * fem,
                                          child: Container(
                                            decoration: BoxDecoration(
                                              color: const Color(0xffff722d),
                                              borderRadius: BorderRadius.only(
                                                bottomRight:
                                                    Radius.circular(25 * fem),
                                                bottomLeft:
                                                    Radius.circular(25 * fem),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      left: 9 * fem,
                                      top: 111 * fem,
                                      child: Align(
                                        child: SizedBox(
                                          width: 133 * fem,
                                          height: 25 * fem,

                                          child: Text(
                                            'Tesla Model Y',
                                            textAlign: TextAlign.center,
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
                            ],
                          ),
                        ),
                        SizedBox(
                          width: double.infinity,
                          height: 150 * fem,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                margin: EdgeInsets.fromLTRB(
                                    0 * fem, 0 * fem, 17 * fem, 0 * fem),
                                width: 150 * fem,
                                height: double.infinity,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(25 * fem),
                                  image: const DecorationImage(
                                    fit: BoxFit.cover,
                                    image: AssetImage(
                                      'assets/images/Tesla Model X.png',
                                    ),
                                  ),
                                ),
                                child: Stack(
                                  children: [
                                    Positioned(
                                      left: 0 * fem,
                                      top: 99 * fem,
                                      child: Align(
                                        child: SizedBox(
                                          width: 150 * fem,
                                          height: 51 * fem,
                                          child: Container(
                                            decoration: BoxDecoration(
                                              color: const Color(0xffff722d),
                                              borderRadius: BorderRadius.only(
                                                bottomRight:
                                                    Radius.circular(25 * fem),
                                                bottomLeft:
                                                    Radius.circular(25 * fem),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      left: 9 * fem,
                                      top: 111 * fem,
                                      child: Align(
                                        child: SizedBox(
                                          width: 133 * fem,
                                          height: 25 * fem,
                                          child: Text(
                                            'Tesla Model X',
                                            textAlign: TextAlign.center,
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
                              SizedBox(
                                width: 157 * fem,
                                height: double.infinity,
                                child: Stack(
                                  children: [
                                    Positioned(
                                      left: 4 * fem,
                                      top: 0 * fem,
                                      child: Align(
                                        child: SizedBox(
                                          width: 149 * fem,
                                          height: 123 * fem,
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(25 * fem),
                                            child: GestureDetector(
                                              onTap: () {
                                                print(electricVehicleRanges[9]);
                                              },
                                            child: Image.asset(
                                              'assets/images/Volkswagen ID.4.png',
                                              fit: BoxFit.cover,
                                            ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      left: 4 * fem,
                                      top: 99 * fem,
                                      child: Align(
                                        child: SizedBox(
                                          width: 150 * fem,
                                          height: 51 * fem,
                                          child: Container(
                                            decoration: BoxDecoration(
                                              color: const Color(0xffff722d),
                                              borderRadius: BorderRadius.only(
                                                bottomRight:
                                                    Radius.circular(25 * fem),
                                                bottomLeft:
                                                    Radius.circular(25 * fem),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      left: 0 * fem,
                                      top: 101 * fem,
                                      child: Align(
                                        child: SizedBox(
                                          width: 157 * fem,
                                          height: 25 * fem,
                                          child: Text(
                                            'Volkswagen ID.4',
                                            textAlign: TextAlign.center,
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
                            ],
                          ),
                        ),
                      ],
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
