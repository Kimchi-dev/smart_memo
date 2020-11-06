import 'package:flutter/material.dart';

class BottomNavHome extends StatefulWidget {
  @override
  _BottomNavHomeState createState() => _BottomNavHomeState();
}

class _BottomNavHomeState extends State<BottomNavHome> {
  String _toDoText = "";
  final _addTodoController = TextEditingController();
  final _addFormKey = GlobalKey<FormState>();

  double _moreFormBoxHeight = 0.0;
  double _moreFormBoxWidth = 0.0;
  @override
  void dispose() {
    _addTodoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Form(
        key: _addFormKey,
        child: ListView(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
              children: <Widget>[
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: '물건 또는 할일',
                      fillColor: Colors.blue,
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25.0),
                        borderSide:const BorderSide(color: Colors.green,width: 3.0)
                      ),
                      errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25.0),
                          borderSide:const BorderSide(color: Colors.red,width: 3.0)
                      ),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25.0),
                          borderSide:const BorderSide(color: Colors.blue,width: 5.0)
                      ),
                    ),
                    controller: _addTodoController,
                  ),
                SizedBox(height: 10,),
                AnimatedContainer(
                  child: ListView(
                    children: <Widget>[
                      TextFormField(
                        decoration: InputDecoration(
                            labelText: '상세내용',
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                color: Colors.green
                              ),
                            )
                        ),
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                            labelText: '날짜'
                        ),
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                            labelText: '시간'
                        ),
                      ),
                    ],
                  ),
                  duration: const Duration(milliseconds: 300),
                  height: _moreFormBoxHeight,
                  width: _moreFormBoxWidth,
                )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 30.0),
              child: Row(
                children: <Widget>[
                  Container(
                    child: RaisedButton.icon(
                      onPressed: () {
                        setState(() {
                          _moreFormBoxHeight != 0.0 ? _moreFormBoxHeight = 0.0 : _moreFormBoxHeight = 250.0;
                          _moreFormBoxWidth != 0.0 ? _moreFormBoxWidth = 0.0 : _moreFormBoxWidth = MediaQuery.of(context).size.width;
                        });
                      },
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15.0))
                      ),
                      label: Text(
                        '+',
                        style:
                        TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 20,
                          color: Colors.white,
                        ),
                      ),
                      icon: Icon(
                        Icons.arrow_drop_down,
                        color: Colors.white,
                      ),
                      textColor: Colors.white,
                      splashColor: Colors.blueAccent,
                      color: Colors.grey,
                      key: Key('addTodoButtons'),
                    ),
                  ),Container(
                    margin: EdgeInsets.symmetric(horizontal: 16.0),
                    child: RaisedButton.icon(
                      onPressed: () {
                        setState(() {
                          _toDoText = _addTodoController.text.toString();
                          print(_toDoText);
                        });
                      },
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15.0))
                      ),
                      label: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 40.0),
                        child: Text(
                          '등록',
                          style:
                          TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 20,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      icon: Icon(
                        Icons.library_add,
                        color: Colors.white,
                      ),
                      textColor: Colors.white,
                      splashColor: Colors.lightGreen,
                      color: Colors.green,
                      key: Key('addTodoButtons'),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
