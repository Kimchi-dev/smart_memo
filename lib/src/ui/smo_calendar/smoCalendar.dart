import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:smart_memo/src/vo/memodetail.dart';
import 'package:hexcolor/hexcolor.dart';

class SmartMemoCalendar extends StatefulWidget {
  @override
  _SmartMemoCalendarState createState() => _SmartMemoCalendarState();
}

class _SmartMemoCalendarState extends State<SmartMemoCalendar> {
  List<Memo> memoList = List<Memo>();
  // ignore: non_constant_identifier_names
  int CALENDARWEIGHT = 35;
  // 7 * 5

  void forMemo() {
    memoList = [];
    for (int i = 0; i < CALENDARWEIGHT; i++) {
      Memo preMemo = new Memo('', '', DateTime.now(), DateTime.now(),
          TimeOfDay.now(), TimeOfDay.now(), '');
      preMemo.detailMemoSet = '$i';
      preMemo.memoSet = '메모($i)';
      memoList.add(preMemo);
    }
  }

  Widget smoCalendarMaker() {
    print('in smoCalendarMaker() ');
    forMemo();
    int a = memoList.length;
    print('memoList.length => $a');
    var dayList = ['일', '월', '화', '수', '목', '금', '토'];
    return Center(
      child: Column(
        children: <Widget>[
          Container(
            height: 30,
            child: Row(
              children: <Widget>[
                for (int i = 0; i < dayList.length; i++)
                  Container(
                    width: MediaQuery.of(context).size.width / 7,
                    child: Text(
                      dayList[i],
                      textAlign: TextAlign.center,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                  ),
              ],
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.44,
            //only size check
            color: Colors.lightBlueAccent,
            child: GridView.count(
              crossAxisCount: 7,
              children: <Widget>[
                for (Memo miniMemo in memoList)
                  InkWell(
                    child: Container(
                      margin: EdgeInsets.all(5.0),
                      width: MediaQuery.of(context).size.width / 7,
                      child: Center(
                        child: Text(
                          '${miniMemo.detailMemo}',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Colors.black54),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12.0),
                          //color: HexColor('#d5bff3')
                        color: Colors.white
                        ),
                    ),
                    onTap: () {
                      _popupDialog(context);
                    },
                  )
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _popupDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10.0))),
            backgroundColor: Colors.blue[400],
            title: Text(
              'Today\s Schedule',
              style: Theme.of(context).textTheme.headline5,
            ),
            content: Builder(
              builder: (context) {
                // Get available height and width of the build area of this widget. Make a choice depending on the size.
                var height = MediaQuery.of(context).size.height;
                var width = MediaQuery.of(context).size.width;

                return Container(
                  height: height - 500,
                  width: width - 350,
                  child: SingleChildScrollView(
                    child: ListBody(
                      children: <Widget>[
                        new Padding(padding: const EdgeInsets.only(top: 15.0)),

                        //Padding(padding: EdgeInsets.only(top: 20.0)),
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: Text(
                            'Call Mom at 5:00 pm',
                            style: Theme.of(context).textTheme.headline6,
                          ),
                        ),
                        // ignore: todo
                        //TODO Only Text will be recieved from server so only one style is enough
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: Text(
                            'Exam Preparation at 2:00 pm',
                            style: Theme.of(context).textTheme.headline6,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: Text(
                            'Visit Doctor at 9:00 am',
                            style: Theme.of(context).textTheme.headline6,
                          ),
                        ),
                      ],
                    ),
                    //padding: EdgeInsets.only(top: 20.0),
                  ),
                );
              },
            ),
            actions: <Widget>[
              DialogButton(
                child: Text(
                  "삭제",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
                onPressed: () => Navigator.pop(context),
                color: Color.fromRGBO(91, 55, 185, 1.0),
                radius: BorderRadius.circular(10.0),
              ),
              DialogButton(
                child: Text(
                  "추가",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
                onPressed: () => Navigator.pop(context),
                color: Color.fromRGBO(91, 55, 185, 1.0),
                radius: BorderRadius.circular(10.0),
              )
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return smoCalendarMaker();
  }
}
