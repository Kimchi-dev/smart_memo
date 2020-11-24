import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:smart_memo/src/ui/toDoList/missionPackMission.dart';
class MissionPackAlert extends StatefulWidget {
  @override
  _MissionPackAlertState createState() => _MissionPackAlertState();
}

class _MissionPackAlertState extends State<MissionPackAlert> {

  List<String> contentList = [
    '꼬미랑 아침산책',
    '설거지',
    '세탁기 돌리고 건조기 물비우기',
    '바닥청소 물걸레까지',
    '융정가와 고스톱치기',
    '잘준비'
  ];
  List<bool> _selectOrUnselectList = [false,false,false,false,false,false];

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      insetPadding: EdgeInsets.symmetric(horizontal: 10.0),
      shape: RoundedRectangleBorder(
          borderRadius:
          BorderRadius.all(Radius.circular(10.0))),
      backgroundColor: Colors.white,

      title: Container(
        padding: EdgeInsets.symmetric(
            horizontal: 16.0, vertical: 5),
        child: Column(
          children: <Widget>[
            Text(
              '융정가와 미션 (4 / 6)',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 5),
              width: 300,
              height: 20,
              child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                child: LinearProgressIndicator(
                  value: 4 / 6,
                  backgroundColor: Colors.grey,
                ),
              ),
            ),
          ],
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.0),
          color: HexColor('#c9dcf5'),
        ),
      ),
      content: Builder(
        builder: (context) {
          // Get available height and width of the build area of this widget. Make a choice depending on the size.
          var height = MediaQuery.of(context).size.height;
          var width = MediaQuery.of(context).size.width;
          var _selectedContainerHeight = 0.0;
          return RefreshIndicator(
            onRefresh: () async{
              await Future.delayed(Duration(seconds: 1)).then((onvalue) {

                setState(() {
                  print('a');
                });
              });
            },
            child: Container(
              height: height * 0.5,
              child: SingleChildScrollView(
                physics: AlwaysScrollableScrollPhysics(
                  parent: BouncingScrollPhysics(),
                ),
                child: ListBody(
                  children: <Widget>[
                    for(int i = 0;i < contentList.length;i++)
                        MissionPackMission(contentList[i]),
                  ],
                ),
              ),
            ),
          );
        },
      ),
      actions: <Widget>[

        DialogButton(
          child: Text(
            "확인",
            style: TextStyle(
                color: Colors.white, fontSize: 20),
          ),
          onPressed: () => Navigator.pop(context),
          color: Colors.blueAccent,
          radius: BorderRadius.circular(10.0),
        ),
      ],
    );;
  }
}
