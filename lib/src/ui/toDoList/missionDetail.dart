
import 'package:flutter/material.dart';

class MissionDetail extends StatefulWidget {
  @override
  _MissionDetailState createState() => _MissionDetailState();
}

class _MissionDetailState extends State<MissionDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('미션 정보',
        style: TextStyle(
          fontSize: 20.0,
          fontWeight: FontWeight.bold,
        ),
        ),
        centerTitle: true,
      ),
      body: Container(
        child: RefreshIndicator(
          onRefresh: () async{
            await Future.delayed(Duration(seconds: 1)).then((onvalue) {

              setState(() {
                print('a');
              });
            });
          },
          child: ListView(
            children: <Widget>[
              ListTile(
                leading: Icon(Icons.radio_button_unchecked),
                title: Text('dd'),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: RaisedButton(
        onPressed: (){
          Navigator.pop(context);
        },
        child: Text('dd'),
      ),
    );
  }
}
