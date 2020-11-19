import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
class MissionPackAlert extends StatefulWidget {
  @override
  _MissionPackAlertState createState() => _MissionPackAlertState();
}

class _MissionPackAlertState extends State<MissionPackAlert> {

  List<String> contentList = [
    '브랜치 생성 을하는데 그것은 꼬미가 귀여운 문제이다',
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
        child: Text(
          '깃 브랜치 작업',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
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
                  GestureDetector(
                    onTap: (){

                      setState(() {
                        _selectOrUnselectList[i] = !_selectOrUnselectList[i] ? true : false;
                        for(int j = 0;j < _selectOrUnselectList.length;j++){
                          if(j != i){
                            _selectOrUnselectList[j] = false;
                          }
                        }
                      });
                    },
                    child: AnimatedContainer(
                      height: _selectOrUnselectList[i] ? height * 0.3 : 30.0,
                      width: double.infinity,
                      duration: Duration(milliseconds: 400),
                      padding: EdgeInsets.symmetric(horizontal: 8.0),
                      child: Row(
                        children: <Widget>[
                          Icon(Icons.done,
                            color: Colors.green,
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 8.0),
                            width: width * 0.6,
                            height: _selectOrUnselectList[i] ? height * 0.28 : 30.0,
                            child: Text(contentList[i],
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                      margin: EdgeInsets.all(10.0),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(16.0),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 5,
                              blurRadius: 7,
                              offset: Offset(0,2),
                            )
                          ]
                      ),

                    ),
                  ),
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
