import 'package:flutter/material.dart';

class BottomNavChangeList extends StatefulWidget {
  @override
  _BottomNavChangeListState createState() => _BottomNavChangeListState();
}

class _BottomNavChangeListState extends State<BottomNavChangeList> {

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    List <Color> colorList = [Colors.green,Colors.yellow,Colors.blueAccent,Colors.red];
    List <String> stringList = ['생성','추가','수정','삭제'];
    return Container(
      child: RefreshIndicator(
        onRefresh: () async {
          await Future.delayed(Duration(seconds: 1)).then((onvalue) {
            setState(() {
              print('a');
            });
          });
        },
        child: Container(
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: ListBody(
              children: [
              ],
            ),
          ),
        ),
      ),
    );
  }
}
