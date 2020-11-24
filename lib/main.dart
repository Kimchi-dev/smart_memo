import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

import 'package:smart_memo/src/ui/bottomNavBar/bottomNavHome.dart';
import 'package:smart_memo/src/ui/bottomNavBar/bottomNavSetting.dart';
import 'package:smart_memo/src/ui/bottomNavBar/bottomNavTodoList.dart';
import 'package:smart_memo/src/ui/leftSideMenu/leftSideMenu.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'flutter Demo',
          theme: ThemeData(
          primarySwatch: Colors.blue,
          ),
      debugShowCheckedModeBanner: false,
      home: Smart_memo_home(),
    );
  }
}

// ignore: camel_case_types
class Smart_memo_home extends StatefulWidget {
  Smart_memo_home({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _Smart_memo_homeState createState() => _Smart_memo_homeState();
}

// ignore: camel_case_types
class _Smart_memo_homeState extends State<Smart_memo_home> {
  int _currentIndex = 0;
  final tabs = [
    Center(
      child: BottomNavHome(),
    ),
    Center(
      child: BottomNavTodoList(),
    ),
    Center(
      child: Text('3'),
    ),
    Center(
      child: BottomNavSetting(),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavDrawer(),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(40.0),
        child: AppBar(
          centerTitle: true,
          title: Text(
            '',
            style: TextStyle( fontWeight: FontWeight.w700),
          ),
          backgroundColor: HexColor("#af40e8"),
        ),
      ),
      body: tabs[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.grey,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white.withOpacity(.60),
        currentIndex: _currentIndex,
        unselectedFontSize: 0,
        selectedFontSize: 0,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today),
            title: Text(
              '홈',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            backgroundColor: Colors.lightBlueAccent,
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.event_note),
              title: Text(
                '목록',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              backgroundColor: Colors.lightBlue),
          BottomNavigationBarItem(
              icon: Icon(Icons.done_outline),
              title: Text(
                '완료',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              backgroundColor: Colors.blue),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              title: Text(
                '설정',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              backgroundColor: Colors.blueAccent),
        ],
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}

class BottomNavigationBarProvider with ChangeNotifier {
  int _currentIndex = 0;

  get currentIndex => _currentIndex;

  set currentIndex(int index) {
    _currentIndex = index;
    notifyListeners();
  }
}
