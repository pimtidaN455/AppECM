// ignore_for_file: prefer_const_constructors

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:noey_test_ui/pinpage2.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import '../Menu.dart';
import '../my_style.dart';

class Home extends StatelessWidget {
  // This widget is the root of your application.
  
  Widget StartTab() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Image.asset(
              'images/user.png',
              width: 35,
              height: 35,
              fit: BoxFit.cover,
            ),
            Image.asset(
              'images/logo2.png',
              width: 40,
              height: 40,
              fit: BoxFit.cover,
            ),
            Row(children: <Widget>[
              Image.asset(
                'images/notification.png',
                width: 30,
                height: 30,
                fit: BoxFit.cover,
              ),
              SizedBox(
                width: 15.0,
              ),
              Image.asset(
                'images/turn-off.png',
                width: 30,
                height: 30,
                fit: BoxFit.cover,
              ),
            ]),
          ],
        ),
      ],
    );
  }

  Widget turagam() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        SizedBox(
          height: 30.0,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Row(
              children: [
                Image.asset(
                  'images/line.png',
                  width: 8,
                  height: 35,
                  fit: BoxFit.cover,
                ),
                Text(
                  '  ธุรกรรมด่วน',
                  style: textt,
                ),
              ],
            ),
            Row(children: <Widget>[
              Text(
                'แก้ไข',
                style: textt,
              ),
              SizedBox(
                width: 5.0,
              ),
              Image.asset(
                'images/back.png',
                width: 15,
                height: 10,
                fit: BoxFit.cover,
              ),
            ]),
          ],
        ),
        SizedBox(
          height: 30.0,
        ),
        Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Column(children: <Widget>[
                Image.asset(
                  'images/one.png',
                  width: 60,
                  height: 60,
                  fit: BoxFit.cover,
                ),
                Text(
                  'โอนเงิน',
                  style: textt,
                ),
              ]),
              Column(children: <Widget>[
                Image.asset(
                  'images/two.png',
                  width: 60,
                  height: 60,
                  fit: BoxFit.cover,
                ),
                Text(
                  'เติมเงิน',
                  style: textt,
                ),
              ]),
              Column(children: <Widget>[
                Image.asset(
                  'images/three.png',
                  width: 60,
                  height: 60,
                  fit: BoxFit.cover,
                ),
                Text(
                  'จ่ายบิล',
                  style: textt,
                ),
              ]),
              Column(children: <Widget>[
                Image.asset(
                  'images/four.png',
                  width: 60,
                  height: 60,
                  fit: BoxFit.cover,
                ),
                Text(
                  'ถอนเงิน',
                  style: textt,
                ),
              ]),
            ]),
      ],
    );
  }

  Widget checkyod() {
    return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          SizedBox(
            height: 30.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                children: [
                  Image.asset(
                    'images/line.png',
                    width: 8,
                    height: 35,
                    fit: BoxFit.cover,
                  ),
                  Text(
                    '  เช็คยอดทันที',
                    style: textt,
                  ),
                ],
              ),
              Row(children: <Widget>[
                Text(
                  'ตั้งค่า',
                  style: textt,
                ),
                SizedBox(
                  width: 5.0,
                ),
                Image.asset(
                  'images/back.png',
                  width: 15,
                  height: 10,
                  fit: BoxFit.cover,
                ),
              ]),
            ],
          ),
          SizedBox(
            height: 20.0,
          ),
          Container(
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 225, 225, 225),
              borderRadius: BorderRadius.circular(10),
            ),
            child: ClipRRect(
              //borderRadius: BorderRadius.circular(10),
             // child: Expanded(
                //padding: EdgeInsets.all(30),
                /*padding: EdgeInsets.only(
                        left: 100,
                        top: 25,
                        right: 100,
                        bottom: 25,
                      ),*/
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          height: 20.0,
                        ),
                        Text(
                          " บัญชีของฉัน",
                          style: textt,
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Text(
                          "     xxx-x-x1234-x",
                          style: textt,
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        SizedBox(
                          height: 20.0,
                        ),
                        Text(
                          "ดูยอดเงิน       ",
                          style: textt,
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Text(
                          "100.00 บาท   ",
                          style: textt,
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          //),
        ]);
  }

  Widget Fav() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        SizedBox(
          height: 30.0,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Row(
              children: [
                Image.asset(
                  'images/line.png',
                  width: 8,
                  height: 35,
                  fit: BoxFit.cover,
                ),
                Text(
                  '  รายการโปรด',
                  style: textt,
                ),
              ],
            ),
          ],
        ),
        SizedBox(
          height: 30.0,
        ),
        Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Column(children: <Widget>[
                Image.asset(
                  'images/user.png',
                  width: 40,
                  height: 40,
                  fit: BoxFit.cover,
                ),
                Text(
                  'สมควร',
                  style: textt,
                ),
              ]),
              Column(children: <Widget>[
                Image.asset(
                  'images/user.png',
                  width: 40,
                  height: 40,
                  fit: BoxFit.cover,
                ),
                Text(
                  'สมพงษ์',
                  style: textt,
                ),
              ]),
              Column(children: <Widget>[
                Image.asset(
                  'images/user.png',
                  width: 40,
                  height: 40,
                  fit: BoxFit.cover,
                ),
                Text(
                  'สมศักดิ์',
                  style: textt,
                ),
              ]),
              Column(children: <Widget>[
                Image.asset(
                  'images/user.png',
                  width: 40,
                  height: 40,
                  fit: BoxFit.cover,
                ),
                Text(
                  'สมศรี',
                  style: textt,
                ),
              ]),
            ]),
      ],
    );
  }

  Widget Another() {
    return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          SizedBox(
            height: 30.0,
          ),
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  children: [
                    Image.asset(
                      'images/line.png',
                      width: 8,
                      height: 35,
                      fit: BoxFit.cover,
                    ),
                    Text(
                      '  บริการเพิ่มเติม',
                      style: textt,
                    ),
                  ],
                ),
              ]),
          SizedBox(
            height: 20.0,
          ),
          Row(mainAxisAlignment: MainAxisAlignment.center,
              // ignore: prefer_const_literals_to_create_immutables
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 225, 225, 225),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Container(
                      padding: EdgeInsets.all(50),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 20.0,
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 225, 225, 225),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Container(
                      padding: EdgeInsets.all(50),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 20.0,
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 225, 225, 225),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Container(
                      padding: EdgeInsets.all(50),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[],
                      ),
                    ),
                  ),
                ),
              ]),
          SizedBox(
            height: 20.0,
          ),
          Row(mainAxisAlignment: MainAxisAlignment.center,
              // ignore: prefer_const_literals_to_create_immutables
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 225, 225, 225),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Container(
                      padding: EdgeInsets.all(50),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 20.0,
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 225, 225, 225),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Container(
                      padding: EdgeInsets.all(50),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 20.0,
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 225, 225, 225),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Container(
                      padding: EdgeInsets.all(50),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[],
                      ),
                    ),
                  ),
                ),
              ]),
        ]);
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
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    // ignore: prefer_const_literals_to_create_immutables
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
                  height: double.infinity,
                  child: SingleChildScrollView(
                      physics: AlwaysScrollableScrollPhysics(),
                      padding: EdgeInsets.symmetric(
                        horizontal: 20.0,
                        vertical: 40.0,
                      ),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            StartTab(),
                            turagam(),
                            checkyod(),
                            Fav(),
                            Another()
                          ]))),
            ],
          ),
        ),
      ),
    );
  }
}
