import 'package:flutter/cupertino.dart';
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
  int CALENDARWEIGHT = 35; // 7 * 5

  void forMemo(){
    memoList = [];
    for(int i = 0; i < CALENDARWEIGHT; i++){
      Memo preMemo = new Memo('','',DateTime.now(),DateTime.now(),TimeOfDay.now(),TimeOfDay.now());
      preMemo.detailMemoSet = '$i';
      preMemo.memoSet = '메모($i)';
      memoList.add(preMemo);
    }

  }
  Widget smoCalendarMaker(){
    print('in smoCalendarMaker() ');
    forMemo();
    int a = memoList.length;
    print('memoList.length => $a');
    var dayList = ['일','월','화','수','목','금','토'];
    return Center(
      child: Column(
        children: <Widget>[
          Container(
            height: 30,
            child: Row(
              children: <Widget>[
                for(int i = 0;i < dayList.length;i++)
                Container(
                  width: MediaQuery.of(context).size.width/7,
                  child: Text(
                    dayList[i],
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
              height: 260,
              child: GridView.count(
                crossAxisCount: 7,
                children: <Widget>[
                  for(Memo miniMemo in memoList) InkWell(
                    child: Container(
                      margin: EdgeInsets.all(5.0),
                      width: MediaQuery.of(context).size.width/7,
                      child: Center(
                        child: Text(
                            '${miniMemo.detailMemo}',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Colors.black54
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12.0),
                        color: HexColor('#d5bff3')
                      ),
                    ),
                    onTap: (){

                      var alertStyle = AlertStyle(
                        animationType: AnimationType.fromBottom,
                        isCloseButton: false,
                        isOverlayTapDismiss: false,
                        descStyle: TextStyle(fontWeight: FontWeight.bold),
                        animationDuration: Duration(milliseconds: 240),
                        alertBorder: RoundedRectangleBorder(
                          side: BorderSide(
                            color: Colors.grey,
                          ),
                        ),
                        titleStyle: TextStyle(
                          color: Color.fromRGBO(91, 55, 185, 1.0),
                        ),
                      );

                      Alert(
                        context: context,
                        title: "FilledStacks",
                        desc: "FilledStacks.com has the best Flutter tutorials",
                        buttons: [
                          DialogButton(
                            child: Text(
                              "추가",
                              style: TextStyle(color: Colors.white, fontSize: 20),
                            ),
                            onPressed: () => Navigator.pop(context),
                            color: Color.fromRGBO(91, 55, 185, 1.0),
                            radius: BorderRadius.circular(10.0),
                          ),
                          DialogButton(
                            child: Text(
                              "삭제",
                              style: TextStyle(color: Colors.white, fontSize: 20),
                            ),
                            onPressed: () => Navigator.pop(context),
                            color: Color.fromRGBO(91, 55, 185, 1.0),
                            radius: BorderRadius.circular(10.0),
                          ),
                        ],
                      ).show();
                    },
                  )
                ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return smoCalendarMaker();
  }

}
