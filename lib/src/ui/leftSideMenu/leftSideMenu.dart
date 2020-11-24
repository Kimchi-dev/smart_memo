import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class NavDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Text(
              '꼬미러버 님',
              style: TextStyle(
                color: Colors.white,
                fontSize: 25,
              ),
            ),
            decoration: BoxDecoration(
                color: HexColor('#d5bff3'),
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: AssetImage('images/profileImage.jpg'),
                )),
          ),
          ListTile(
            leading: Icon(Icons.input),
            title: Text('시작하기'),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Settings'),
            onTap: () => {Navigator.of(context).pop()},
          ),
          Row(children: <Widget>[
            Expanded(
                child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Divider(
                color: Colors.grey,
              ),
            )),
            Text("모임 선택"),
            Expanded(
                child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Divider(
                color: Colors.grey,
              ),
            )),
          ]),
          ListTile(
            leading: Icon(Icons.people),
            title: Text('가족들'),
            onTap: () {
              final snackBar = SnackBar(
                content: Text('모임이 가족들로 변경되었습니다.',
                style: TextStyle(
                  fontWeight: FontWeight.bold,

                  ),
                  textAlign: TextAlign.center,
                ),
                // action: SnackBarAction(
                //     label: 'Undo',
                //     onPressed: () {
                //       // Some code to undo the change.
                //     }),
              );
              Navigator.of(context).pop();
              Scaffold.of(context).showSnackBar(snackBar);
            },
          ),
          ListTile(
            leading: Icon(Icons.people),
            title: Text('친구들'),
            onTap: (){

              final snackBar = SnackBar(
                content: Text('모임이 친구들로 변경되었습니다.',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,

                  ),
                  textAlign: TextAlign.center,
                ),
                // action: SnackBarAction(
                //     label: 'Undo',
                //     onPressed: () {
                //       // Some code to undo the change.
                //     }),
              );
              Navigator.of(context).pop();
              Scaffold.of(context).showSnackBar(snackBar);
            },
          ),
          ListTile(
            leading: Icon(Icons.people),
            title: Text('회사'),
            onTap: (){
              final snackBar = SnackBar(
                content: Text('모임이 회사로 변경되었습니다.',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,

                  ),
                  textAlign: TextAlign.center,
                ),
                // action: SnackBarAction(
                //     label: 'Undo',
                //     onPressed: () {
                //       // Some code to undo the change.
                //     }),
              );
              Navigator.of(context).pop();
              Scaffold.of(context).showSnackBar(snackBar);
            },
          ),
        ],
      ),
    );
  }
}
