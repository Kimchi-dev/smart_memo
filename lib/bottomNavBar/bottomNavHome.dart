import 'dart:async';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:smart_memo/smo_calendar/smoCalendar.dart';
import 'package:smart_memo/vo/memodetail.dart';

class BottomNavHome extends StatefulWidget {
  @override
  _BottomNavHomeState createState() => _BottomNavHomeState();
}

class _BottomNavHomeState extends State<BottomNavHome> {
  String _toDoText = "";
  final _addTodoController = TextEditingController();
  final _addFormKey = GlobalKey<FormState>();
  DateTime _selectedDate;
  String _selectedTime;
  DateFormat dateFormat = DateFormat('yy년 MM월 dd일');
  Icon collapseIcon = Icon(Icons.arrow_drop_down);
  String collapseString = "+";
  //상세등록 애니메이션을 위한 위젯 크기
  double _moreFormBoxHeight = 0.0;      // 가로
  double _moreFormBoxWidth = 0.0;       // 세로
  double _moreDateFormBoxWidth = 0.0;   // 날짜값 필드 가로
  double _moreDateButtonBoxWidth = 0.0; //  버튼 가로

  int openDuration = 600;               //애니메이션 duration 초기값

  String addMode = "바로";
  Color addColor = Colors.blue;         //등록 버튼 초기컬러
  bool isDetailMode = false;            //상세등록  모드 확인
  Memo _addMemoData;

  @override
  void dispose() {
    _addTodoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
                    validator: (String value){
                      if(value.isEmpty){
                        return ' 제목 또는 단어를 입력해주세요.';
                      }else{
                        _addMemoData.memo(value);
                        return null;
                      }
                    },
                    controller: _addTodoController,
                  ),
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 600),
                    height: _moreFormBoxHeight,
                    width: _moreFormBoxWidth,
                    child: ListView(
                      children: <Widget>[
                        SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          decoration: InputDecoration(
                              labelText: '상세내용은 선택사항',
                              enabledBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: Colors.green, width: 5.0),
                                  borderRadius: BorderRadius.circular(25.0))),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Column(
                              children: <Widget>[
                                AnimatedContainer(
                                  duration: Duration(milliseconds: openDuration),
                                  child: Center(
                                    child: Text(
                                      _selectedDate == null
                                          ? '날짜를 선택해주세요.'
                                          : dateFormat.format(_selectedDate),
                                      style: TextStyle(
                                        fontWeight: FontWeight.w700,
                                        fontSize: 20,
                                      ),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                  width: _moreDateFormBoxWidth,
                                  height: 40,
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                  AnimatedContainer(
                                    duration: Duration(milliseconds: openDuration),
                                    child: Center(
                                      child: Text(
                                        _selectedTime == null
                                            ? '시간을 선택해주세요.'
                                            : _selectedTime,
                                        style: TextStyle(
                                          fontWeight: FontWeight.w700,
                                          fontSize: 20,
                                        ),
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                  width: _moreDateFormBoxWidth,
                                  height: 40,
                                ),
                              ],
                            ),
                            Column(
                              children: <Widget>[
                                AnimatedContainer(
                                  duration: Duration(milliseconds: openDuration),
                                  child: RaisedButton(
                                    onPressed: (){
                                      Future<DateTime> selectedDate = showDatePicker(
                                          context: context,
                                          initialDate: DateTime.now(),
                                          firstDate: DateTime(2020),
                                          lastDate: DateTime(2030),
                                          builder:(BuildContext context,Widget child){
                                            return Theme(
                                              data: ThemeData.light(),
                                              child: child,
                                            );
                                          },
                                      );
                                      selectedDate.then((dateTime){

                                        setState(() {
                                          if(dateTime == null){
                                          _selectedTime = null;
                                        }
                                          _selectedDate = dateTime;
                                          _addMemoData.startDate(dateTime);
                                        });
                                      });
                                    },
                                    child: Text(
                                      '선택',
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w700,
                                          color: Colors.white),
                                    ),
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(8.0)
                                    ),
                                    color: Colors.grey,
                                  ),
                                  width: _moreDateButtonBoxWidth,
                                  height: 40,
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                AnimatedContainer(
                                  duration: Duration(milliseconds: openDuration),
                                  child: RaisedButton(
                                    onPressed: (){
                                      if(_selectedDate != null){
                                        Future<TimeOfDay> selectedTime = showTimePicker(
                                            context: context,
                                            initialTime: TimeOfDay.now());
                                        selectedTime.then((timeOfDay){
                                          if(timeOfDay != null){
                                            setState(() {
                                              _selectedTime = '${timeOfDay.hour}시 ${timeOfDay.minute}분' ;
                                              _addMemoData.startTimeSet = timeOfDay;
                                            });
                                          }else{
                                            setState(() {
                                              _selectedTime = null;
                                            });
                                          }
                                        });
                                      }else{
                                        showDialog(
                                          context: context,
                                          barrierDismissible: false,
                                          builder: (BuildContext context){
                                             return AlertDialog(
                                               title: Text('날짜를 선택해주세요.'),
                                               content: SingleChildScrollView(
                                                 child: ListBody(
                                                   children: <Widget>[
                                                     Text('시간을 선택 하려면, 먼저'),
                                                     Text('날짜를 선택 해주세요.'),
                                                   ],
                                                 ),
                                               ),
                                               actions: <Widget>[
                                                 FlatButton(
                                                   child: Text('Ok'),
                                                   onPressed: (){
                                                     Navigator.of(context).pop();
                                                   },
                                                 )
                                               ],
                                             );
                                          }
                                        );
                                      }
                                    },
                                    child: Text(
                                      '선택',
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w700,
                                          color: Colors.white),
                                    ),
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(8.0),
                                        ),
                                    color: Colors.grey,
                                  ),
                                  width: _moreDateButtonBoxWidth,
                                  height: 40,
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Center(
                          child: Column(
                            children: <Widget>[
                              Text.rich(
                                  TextSpan(
                                    children: <TextSpan>[
                                      TextSpan(
                                        text: '*바로등록',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15,
                                          color: Colors.blue,
                                        ),
                                      ),
                                      TextSpan(
                                        text: '은 제목만 입력이 가능 하지만 , ',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15,
                                        ),
                                      ),
                                    ],
                                  )
                              ),
                              Text.rich(
                                  TextSpan(
                                    children: <TextSpan>[
                                      TextSpan(
                                        text: '*간단등록',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15,
                                          color: Colors.green,
                                        ),
                                      ),
                                      TextSpan(
                                        text: '은 최소 날짜를 선택해야합니다.',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15,
                                        ),
                                      ),
                                    ],
                                  )
                              ),
                              Text.rich(
                                  TextSpan(
                                    children: <TextSpan>[
                                      TextSpan(
                                        text: '*상세등록',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15,
                                          color: Colors.red,
                                        ),
                                      ),
                                      TextSpan(
                                        text: ' 선택 시 일정 마감일 선택가능',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15,
                                        ),
                                      ),
                                    ],
                                  )
                              ),
                              Container(
                                width: _moreDateButtonBoxWidth+_moreDateFormBoxWidth+20,
                                child: RaisedButton.icon(
                                  onPressed: () {
                                  },
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                      BorderRadius.all(Radius.circular(15.0))),
                                  label: Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                                    child: Text(
                                      '상세등록',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w700,
                                        fontSize: 20,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                  icon: Icon(
                                    Icons.playlist_add_check,
                                    color: Colors.white,
                                  ),
                                  textColor: Colors.white,
                                  splashColor: Colors.red,
                                  color: Colors.red,
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  )
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
                              if(_moreFormBoxHeight != 0.0){
                                //영역축소
                                print('영역 축소');
                                isDetailMode = false;
                                addMode = "바로";
                                addColor = Colors.blue;
                                collapseIcon = Icon(Icons.arrow_drop_down);
                                collapseString = "+";
                                openDuration = 400;
                                _moreDateFormBoxWidth != 0.0
                                    ? _moreDateFormBoxWidth = 0.0
                                    : _moreDateFormBoxWidth = 200;
                                _moreDateButtonBoxWidth != 0.0
                                    ? _moreDateButtonBoxWidth = 0.0
                                    : _moreDateButtonBoxWidth = 60;
                                _moreFormBoxHeight != 0.0
                                    ? _moreFormBoxHeight = 0.0
                                    : _moreFormBoxHeight = 300.0;
                                _moreFormBoxWidth != 0.0
                                    ? _moreFormBoxWidth = 0.0
                                    : _moreFormBoxWidth =
                                    MediaQuery.of(context).size.width;
                              }else if(_moreFormBoxHeight == 0.0){
                                //영역 확장
                                print('영역 확장');
                                isDetailMode = true;
                                addMode = "간단";
                                addColor = Colors.green;
                                collapseIcon = Icon(Icons.arrow_drop_up);
                                collapseString = "-";
                                openDuration = 600;
                                _moreFormBoxWidth != 0.0
                                    ? _moreFormBoxWidth = 0.0
                                    : _moreFormBoxWidth =
                                    MediaQuery.of(context).size.width;
                                _moreFormBoxHeight != 0.0
                                    ? _moreFormBoxHeight = 0.0
                                    : _moreFormBoxHeight = 300.0;
                                _moreDateFormBoxWidth != 0.0
                                      ? _moreDateFormBoxWidth = 0.0
                                      : _moreDateFormBoxWidth = 200;
                                _moreDateButtonBoxWidth != 0.0
                                      ? _moreDateButtonBoxWidth = 0.0
                                      : _moreDateButtonBoxWidth = 60;
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
                        child: Center(
                          child: RaisedButton.icon(
                            onPressed: () {
                              if(!isDetailMode){
                                //바로등록 모드
                                print('바로등록');
                                if(!_addFormKey.currentState.validate()){
                                  return;
                                }
                                _addFormKey.currentState.save();
                              }else if(isDetailMode){
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
                            label: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 20.0),
                              child: Text(
                                '${addMode}등록',
                                style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 20,
                                  color: Colors.white,
                                ),
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
