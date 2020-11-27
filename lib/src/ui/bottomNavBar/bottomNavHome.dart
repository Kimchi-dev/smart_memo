import 'package:flutter/material.dart';
import 'package:smart_memo/src/Util/widget_util/DetailWrite.dart';
import 'package:smart_memo/src/ui/smo_calendar/smoCalendar.dart';
import 'package:smart_memo/src/vo/MemoDetail.dart';

class BottomNavHome extends StatefulWidget {
  @override
  _BottomNavHomeState createState() => _BottomNavHomeState();
}

class _BottomNavHomeState extends State<BottomNavHome> {
  String _toDoText = "";
  final _addTodoController = TextEditingController();
  final _addFormKey = GlobalKey<FormState>();
  Icon collapseIcon = Icon(Icons.arrow_drop_down);
  String collapseString = "+";
  String mainTitle;
  //상세등록 애니메이션을 위한 위젯 크기
  double _moreFormBoxHeight = 0.0; // 가로
  double _moreFormBoxWidth = 300.0; // 세로

  int openDuration = 600; //애니메이션 duration 초기값

  String addMode = "바로";
  Color addColor = Colors.blue; //등록 버튼 초기컬러
  bool isDetailMode = false; //상세등록  모드 확인
  Memo _addMemoData;
  bool _selected = false;


  @override
  void dispose() {
    _addTodoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Container(
      child: Form(
        child: ListView(
          children: <Widget>[
            Padding(
              padding:
              const EdgeInsets.only(top: 15.0, left: 20.0, right: 20.0),
              child: Column(
                children: <Widget>[
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: '메모',
                      fillColor: Colors.blue,
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25.0),
                          borderSide: const BorderSide(
                              color: Colors.green, width: 3.0)),
                      errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25.0),
                          borderSide:
                          const BorderSide(color: Colors.red, width: 3.0)),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25.0),
                          borderSide:
                          const BorderSide(color: Colors.blue, width: 5.0)),
                    ),
                    validator: (String value) {
                      if (value.isEmpty) {
                        return ' 제목 또는 단어를 입력해주세요.';
                      } else {
                        //_addMemoData.memo(value);
                        return null;
                      }
                    },
                    controller: _addTodoController,
                  ),
                  AnimatedContainer(
                    alignment: _selected ? Alignment.center : AlignmentDirectional.topCenter,
                    duration: Duration(milliseconds: 700),
                    curve: Curves.fastOutSlowIn,
                    height: _moreFormBoxHeight,
                    width: _moreFormBoxWidth,
                    child: SingleChildScrollView(
                      child: DetailWrite(mainTitle: mainTitle,),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding:
              const EdgeInsets.symmetric(vertical: 10.0, horizontal: 30.0),
              child: Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 8.0),
                        child: RaisedButton.icon(
                          onPressed: () {
                            setState(() {
                              if (_moreFormBoxHeight != 0.0) {
                                //영역축소
                                print('영역 축소');
                                isDetailMode = false;
                                addMode = "바로";
                                addColor = Colors.blue;
                                collapseIcon = Icon(Icons.arrow_drop_down);
                                collapseString = "+";

                                _moreFormBoxHeight != 0.0
                                    ? _moreFormBoxHeight = 0.0
                                    : _moreFormBoxHeight = 300.0;
                                    setState(() {
                                      _selected = !_selected;
                                    });
                              } else if (_moreFormBoxHeight == 0.0) {
                                //영역 확장
                                print('영역 확장');
                                isDetailMode = true;
                                addMode = "간단";
                                addColor = Colors.green;
                                collapseIcon = Icon(Icons.arrow_drop_up);
                                collapseString = "-";
                                _moreFormBoxHeight != 0.0
                                    ? _moreFormBoxHeight = 0.0
                                    : _moreFormBoxHeight = 300.0;
                                    setState(() {
                                      _selected = !_selected;
                                    });

                              }
                            });
                          },
                          shape: RoundedRectangleBorder(
                              borderRadius:
                              BorderRadius.all(Radius.circular(15.0))),
                          label: Text(
                            collapseString,
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 20,
                              color: Colors.white,
                            ),
                          ),
                          icon: collapseIcon,
                          textColor: Colors.white,
                          splashColor: Colors.blueAccent,
                          color: Colors.grey,
                          key: Key('addTodoButtons'),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 8.0),
                        child: RaisedButton.icon(
                          padding: EdgeInsets.symmetric(horizontal: 16.0),
                          onPressed: () {
                            if (!isDetailMode) {
                              //바로등록 모드
                              print('바로등록');
                              if (!_addFormKey.currentState.validate()) {
                                return;
                              }
                              _addFormKey.currentState.save();
                            } else if (isDetailMode) {
                              //상세등록 모드
                              print('간단등록');
                            }
                            setState(() {
                              _toDoText = _addTodoController.text.toString();
                              print(_toDoText);
                            });
                          },
                          shape: RoundedRectangleBorder(
                              borderRadius:
                              BorderRadius.all(Radius.circular(15.0))),
                          label: Text(
                            '$addMode등록',
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 20,
                              color: Colors.white,
                            ),
                          ),
                          icon: Icon(
                            Icons.library_add,
                            color: Colors.white,
                          ),
                          textColor: Colors.white,
                          splashColor: Colors.lightGreen,
                          color: addColor,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SmartMemoCalendar(),
          ],
        ),
      ),
    );
  }

}
