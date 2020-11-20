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
    '브랜치 생성',
    '코드 수정',
    '수정된파일 커밋',
    '스테이지 푸시',
    '풀리퀘스트',
    '머지'
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
              '깃 브랜치 작업',
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
                  value: 0.4622,
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
          return Container(
            height: height * 0.5,
            child: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  for(int i = 0;i < contentList.length;i++)
                      MissionPackMission(contentList[i]),
                ],
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
