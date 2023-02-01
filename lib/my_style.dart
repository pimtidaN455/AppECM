import 'package:flutter/material.dart';

class MyStyle {
  Color blackColor = Color.fromARGB(255, 0, 0, 0);
  Color whiteColor = Color.fromARGB(255, 255, 255, 255);
  Color grayColor = Color.fromARGB(255, 180, 180, 180);
  Color darkColor = Color.fromARGB(255, 68, 68, 68);
  Color prinaryColor = Color(0xff7e6339);
  Color perpleColor = Color.fromARGB(255, 124, 57, 239);
  Color deleteColor = Color.fromARGB(255, 160, 47, 47);
  Color addColor = Color.fromARGB(255, 72, 164, 76);
  Color perpleColorSawang = Color.fromARGB(255, 181, 147, 255);
  Color faColor = Color.fromARGB(255, 94, 166, 255);
  Color famonColor = Color.fromARGB(255, 68, 106, 154);
  Widget showLogo() => Image.asset('images/logo2.png');
}


final kHintTextStyle = TextStyle(
  color: Color.fromARGB(137, 0, 0, 0),
  fontFamily: 'OpenSans',
);

final kLabelStyle = TextStyle(
  color: Color.fromARGB(255, 255, 255, 255),
  fontWeight: FontWeight.bold,
  fontFamily: 'OpenSans',
);

final textt = TextStyle(
                          color: Color.fromARGB(255, 0, 0, 0),
                          fontFamily: 'OpenSans',
                          fontSize: 17.0,
                          fontWeight: FontWeight.normal,
                        );
final textt2 = TextStyle(
                          color: Color.fromARGB(255, 255, 255, 255),
                          fontFamily: 'OpenSans',
                          fontSize: 17.0,
                          fontWeight: FontWeight.normal,
                        );
final kBoxDecorationStyle = BoxDecoration(
  color: Color.fromARGB(255, 255, 255, 255),
  borderRadius: BorderRadius.circular(5.0),
  boxShadow: [
    BoxShadow(
      color: Colors.black12,
      blurRadius: 6.0,
      offset: Offset(0, 2),
    ),
  ],
);