import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:noey_test_ui/Page_Home/home.dart';

import 'Menu.dart';
import 'my_style.dart';

class pinpage2 extends StatefulWidget {
  @override
  _pinpage2 createState() => _pinpage2();
}

class _pinpage2 extends State<pinpage2> {
    int pinIndex = 0;
    List<String> currentPin = ["", "", "", "", "", ""];
  TextEditingController pinOneController = TextEditingController();
  TextEditingController pinTwoController = TextEditingController();
  TextEditingController pinThreeController = TextEditingController();
  TextEditingController pinFourController = TextEditingController();
  TextEditingController pinFiveController = TextEditingController();
  TextEditingController pinSixController = TextEditingController();

    var outlineInputBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(50.0),
      borderSide: BorderSide(color: Color.fromARGB(0, 0, 0, 0)));

 Widget buildNumberPad() {
    return Expanded(
        child: Container(
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 4.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                KeyboardNumber(
                  n: 1,
                  onPressed: () {
                    pinIndexSetup("1");
                  },
                ),
                KeyboardNumber(
                  n: 2,
                  onPressed: () {
                    pinIndexSetup("2");
                  },
                ),
                KeyboardNumber(
                  n: 3,
                  onPressed: () {
                    pinIndexSetup("3");
                  },
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                KeyboardNumber(
                  n: 4,
                  onPressed: () {
                    pinIndexSetup("4");
                  },
                ),
                KeyboardNumber(
                  n: 5,
                  onPressed: () {
                    pinIndexSetup("5");
                  },
                ),
                KeyboardNumber(
                  n: 6,
                  onPressed: () {
                    pinIndexSetup("6");
                  },
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                KeyboardNumber(
                  n: 7,
                  onPressed: () {
                    pinIndexSetup("7");
                  },
                ),
                KeyboardNumber(
                  n: 8,
                  onPressed: () {
                    pinIndexSetup("8");
                  },
                ),
                KeyboardNumber(
                  n: 9,
                  onPressed: () {
                    pinIndexSetup("9");
                  },
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Container(
                  width: 60.0,
                  child: MaterialButton(
                    onPressed: null,
                    child: SizedBox(),
                  ),
                ),
                KeyboardNumber(
                  n: 0,
                  onPressed: () {
                    pinIndexSetup("0");
                  },
                ),
                Container(
                  width: 60.0,
                  child: MaterialButton(
                    height: 60.0,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(60.0)),
                    onPressed: () {
                      clearPin();
                    },
                    child: Icon(
                      Icons.backspace_outlined,
                      color: Colors.black,
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    ));
  }

  clearPin() {
    if (pinIndex == 0) {
      pinIndex = 0;
    } else if (pinIndex == 6) {
      setPin(pinIndex, "");
      currentPin[pinIndex - 1] = "";
      pinIndex--;
    } else {
      setPin(pinIndex, "");
      currentPin[pinIndex - 1] = "";
      pinIndex--;
    }
  }

  pinIndexSetup(String text) {
    if (pinIndex == 0) {
      pinIndex = 1;
    } else if (pinIndex < 6) {
      pinIndex++;
    }
    setPin(pinIndex, text);
    currentPin[pinIndex - 1] = text;

    String strPin = "";

    currentPin.forEach((e) {
      strPin += e;
    });
    if (pinIndex == 6) {
      ///////////////////////////
      
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return Menu();
      }));


      print(strPin);
    }
  }

  setPin(int n, String text) {
    switch (n) {
      case 1:
        pinOneController.text = text;
        break;
      case 2:
        pinTwoController.text = text;
        break;
      case 3:
        pinThreeController.text = text;
        break;
      case 4:
        pinFourController.text = text;
        break;
      case 5:
        pinFiveController.text = text;
        break;
      case 6:
        pinSixController.text = text;
        break;
    }
  }

  Widget buildPinRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        PINNumber(
          outlineInputBorder: outlineInputBorder,
          textEditingController: pinOneController,
        ),
        PINNumber(
          outlineInputBorder: outlineInputBorder,
          textEditingController: pinTwoController,
        ),
        PINNumber(
          outlineInputBorder: outlineInputBorder,
          textEditingController: pinThreeController,
        ),
        PINNumber(
          outlineInputBorder: outlineInputBorder,
          textEditingController: pinFourController,
        ),
        PINNumber(
          outlineInputBorder: outlineInputBorder,
          textEditingController: pinFiveController,
        ),
        PINNumber(
          outlineInputBorder: outlineInputBorder,
          textEditingController: pinSixController,
        ),
      ],
    );
  }

  Widget buildSecurityText() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 10),
          child: Image.asset(
            'images/logo2.png',
            width: 100,
            height: 100,
            fit: BoxFit.cover,
          ),
        ),
        Text(
          'กรุณาใส่รหัสผ่าน',
          textAlign: TextAlign.start,
          style: TextStyle(
            color: MyStyle().blackColor,
            fontSize: 20,
            fontFamily: 'Poppins',
          ),
        ),
      ],
    );
  }

  Widget buildForgetPass() {
    return Text(
      'ลืมรหัสผ่าน',
      textAlign: TextAlign.start,
      style: TextStyle(
        decoration: TextDecoration.underline,
        color: MyStyle().blackColor,
        fontSize: 20,
        fontFamily: 'Poppins',
      ),
    );
  }



  Widget _buildEmailTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Email',
          style: kLabelStyle,
        ),
        SizedBox(height: 10.0),
        Container(
          alignment: Alignment.centerLeft,
          decoration: kBoxDecorationStyle,
          height: 60.0,
          child: TextField(
            keyboardType: TextInputType.emailAddress,
            style: TextStyle(
              color: Color.fromARGB(255, 0, 0, 0),
              fontFamily: 'OpenSans',
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14.0),
              prefixIcon: Icon(
                Icons.email,
                color: Color.fromARGB(255, 117, 83, 255),
              ),
              hintText: 'Enter your Email',
              hintStyle: kHintTextStyle,
            ),
          ),
        ),
      ],
    );
  }





  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Stack(
            children: <Widget>[
              Container(
                height: double.infinity,
                width: double.infinity,
                decoration: BoxDecoration(gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color.fromARGB(255, 255, 255, 255),
                      Color.fromARGB(255, 255, 255, 255),
                      Color.fromARGB(255, 255, 255, 255),
                      Color.fromARGB(255, 255, 255, 255),
                    ],
                    stops: [0.1, 0.4, 0.7, 0.9],
                  ),
                ),
              ),
              Container(
          alignment: Alignment.topCenter,
          decoration: kBoxDecorationStyle,  
            padding: EdgeInsets.symmetric(vertical: 110.0,horizontal: 50.0), //ความสูง,ความแคบหน้าจอ
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                buildSecurityText(),
                SizedBox(
          height: 40.0,
        ),
                buildPinRow(),
                 SizedBox(
          height: 20.0,
        ),
                buildNumberPad(),
                buildForgetPass(),
              ],
            ),
          ),
            ],
          ),
        ),
      ),
    );
    }}


  class KeyboardNumber extends StatelessWidget {
  final int n;
  final Function() onPressed;
  KeyboardNumber({required this.n, required this.onPressed});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 70.0,
      height: 70.0,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Color.fromARGB(255, 255, 255, 255).withOpacity(0.1),
      ),
      alignment: Alignment.center,
      child: MaterialButton(
        padding: EdgeInsets.all(0.0),
        onPressed: onPressed,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50.0),
          side: BorderSide(color: Color.fromARGB(40, 0, 0, 0)),
        ),
        height: 90.0,
        child: Text(
          "$n",
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 24 * MediaQuery.of(context).textScaleFactor,
              color: Colors.black,
              fontWeight: FontWeight.normal),
        ),
      ),
    );
  }
}

class PINNumber extends StatelessWidget {
  final TextEditingController textEditingController;
  final OutlineInputBorder outlineInputBorder;
  PINNumber(
      {required this.textEditingController, required this.outlineInputBorder});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 15.0,
      width: 15.0,
      /*decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Color.fromARGB(255, 0, 0, 0),
      ), */
      
      child: TextField(
        controller: textEditingController,
        enabled: false,
        obscureText: true,
        textAlign: TextAlign.center,
        style: TextStyle(
            fontWeight: FontWeight.w900,
            fontSize: 30* MediaQuery.of(context).textScaleFactor,
            color: Color.fromARGB(255, 0, 0, 0)),
      
      ),
    );
  }
}
