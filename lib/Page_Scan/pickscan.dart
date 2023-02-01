/*import 'dart:io';

import 'package:flutter/material.dart';

import 'package:flutter_qr_scan/flutter_qr_scan.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

void main() => runApp(Scannnn());

class Scannnn extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<Scannnn> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: HomePage());
  }
}

class HomePage extends StatefulWidget {
  HomePage({Key ? key}) : super(key: key);

  @override
  _HomePageState createState() => new _HomePageState();
}

class _HomePageState extends State<HomePage> {
  QrReaderViewController? _controller;
  bool isOk = false;
  String ?data;
  String ?rawData;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Plugin example app'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            TextButton(
                onPressed: () async {
                  var image =
                      await ImagePicker().getImage(source: ImageSource.gallery);
                  if (image == null) return;
                  final rest = await FlutterQrReader.imgScan(File(image.path));
                  setState(() {
                    data = rest;
                  });
                },
                child: Text("识别图片")),
            if (data != null) Text('$data\nrawData: $rawData'),
            if (isOk)
              Container(
                width: 320,
                height: 350,
                child: QrReaderView(
                  width: 320,
                  height: 350,
                  callback: (container) {
                    this._controller = container;
                    _controller!.startCamera(onScan);
                  },
                ),
              )
          ],
        ),
      ),
    );
  }

  void onScan(String ?v, List<Offset> offsets, String ?raw) {
    print([v, offsets, raw]);
    setState(() {
      data = v;
      rawData = raw;
    });
    _controller!.stopCamera();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
}*/