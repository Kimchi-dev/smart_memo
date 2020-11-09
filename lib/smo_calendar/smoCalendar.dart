import 'package:flutter/material.dart';
import 'package:smart_memo/vo/memodetail.dart';
class SmartMemoCalendar extends StatefulWidget {
  @override
  _SmartMemoCalendarState createState() => _SmartMemoCalendarState();
}

class _SmartMemoCalendarState extends State<SmartMemoCalendar> {

  List<Memo> memoList = List<Memo>();
  int CALENDARWEIGHT = 35; // 7 * 5
  Memo preMemo = new Memo('','',DateTime.now(),DateTime.now(),TimeOfDay.now(),TimeOfDay.now());

  void forMemo(){
    for(int i = 0; i < CALENDARWEIGHT; i++){
      preMemo.detailMemoSet = '_$i d';
      preMemo.memoSet = '메모($i)';
      memoList.add(preMemo);
    }

  }
  Widget smoCalendarMaker(){
    print('in smoCalendarMaker() ');
    forMemo();
    return Container(
        child: GridView.count(
          crossAxisCount: 7,

          children: <Widget>[
            for(Memo miniMemo in memoList) Column(
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Container(
                  width: 30,
                  height: 12,
                  child: Text(
                      '${miniMemo.detailMemo}'
                  ),
                ),
                Container(
                  width: 30,
                  height: 12,
                  child: Text(
                      '${miniMemo.memo}'
                  ),
                ),
              ],
            )
          ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return smoCalendarMaker();
  }

}
