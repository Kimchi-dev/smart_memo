import 'package:flutter/material.dart';
import 'package:smart_memo/src/vo/MemoDetail.dart';
import 'package:smart_memo/src/Util/fn_util/CustomFormatter.dart';

class DetailWrite extends StatefulWidget {
  final String mainTitle;
  DetailWrite({Key key,@required this.mainTitle}) : super(key : key);

  @override
  _DetailWriteState createState() => _DetailWriteState();
}
class _DetailWriteState extends State<DetailWrite> {

  DateTime _selectedDate;
  String _selectedTime;
  Memo _addMemoData;

  
  
  @override
  Widget build(BuildContext context) {
    return  Column(
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
                Container( 
                  margin: EdgeInsets.symmetric(horizontal: 8.0),
                  child: Center(
                    child: Text(
                      _selectedDate == null
                          ? '날짜를 선택해주세요.'
                          : CustomFormatter.dateToKrString(
                          _selectedDate),
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 20,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  height: 40,
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 8.0),
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
                  height: 40,
                ),
              ],
            ),
            Column(
              children: <Widget>[
                Container(
                  width: 60.0,
                  child: RaisedButton(
                    onPressed: () {
                      Future<DateTime> selectedDate =
                      showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(2020),
                        lastDate: DateTime(2030),
                        builder: (BuildContext context,
                            Widget child) {
                          return Theme(
                            data: ThemeData.light(),
                            child: child,
                          );
                        },
                      );
                      selectedDate.then((dateTime) {
                          if (dateTime == null) {
                            setState(() {
                            _selectedTime = null;
                            });
                          }else{
                            setState(() {
                          _selectedDate = dateTime;
                            });
                          // _addMemoData.startDate = _selectedDate;
                          }
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
                        BorderRadius.circular(8.0)),
                    color: Colors.grey,
                  ),
                  height: 40,
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  width: 60.0,
                  child: RaisedButton(
                    onPressed: () {
                      if (_selectedDate != null) {
                        Future<TimeOfDay> selectedTime =
                        showTimePicker(
                            context: context,
                            initialTime: TimeOfDay.now());
                        selectedTime.then((timeOfDay) {
                          print('choice a time');
                          if (timeOfDay != null) {
                            setState(() {
                              _selectedTime =
                              '${timeOfDay.hour}시 ${timeOfDay.minute}분';
                              //_addMemoData.startTime = timeOfDay;
                            });
                          } else {
                            setState(() {
                              _selectedTime = null;
                            });
                          }
                        });
                      } else {
                        showDialog(
                            context: context,
                            barrierDismissible: false,
                            builder: (BuildContext context) {
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
                                    onPressed: () {
                                      Navigator.of(context)
                                          .pop();
                                    },
                                  )
                                ],
                              );
                            });
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
                  height: 40,
                ),
                Container(
                  child: SizedBox(
                    height: 5,
                  ),
                ),
              ],
            ),
          ],
        ),
        Column(
          children: <Widget>[
            Container(
                child:Column(
                  children: <Widget>[
                    Container(
                      width: double.infinity,
                      child: RichText(
                        textAlign: TextAlign.left,
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: '*바로등록',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                                color: Colors.blue,
                              ),
                            ),
                            TextSpan(
                              text: ' : 제목 ',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      child: RichText(
                        textAlign: TextAlign.left,
                        text: TextSpan(
                          children: [
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
                                  color: Colors.black),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      child: RichText(
                        textAlign: TextAlign.left,
                        text: TextSpan(
                          children: [
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
                                  color: Colors.black),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      child: RaisedButton.icon(
                        onPressed: () {

                        },
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(15.0))),
                        label: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 70.0),
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
                        splashColor: Colors.deepOrange,
                        color: Colors.red,
                      ),
                    ),
                  ],
                )
            ),
          ],
        )
      ],
    );
  }
}
