import 'dart:async';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:smart_memo/src/Util/fn_util/customFormatter.dart';
import 'package:smart_memo/src/ui/toDoList/missionPackAlert.dart';
import 'package:smart_memo/src/vo/memodetail.dart';
import 'package:smart_memo/src/Util/widget_util/CustomWidgetMaker.dart';

class BottomNavTodoList extends StatefulWidget {
  BottomNavTodoList({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _BottomNavTodoListState createState() => _BottomNavTodoListState();
}

class _BottomNavTodoListState extends State<BottomNavTodoList> {
  List<Memo> memoList = [];
  List<Widget> widgetList = [];
  var _booltf = false;

  void initMemoList() {
    memoList = [];
    memoList.add(new Memo('김장', '배추4포기 사서 소금에 절여서 대야에 놓기', DateTime.now(),
        DateTime.now(), TimeOfDay.now(), TimeOfDay.now(), 'todo001'));
    memoList.add(new Memo('테이프', '책상용 박스테이프 구매하기', DateTime.now(),
        DateTime.now(), TimeOfDay.now(), TimeOfDay.now(), 'todo001'));
    memoList.add(new Memo('빨래', '건조기까지 돌리고 물버리고 먼지비우기', DateTime.now(),
        DateTime.now(), TimeOfDay.now(), TimeOfDay.now(), 'todo002'));
    memoList.add(new Memo('자석', '달력걸이 자석 구매', DateTime.now(), DateTime.now(),
        TimeOfDay.now(), TimeOfDay.now(), 'todo001'));
    memoList.add(new Memo('신문지', '40장물에 담가두기 (장난감용도)', DateTime.now(),
        DateTime.now(), TimeOfDay.now(), TimeOfDay.now(), 'todo002'));
    memoList.add(new Memo('설거지', '7시에손님용 접시 사용예정이라 설거지후 플레이팅준비', DateTime.now(),
        DateTime.now(), TimeOfDay.now(), TimeOfDay.now(), 'todo002'));
  }

  @override
  void initState() {
    initMemoList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        Completer<Null> completer = new Completer<Null>();
        await Future.delayed(Duration(seconds: 1)).then((onvalue) {
          initMemoList();
          print('memoList.length : ${memoList.length}');

          completer.complete();
          setState(() {
            widgetList = CustomWidgetMaker.memoListToWidget(memoList, context);
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
                  onPressed: () {
                    setState(() {
                      widgetList = CustomWidgetMaker.onlyTypeList(
                          memoList, context, 'todo001');
                      print('widgetList.length = ${widgetList.length}');
                      print('in setState');
                    });
                  },
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
                  onPressed: () {
                    setState(() {
                      widgetList = CustomWidgetMaker.onlyTypeList(
                          memoList, context, 'todo002');
                      print('widgetList.length = ${widgetList.length}');
                      print('in setState');
                    });
                  },
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
            ),
          Container(
            child: Column(
              children: <Widget>[
                InkWell(
                  onTap: () {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return MissionPackAlert();
                        });
                  },
                  child: Column(
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: Column(
                              children: <Widget>[
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.59,
                                  padding: EdgeInsets.only(left: 16.0),
                                  child: Text(
                                    'Git branch process',
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                    ),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.5,
                                  padding: EdgeInsets.only(left: 20.0),
                                  child: Text(
                                    '5단계의 미션팩입니다.',
                                    textAlign: TextAlign.left,
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 1,
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Column(
                            children: <Widget>[
                              CustomWidgetMaker.getBuyOrTodo('todo003'),
                              Container(
                                child: Text(
                                  CustomFormatter.dateToHyphenString(
                                      new DateTime(2020, 11, 21)),
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                      fontSize: 14, color: Colors.grey),
                                ),
                              ),
                            ],
                          ),
                          Container(
                            width: 70,
                            decoration: BoxDecoration(
                              color: Colors.blue,
                              borderRadius: BorderRadius.circular(16.0),
                            ),
                            child: FlatButton(
                              child: Text(
                                '처리',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                    color: Colors.white),
                              ),
                              onPressed: () {},
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16.0, vertical: 4),
                  child: Divider(
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
