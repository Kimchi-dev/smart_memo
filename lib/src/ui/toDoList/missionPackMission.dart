import 'package:flutter/material.dart';
import 'package:smart_memo/src/ui/toDoList/missionDetail.dart';

class MissionPackMission extends StatefulWidget {
  final String content;
  const MissionPackMission(this.content);
  @override
  _MissionPackMissionState createState() => _MissionPackMissionState();
}

class _MissionPackMissionState extends State<MissionPackMission> {

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;

    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(
          builder: (context) => MissionDetail()
        ),
        );
      },
      child: Container(
        height:  30.0,
        padding: EdgeInsets.symmetric(horizontal: 8.0),
        child: Row(
          children: <Widget>[
            IconButton(
              onPressed: (){

              },
              padding: EdgeInsets.zero,
              icon: Icon(Icons.check
              ),
              color: Colors.grey,
            ),
            Container (
              padding: EdgeInsets.symmetric(horizontal: 8.0,vertical: 4.0),
              width: width * 0.5,
              height: 30.0,
              child: Text(
                widget.content,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
                overflow: TextOverflow.ellipsis,
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
    );
  }
}
