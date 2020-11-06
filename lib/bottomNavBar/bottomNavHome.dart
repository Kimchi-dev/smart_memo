import 'package:flutter/material.dart';

class BottomNavHome extends StatefulWidget {
  @override
  _BottomNavHomeState createState() => _BottomNavHomeState();
}

class _BottomNavHomeState extends State<BottomNavHome> {
  String _toDoText = "";
  final _addTodoController = TextEditingController();
  final _addFormKey = GlobalKey<FormState>();

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
              child: TextFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: '일단 메모 !',
                ),
                controller: _addTodoController,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                children: <Widget>[
                  OutlineButton(
                    onPressed: () {
                      setState(() {
                        _toDoText = _addTodoController.text.toString();
                        print(_toDoText);
                      });
                    },
                    child: Text(
                      '자세히',
                      style:
                          TextStyle(fontWeight: FontWeight.w700, fontSize: 30),
                    ),
                    key: Key('addTodoButtons'),
                  ),
                  SizedBox(
                    width:  50,
                  ),
                  OutlineButton(
                    onPressed: () {
                      setState(() {
                        _toDoText = _addTodoController.text.toString();
                        print(_toDoText);
                      });
                    },
                    child: Text('작성  !',
                      style:
                      TextStyle(fontWeight: FontWeight.w700, fontSize: 30),),
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
