import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:smart_memo/src/Util/widget_util/ShowImage.dart';
import 'package:swipe_to/swipe_to.dart';
import 'package:transparent_image/transparent_image.dart';

import 'EditContentAlert.dart';

class MissionDetail extends StatefulWidget {
  @override
  _MissionDetailState createState() => _MissionDetailState();
}

class _MissionDetailState extends State<MissionDetail> {
  final imageList = [
    'https://mblogthumb-phinf.pstatic.net/MjAxODA0MjRfNDkg/MDAxNTI0NTM2NjAwNTQw.IddxA8-dF1o5mTaOwiJqesGQwyEDYYXYiYKmdV-WSMUg.1Rm40HP8qmd2PMAVhm5cyKtlHeifbI2GSnT6FTOncJsg.JPEG.dmm_korea/%ED%92%8D%EA%B2%BD%EC%98%81%EC%96%B4%EB%A1%9C_%EC%97%94%EA%B5%AC%ED%99%94%EC%83%81%EC%98%81%EC%96%B41.jpg?type=w800',
    'https://i.pinimg.com/736x/5f/f3/d7/5ff3d71b5834971c30af475c99f67c02.jpg',
    'https://www.sjpost.co.kr/news/photo/202007/53199_48342_4214.jpg',
    'https://cdn.pixabay.com/photo/2019/08/01/12/36/illustration-4377408_960_720.png',
    'https://ojsfile.ohmynews.com/STD_IMG_FILE/2016/0516/IE001963941_STD.jpg'
  ];

  @override
  Widget build(BuildContext context) {
    SlidableController _slidableController;
    double width = MediaQuery.of(context).size.width;
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
            actions: [
              IconButton(
                onPressed: (){

                },
                icon: Icon(Icons.add),
              )
            ],
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
                child: Column(
                  children: <Widget>[
                    ListBody(
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
                        Slidable(
                          actionPane: SlidableDrawerActionPane(),
                          actionExtentRatio: 0.25,
                          controller: _slidableController,
                          actions: <Widget>[
                            IconSlideAction(
                              caption: '내용 수정',
                              color: Colors.blue,
                              icon: Icons.edit,
                              onTap: () {

                              },
                            ),
                          ],
                          secondaryActions: <Widget>[
                            IconSlideAction(
                              caption: '삭제',
                              color: Colors.red,
                              icon: Icons.delete,
                              onTap: (){
                              },
                            ),
                          ],
                          child: Container(
                            padding:
                                EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                            margin:
                                EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30.0),
                              color: HexColor("#e1e4ea"),
                            ),
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
                        for (int i = 0;i < imageList.length;i++)
                          Slidable(
                            actionPane: SlidableDrawerActionPane(),
                            actionExtentRatio: 0.25,
                            controller: _slidableController,

                            actions: <Widget>[
                              IconSlideAction(
                                caption: '다른사진',
                                color: Colors.blue,
                                icon: Icons.photo,
                                onTap: () {

                                },
                              ),
                              IconSlideAction(
                                caption: '새로운 사진',
                                color: Colors.blueAccent,
                                icon: Icons.camera_alt,
                                onTap: () {

                                },
                              ),
                            ],
                            secondaryActions: <Widget>[
                              IconSlideAction(
                                caption: 'Delete',
                                color: Colors.red,
                                icon: Icons.delete,
                                onTap: (){
                                  setState(() {
                                    imageList.removeAt(i);
                                  });
                                },
                              ),
                            ],

                            closeOnScroll: true,
                            child: Container(
                              width: width * 0.9,
                              margin: EdgeInsets.only(left: 16.0,right: 16.0, top: 16.0),
                              child: ClipRRect(
                                borderRadius: BorderRadius.only(topLeft: Radius.circular(30.0),topRight: Radius.circular(30.0)),
                                child: InkWell(
                                  child: FadeInImage.memoryNetwork(
                                    height: 200,
                                    placeholder: kTransparentImage,
                                    image: imageList[i],
                                    fit: BoxFit.fitWidth,
                                  ),
                                  onTap: () {
                                    Navigator.push(context,
                                        MaterialPageRoute(builder: (context) {
                                      return ShowImage(initialIndex: i,imageList: imageList,);
                                    }));
                                  },
                                ),
                              ),
                            ),
                          ),
                        Slidable(
                          actionPane: SlidableDrawerActionPane(),
                          actionExtentRatio: 0.25,
                          controller: _slidableController,
                          actions: <Widget>[
                            IconSlideAction(
                              caption: '내용 수정',
                              color: Colors.blue,
                              icon: Icons.edit,
                              onTap: () {

                              },
                            ),
                          ],
                          secondaryActions: <Widget>[
                            IconSlideAction(
                              caption: '삭제',
                              color: Colors.red,
                              icon: Icons.delete,
                              onTap: (){
                              },
                            ),
                          ],
                          child: Container(
                            padding:
                            EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                            margin:
                            EdgeInsets.symmetric(horizontal: 16.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(30.0),bottomRight: Radius.circular(30.0)),
                              color: HexColor("#e1e4ea"),
                            ),
                            child: Container(
                              child: Text(
                                '위 내용이 현재 처리 상태이며'
                                '아직 별다른 반응 없음. 추가적으로 변경 사항이있을시 해당사진에 부연설명을 입력하겠습니다.',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 16),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 80,
                        )
                      ],
                    ),
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
