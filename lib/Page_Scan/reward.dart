import 'dart:developer';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../my_style.dart';

class Reward_Money extends StatelessWidget {
  const Reward_Money({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Reward_MoneyExample(),
      ),
    );
  }
}

class Reward_MoneyExample extends StatefulWidget {
  const Reward_MoneyExample({Key? key}) : super(key: key);
  @override
  State<StatefulWidget> createState() => _Reward_Money_State();
}

class _Reward_Money_State extends State<Reward_MoneyExample> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

    );
  }
}
