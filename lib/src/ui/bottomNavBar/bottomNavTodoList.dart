import 'dart:async';

import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:smart_memo/src/vo/memodetail.dart';

class BottomNavTodoList extends StatefulWidget {
  @override
  _BottomNavTodoListState createState() => _BottomNavTodoListState();
}

class _BottomNavTodoListState extends State<BottomNavTodoList> {
  List<Memo> memoList = [];
  List<Widget> widgetList = [];

  void initMemoList() {
    memoList.add(new Memo('김장', '배추4포기', DateTime.now(), DateTime.now(),
        TimeOfDay.now(), TimeOfDay.now()));
    memoList.add(new Memo('테이프', '책상용', DateTime.now(), DateTime.now(),
        TimeOfDay.now(), TimeOfDay.now()));
    memoList.add(new Memo('자석', '', DateTime.now(), DateTime.now(),
        TimeOfDay.now(), TimeOfDay.now()));
    memoList.add(new Memo('신문지', '40장', DateTime.now(), DateTime.now(),
        TimeOfDay.now(), TimeOfDay.now()));
    memoList.add(new Memo('빨래', '건조기까지', DateTime.now(), DateTime.now(),
        TimeOfDay.now(), TimeOfDay.now()));
    memoList.add(new Memo('설거지', '7시에손님', DateTime.now(), DateTime.now(),
        TimeOfDay.now(), TimeOfDay.now()));
  }

  Color _buttonPressColor = Colors.blueAccent;

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        Completer<Null> completer = new Completer<Null>();
        await Future.delayed(Duration(seconds: 3)).then((onvalue) {
          completer.complete();
          setState(() {
            widgetList = [];

            for (Memo memo in memoList)
              widgetList.add(Column(
                children: <Widget>[
                  Container(
                    child: Text('${memo.memo}'),
                  ),
                  Divider(
                    color: Colors.grey,
                  )
                ],
              ));
          });
          print('widgetList : ${widgetList.length}');
        });
      },
      child: ListView(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                FlatButton(
                  color: Colors.blueAccent,
                  focusColor: Colors.black,
                  splashColor: Colors.transparent,
                  highlightColor: HexColor('#18268a'),
                  onPressed: () {},
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40.0),
                  ),
                  child: Container(
                    height: 200,
                    width: 130,
                    child: Column(
                      children: <Widget>[
                        Text(
                          '사야 해',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          '999',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 70,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          '개 의 살일',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                FlatButton(
                  color: Colors.blueAccent,
                  splashColor: Colors.transparent,
                  highlightColor: HexColor('#18268a'),
                  onPressed: () {},
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40.0),
                  ),
                  child: Container(
                    height: 200,
                    width: 130,
                    child: Column(
                      children: <Widget>[
                        Text(
                          '해야 해',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          '999',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 70,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          '개 의 할일',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          for (Widget miniWidget in widgetList)
            Container(
              child: miniWidget,
            )
        ],
      ),
    );
  }
}
