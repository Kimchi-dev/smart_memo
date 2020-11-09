import 'package:flutter/material.dart';
import 'dart:async';

import 'bottomNavBar/bottomNavHome.dart';

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
      appBar: AppBar(
        centerTitle: true,
        leading: InkWell(
          child: Icon(Icons.menu,color: Colors.black,
          ),
          onTap: (){
            print('menu');
          },
        ),
        title: Text(
          '철저한 가족',
          style: TextStyle(
          color: Colors.black,
            fontWeight: FontWeight.w700
        ),
        ),
        backgroundColor: Colors.white,
      ),
      body: tabs[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        iconSize: 40,
        selectedFontSize: 15,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
              title: Text('홈'),
              backgroundColor: Colors.lightBlueAccent,
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.event_note),
              title: Text('작성'),
              backgroundColor: Colors.lightBlue),
          BottomNavigationBarItem(
              icon: Icon(Icons.people),
              title: Text('다른 모임'),
              backgroundColor: Colors.blue),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              title: Text('설정'),
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
