import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
//import 'package:open_file/open_file.dart';
import 'package:flutter_web_browser/flutter_web_browser.dart';

class Shop extends StatefulWidget {
  @override
  _ShopState createState() => _ShopState();
}

class _ShopState extends State<Shop> {
  final GlobalKey webViewKey = GlobalKey();
  InAppWebViewController? _webViewController;
  late PullToRefreshController pullToRefreshController;
  final urlController = TextEditingController();
  double progress = 0;
  String url = 'https://navity.cloudth.win/shop.html#';
  String cookiesString = '';

  double progresss = 0;

  // Track if the PDF was downloaded here.
  bool didDownloadPDF = false;

  // Show the progress status to the user.
  String progressString = 'File has not been downloaded yet.';

  Future<bool> _onWillPop() async {
    return (await showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: new Text('Are you sure?'),
            content: new Text('Do you want to exit an App'),
            actions: <Widget>[
              TextButton(
                onPressed: () =>
                    Navigator.of(context).pop(false), //<-- SEE HERE
                child: new Text('No'),
              ),
              TextButton(
                onPressed: () => _webViewController?.goBack(), // <-- SEE HERE
                child: new Text('Yes'),
              ),
            ],
          ),
        )) ??
        false;
  }

  Future openFile({required String url, String? fileName}) async {
    print("URL : $url");
    print("FILENAME :  $fileName");
    final file = await downloadFile(url, fileName!);

    if (file == null) return;

    print('Path: ${file.path}');

    // OpenFile.open(file.path);
  }

  Future<File?> downloadFile(String url, String name) async {
    final appStorage = await getApplicationDocumentsDirectory();
    final file = File('${appStorage.path}/$name');
    try {
      final Response = await Dio().get(url,
          options: Options(
            responseType: ResponseType.bytes,
            followRedirects: false,
            receiveTimeout: 0,
          ));

      final raf = file.openSync(mode: FileMode.write);
      raf.writeFromSync(Response.data);
      await raf.close();

      return file;
    } catch (e) {
      return null;
    }
  }

  CookieManager cookieManager = CookieManager.instance();

  Future<void> updateCookies(Uri url) async {
    List<Cookie> cookies = await cookieManager.getCookies(url: url);
    cookiesString = '';
    for (Cookie cookie in cookies) {
      cookiesString += '${cookie.name}=${cookie.value};';
    }
    print(cookiesString);
  }

  InAppWebViewGroupOptions options = InAppWebViewGroupOptions(
    crossPlatform: InAppWebViewOptions(
      javaScriptEnabled: true,
      useShouldOverrideUrlLoading: true,
      useOnDownloadStart: true,
      allowFileAccessFromFileURLs: true,
      mediaPlaybackRequiresUserGesture: false,
    ),
    android: AndroidInAppWebViewOptions(
      initialScale: 100,
      allowFileAccess: true,
      useShouldInterceptRequest: true,
      useHybridComposition: true,
    ),
    ios: IOSInAppWebViewOptions(
      allowsInlineMediaPlayback: true,
    ),
  );

  @override
  void initState() {
    super.initState();
    pullToRefreshController = PullToRefreshController(
      options: PullToRefreshOptions(color: Colors.blue),
      onRefresh: () async {
        if (Platform.isAndroid) {
          return _webViewController?.reload();
        } else if (Platform.isIOS) {
          _webViewController?.loadUrl(
              urlRequest: URLRequest(url: await _webViewController?.getUrl()));
        }
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: _onWillPop,
        child: Scaffold(
          appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 0, 0, 0),
        elevation: 0.0,
        titleSpacing: 10.0,
        centerTitle: true,
                  title: Text('Navity Coffee Shop',style: TextStyle(fontSize: 24, color: Color.fromARGB(255, 255, 255, 255))),
        leading: InkWell(
          onTap: () {
             _webViewController?.goBack();
          },
          child: Icon(
            Icons.arrow_back_ios,
            color: Color.fromARGB(255, 255, 196, 0),
          ),
        ),
      ),
          body: SafeArea(
            child: Column(
              children: [
                Expanded(
                  child: Stack(
                    children: [
                      InAppWebView(
                        key: webViewKey,
                        initialUrlRequest: URLRequest(
                          url: Uri.parse(
                              'https://navity.cloudth.win/shop.html#'),
                          headers: {},
                        ),
                        initialOptions: options,
                        pullToRefreshController: pullToRefreshController,
                        //////////////////////////////////////////////////
                        onDownloadStart: (controller, url) async {
                          // dowfnloading a file in a webview application
                          final tempDir = await getTemporaryDirectory();
                          var finalpath =
                              (await getExternalStorageDirectory())!.path;
                          final path = '${tempDir.path}/' + finalpath + '.jpg';
                          final pathpdf =
                              '${tempDir.path}/' + finalpath + '.pdf';
                          print("////////////////////////////////////");
                          print("controller: $controller");
                          print("url: $url");
                          print((await getExternalStorageDirectory())!.path);
                          print("tempDir: $tempDir");
                          print("path: $path");
                          print("pathpdf: $pathpdf");
                          print("////////////////////////////////////");

                          List<String> imagePathArr = url.toString().split(".");
                          List<String> imagePathArr2 =
                              url.toString().split("/");
                          print("image's type  =  ${imagePathArr[3]}");
                          print("image's type2  =  ${imagePathArr2[8]}");
                          var typefile = imagePathArr[3];

                          if (typefile == "jpg") {
                            await Dio().download(url.toString(), path);
                            await ImageGallerySaver.saveFile(path);

                            await showDialog<String>(
                              context: context,
                              builder: (BuildContext context) => AlertDialog(
                                title: Text('Download image successfully'),
                              ),
                            );
                          }
                          if (typefile == "pdf") {
                            openFile(
                                url: url.toString(),
                                fileName: imagePathArr2[8]);
                            await showDialog<String>(
                              context: context,
                              builder: (BuildContext context) => AlertDialog(
                                title: Text('Download File successfully'),
                              ),
                            );
                          }
                        },

                        onWebViewCreated: (controller) {
                          _webViewController = controller;
                        },

                        onLoadStart: (controller, url) {
                          if (url
                              .toString()
                              .startsWith("https://navity.cloudth.win/")) {
                            setState(() {
                              this.url = url.toString();
                              urlController.text = this.url;
                              print('อันนี้ m2face : ' + url.toString());
                            });
                          } else {
                            FlutterWebBrowser.openWebPage(url: url.toString());
                            print('อันนี้ไม่ใช่ m2face : ' + url.toString());
                          }
                        },

                        androidOnPermissionRequest:
                            (controller, origin, resources) async {
                          return PermissionRequestResponse(
                              resources: resources,
                              action: PermissionRequestResponseAction.GRANT);
                        },

                        onLoadStop: (controller, url) async {
                          pullToRefreshController.endRefreshing();
                          if (url != null) {
                            await updateCookies(url);
                          }
                          setState(() {
                            this.url = url.toString();
                            urlController.text = this.url;
                          });
                        },

                        onLoadError: (controller, url, code, message) {
                          pullToRefreshController.endRefreshing();
                        },

                        onProgressChanged: (controller, progress) {
                          if (progress == 100) {
                            pullToRefreshController.endRefreshing();
                          }
                          setState(() {
                            this.progress = progress / 100;
                            urlController.text = this.url;
                          });
                        },

                        onUpdateVisitedHistory:
                            (controller, url, androidIsReload) {
                          setState(() {
                            this.url = url.toString();
                            urlController.text = this.url;
                          });
                        },

                        onConsoleMessage: (controller, consoleMessage) {
                          print(consoleMessage);
                        },
                      ),
                      progress < 1.0
                          ? LinearProgressIndicator(
                              value: progress,
                              backgroundColor: Colors.white,
                              valueColor: AlwaysStoppedAnimation<Color>(
                                  Color.fromARGB(255, 255, 255, 255)),
                            )
                          : Center(),
                    ],
                  ),
                ),
               /* ButtonBar(
                  buttonAlignedDropdown: true,
                  buttonPadding: EdgeInsets.all(2),
                  alignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    ElevatedButton(
                      child: Icon(Icons.arrow_back),
                      onPressed: () {
                        _webViewController?.goBack();
                      },
                    ),
                    ElevatedButton(
                      child: Icon(Icons.arrow_forward),
                      onPressed: () {
                        _webViewController?.goForward();
                      },
                    ),
                    ElevatedButton(
                      child: Icon(Icons.refresh),
                      onPressed: () {
                        _webViewController?.reload();
                      },
                    ),
                  ],
                ),*/
              ],
            ),
          ),
        ));
  }
}
