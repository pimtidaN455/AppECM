import 'package:flutter/material.dart';

import 'Page_Bucket/Transport.dart';
import 'Page_Scan/menuscan.dart';
import 'Page_Setting/settingpage.dart';
import 'Page_Shop/shop_web.dart';
import 'Page_Home/home.dart';


class Menu extends StatefulWidget {
  @override
  _MenuState createState() => _MenuState();
}
class _MenuState extends State<Menu> {
  // Properties & Variables needed
  int currentTab = 0; // to keep track of active tab index
  final List<Widget> screens = [
    Shop(),
    Transport_Shop(),
    MenuScan(),
    Setting(),
  ]; // to store nested tabs
  final PageStorageBucket bucket = PageStorageBucket();
  Widget currentScreen = Shop(); // Our first view in viewport

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
        child: Icon(Icons.person,color: Color.fromARGB(255, 255, 255, 255)),
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
                            Shop(); // if user taps on this dashboard tab will be active
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
                            color: currentTab == 2 ? Color.fromARGB(255, 0, 0, 0) : Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
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
                            Transport_Shop(); // if user taps on this dashboard tab will be active
                        currentTab = 1;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          //Icons.shopping_cart_outlined,
                          Icons.directions_car_filled,
                          color: currentTab == 1 ? Color.fromARGB(255, 0, 0, 0) : Colors.grey,
                        ),
                        Text(
                          'Transport',
                          style: TextStyle(
                            color: currentTab == 1 ? Color.fromARGB(255, 0, 0, 0) : Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  )
                 ,
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