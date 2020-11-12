import 'package:flutter/material.dart';

import 'package:smart_memo/src/ui/bottomNavBar/bottomNavHome.dart';
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

class Smart_memo_home extends StatefulWidget {
  Smart_memo_home({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _Smart_memo_homeState createState() => _Smart_memo_homeState();
}

class _Smart_memo_homeState extends State<Smart_memo_home> {
  int _currentIndex = 0;
  final tabs = [
    Center(
      child: BottomNavHome(),
    ),
    Center(
      child: Text('2'),
    ),
    Center(
      child: Text('3'),
    ),
    Center(
      child: Text('4'),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavDrawer(),
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
        centerTitle: true,
        title: Text(
          '웅덩이',
          style: TextStyle(
          color: Colors.black,
            fontWeight: FontWeight.w700
        ),
        ),
        backgroundColor: Colors.white,
      ),
      body: tabs[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.grey,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white.withOpacity(.60),
        currentIndex: _currentIndex,
        unselectedFontSize: 14,
        selectedFontSize: 14,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
              title: Text('홈',
              style: TextStyle(
                fontWeight: FontWeight.bold
              ),
              ),
              backgroundColor: Colors.lightBlueAccent,
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.event_note),
              title: Text('작성',
                style: TextStyle(
                    fontWeight: FontWeight.bold
                ),),
              backgroundColor: Colors.lightBlue),
          BottomNavigationBarItem(
              icon: Icon(Icons.people),
              title: Text('다른 모임',
                style: TextStyle(
                    fontWeight: FontWeight.bold
                ),),
              backgroundColor: Colors.blue),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              title: Text('설정',
                style: TextStyle(
                    fontWeight: FontWeight.bold
                ),),
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
