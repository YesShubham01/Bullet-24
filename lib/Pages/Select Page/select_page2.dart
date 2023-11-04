import 'package:flutter/material.dart';

class SelectPage2 extends StatefulWidget {
  const SelectPage2({super.key});

  @override
  State<SelectPage2> createState() => _SelectPage2State();
}

class _SelectPage2State extends State<SelectPage2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: 390,
          height: 844,
          clipBehavior: Clip.antiAlias,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment(0.00, -1.00),
              end: Alignment(0, 1),
              colors: [Color(0xFFCDE0FF), Color(0xFFE2E7EF)],
            ),
          ),
          child: Stack(
            children: [
              Positioned(
                left: 30,
                top: 206,
                child: SizedBox(
                  width: 329,
                  height: 152,
                  child: Stack(
                    children: [
                      Positioned(
                        left: 0,
                        top: 12,
                        child: Container(
                          width: 329,
                          height: 140,
                          decoration: ShapeDecoration(
                            color: const Color(0xFFD4DFEF),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            shadows: const [
                              BoxShadow(
                                color: Color(0xFF4D72AD),
                                blurRadius: 4,
                                offset: Offset(-3, 6),
                                spreadRadius: 0,
                              )
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        left: 146,
                        top: 0,
                        child: Container(
                          width: 183,
                          height: 141,
                          decoration: ShapeDecoration(
                            image: const DecorationImage(
                              image:
                                  AssetImage("images/SampleBike/Sample1.png"),
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                        ),
                      ),
                      const Positioned(
                        left: 30,
                        top: 30,
                        child: SizedBox(
                          width: 90,
                          height: 42,
                          child: Text(
                            'Buy',
                            style: TextStyle(
                              color: Color(0xFF0A2E68),
                              fontSize: 36,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w700,
                              height: 0,
                            ),
                          ),
                        ),
                      ),
                      const Positioned(
                        left: 30,
                        top: 79,
                        child: SizedBox(
                          width: 128,
                          height: 43,
                          child: Text(
                            'Choose from certified vehicles.',
                            style: TextStyle(
                              color: Color(0xFF4D72AD),
                              fontSize: 14,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w700,
                              height: 0,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 30,
                top: 403,
                child: SizedBox(
                  width: 388,
                  height: 156,
                  child: Stack(
                    children: [
                      Positioned(
                        left: 0,
                        top: 16,
                        child: Container(
                          width: 329,
                          height: 140,
                          decoration: ShapeDecoration(
                            color: const Color(0xFFD4DFEF),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            shadows: const [
                              BoxShadow(
                                color: Color(0xFF4D72AD),
                                blurRadius: 4,
                                offset: Offset(-2, 6),
                                spreadRadius: 0,
                              )
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        left: 158,
                        top: 0,
                        child: Container(
                          width: 230,
                          height: 146,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              image:
                                  AssetImage("images/SampleBike/sample2.png"),
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                      ),
                      const Positioned(
                        left: 30,
                        top: 34,
                        child: SizedBox(
                          width: 90,
                          height: 42,
                          child: Text(
                            'Sell',
                            style: TextStyle(
                              color: Color(0xFF092D68),
                              fontSize: 36,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w700,
                              height: 0,
                            ),
                          ),
                        ),
                      ),
                      const Positioned(
                        left: 30,
                        top: 83,
                        child: SizedBox(
                          width: 128,
                          height: 43,
                          child: Text(
                            'Get best price online instantly.',
                            style: TextStyle(
                              color: Color(0xFF4D72AD),
                              fontSize: 14,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w700,
                              height: 0,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const Positioned(
                left: 30,
                top: 12,
                child: SizedBox(
                  width: 100,
                  height: 69.49,
                  child: Image(
                      image: AssetImage("images/SplashPage/bullet_logo.PNG")),
                ),
              ),
              const Positioned(
                left: 30,
                top: 152,
                child: SizedBox(
                  width: 329,
                  height: 26,
                  child: Text(
                    'What would you like to do?\n',
                    style: TextStyle(
                      color: Color(0xFF0A2E68),
                      fontSize: 24,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w700,
                      height: 0,
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 30,
                top: 631,
                child: SizedBox(
                  width: 329,
                  height: 58,
                  child: Stack(
                    children: [
                      Positioned(
                        left: 0,
                        top: 0,
                        child: Container(
                          width: 329,
                          height: 58,
                          decoration: ShapeDecoration(
                            color: const Color(0xFFA7B3C6),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            shadows: const [
                              BoxShadow(
                                color: Color(0xFF496A9F),
                                blurRadius: 4,
                                offset: Offset(-2, 6),
                                spreadRadius: 0,
                              )
                            ],
                          ),
                        ),
                      ),
                      const Positioned(
                        left: 114,
                        top: 17,
                        child: SizedBox(
                          width: 101,
                          height: 23,
                          child: Text(
                            'Continue',
                            style: TextStyle(
                              color: Color(0xFFD1DAE7),
                              fontSize: 22,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w700,
                              height: 0,
                            ),
                          ),
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
