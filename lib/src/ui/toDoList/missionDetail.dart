import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:smart_memo/src/Util/widget_util/ShowImage.dart';

class MissionDetail extends StatefulWidget {
  @override
  _MissionDetailState createState() => _MissionDetailState();
}

class _MissionDetailState extends State<MissionDetail> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(40.0),
          child: AppBar(
            leading: InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Icon(Icons.arrow_back_ios)),
            backgroundColor: HexColor("#af40e8"),
            title: Text(
              '미션 정보',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            centerTitle: true,
          ),
        ),
        body: Container(
          child: RefreshIndicator(
            onRefresh: () async {
              await Future.delayed(Duration(seconds: 1)).then((onvalue) {
                setState(() {
                  print('a');
                });
              });
            },
            child: Container(
              color: Colors.white,
              height: double.infinity,
              child: SingleChildScrollView(
                physics: AlwaysScrollableScrollPhysics(
                  parent: BouncingScrollPhysics(),
                ),
                child: ListBody(
                  children: <Widget>[
                    Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                      margin: EdgeInsets.symmetric(
                          horizontal: 20.0, vertical: 16.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30.0),
                        color: HexColor("#e1e4ea"),
                      ),
                      child: Text(
                        '제목',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                    ),
                    Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                      margin:
                          EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30.0),
                        color: HexColor("#e1e4ea"),
                      ),
                      child: SingleChildScrollView(
                        child: Container(
                          child: Text(
                            '내용 내용 내용 내용 '
                            '내용 내용 내용 내용 내용 내용 내용 '
                            '내용 내용 내용 내용 내용 내용 내용 '
                            '내용 내용 내용 내용 내용 내용 내용 '
                            '내용 내용 내용 내용 내용 내용 내용 ',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16),
                          ),
                        ),
                      ),
                    ),
                    Row(children: <Widget>[
                      Expanded(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16.0),
                            child: Divider(
                              color: Colors.grey,
                            ),
                          )),
                      Text(
                          "해결내용",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Expanded(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16.0),
                            child: Divider(
                              color: Colors.grey,
                            ),
                          )),
                    ]),
                    Container(
                      child: RaisedButton(
                        onPressed: (){
                          Navigator.push(context,MaterialPageRoute(builder: (context) => ShowImage()));
                        },
                        child: Text('Image'),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            Navigator.pop(context);
          },
          backgroundColor: HexColor('#af40e8'),
          icon: Icon(Icons.arrow_back_ios),
          label: Text('목록'),
        ),
      ),
    );
  }
}
