import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:noey_test_ui/Page_Setting/settingpage.dart';
import 'Page_Home/home.dart';
import 'Page_Scan/menuscan.dart';
import 'Page_Shop/shop_web.dart';
import 'menu.dart';
import 'package:firebase_core/firebase_core.dart';
import 'notification.dart';

void main() async{
  await init();
  runApp(MyApp());
}

Future init() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  await Firebase.initializeApp();
}

class MyApp extends StatelessWidget {
   const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      //title: 'pimtidan455_s_application2',
      //home: Menu(),
      home: Menu(),
    );
  }
}


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String notificationTitle = 'No Title';
  String notificationBody = 'No Body';
  String notificationData = 'No Data';

  @override
  void initState() {
    final firebaseMessaging = FCM();
    firebaseMessaging.setNotifications();
    
    firebaseMessaging.streamCtlr.stream.listen(_changeData);
    firebaseMessaging.bodyCtlr.stream.listen(_changeBody);
    firebaseMessaging.titleCtlr.stream.listen(_changeTitle);
    
    super.initState();
  }

  _changeData(String msg) => setState(() => notificationData = msg);
  _changeBody(String msg) => setState(() => notificationBody = msg);
  _changeTitle(String msg) => setState(() => notificationTitle = msg);

  int currentTab = 0; // to keep track of active tab index
  final List<Widget> screens = [
    Home(),
    Shop(),
    MenuScan(),
    Setting(),
  ]; // to store nested tabs
  final PageStorageBucket bucket = PageStorageBucket();
  Widget currentScreen = Home(); // Our first view in viewport

  @override
  Widget build(BuildContext context) {
     return DefaultTabController(  // Added
      length: 3,  // Added
      initialIndex: 0, //Added
      child: Scaffold(
      body: PageStorage(
        child: currentScreen,
        bucket: bucket,
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.attach_money_sharp,color: Color.fromARGB(255, 255, 255, 255)),
        onPressed: () {},
        backgroundColor: Color.fromARGB(255, 0, 0, 0),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 10,
        child: Container(
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  MaterialButton(
                    minWidth: 40,
                    onPressed: () {
                      setState(() {
                        currentScreen =
                            Home(); // if user taps on this dashboard tab will be active
                        currentTab = 0;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          Icons.home,
                          color: currentTab == 0 ? Color.fromARGB(255, 0, 0, 0) : Colors.grey,
                        ),
                        Text(
                          'Home',
                          style: TextStyle(
                            color: currentTab == 0 ? Color.fromARGB(255, 0, 0, 0) : Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                  MaterialButton(
                    minWidth: 40,
                    onPressed: () {
                      setState(() {
                        currentScreen =
                            Shop(); // if user taps on this dashboard tab will be active
                        currentTab = 1;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          Icons.shopping_cart_outlined,
                          color: currentTab == 1 ? Color.fromARGB(255, 0, 0, 0) : Colors.grey,
                        ),
                        Text(
                          'Market',
                          style: TextStyle(
                            color: currentTab == 1 ? Color.fromARGB(255, 0, 0, 0) : Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),

              // Right Tab bar icons

              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  MaterialButton(
                    minWidth: 40,
                    onPressed: () {
                      setState(() {
                        currentScreen =
                            MenuScan(); // if user taps on this dashboard tab will be active
                        currentTab = 2;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          Icons.qr_code_scanner,
                          color: currentTab == 2 ? Color.fromARGB(255, 0, 0, 0) : Colors.grey,
                        ),
                        Text(
                          'Scan',
                          style: TextStyle(
                            color: currentTab == 2 ? Color.fromARGB(255, 103, 33, 243) : Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                  MaterialButton(
                    minWidth: 40,
                    onPressed: () {
                      setState(() {
                        currentScreen =
                            Setting(); // if user taps on this dashboard tab will be active
                        currentTab = 3;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          Icons.more_vert_outlined,
                          color: currentTab == 3 ? Color.fromARGB(255, 0, 0, 0) : Colors.grey,
                        ),
                        Text(
                          'Other',
                          style: TextStyle(
                            color: currentTab == 3 ? Color.fromARGB(255, 0, 0, 0) : Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    ));
  }
}

