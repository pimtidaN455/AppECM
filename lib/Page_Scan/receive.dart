import 'dart:developer';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import '../my_style.dart';

class Receive_Money extends StatelessWidget {
  const Receive_Money({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Receive_MoneyExample(),
      ),
    );
  }
}

class Receive_MoneyExample extends StatefulWidget {
  const Receive_MoneyExample({Key? key}) : super(key: key);
  @override
  State<StatefulWidget> createState() => _Receive_Money_State();
}

class _Receive_Money_State extends State<Receive_MoneyExample> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

    );
  }
}
