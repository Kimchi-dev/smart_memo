import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:smart_memo/src/Util/fn_util/customFormatter.dart';
import 'package:smart_memo/src/vo/memodetail.dart';

class CustomWidgetMaker{

  static Widget getBuyOrTodo(String todoCode){
    String chTodoString;
    Color chTodoColor;
    if(todoCode == 'todo001'){
      chTodoString = "사요";
      chTodoColor = Colors.green;
    }else if(todoCode == 'todo002'){
      chTodoString = "해요";
      chTodoColor = Colors.blue;
    }else if(todoCode == 'todo003'){
      chTodoString = "미션팩";
      chTodoColor = Colors.black;
    }
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8.0),
      padding: EdgeInsets.symmetric(horizontal: 8.0 ,vertical: 4.0),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.0),
          color: chTodoColor),
      child: Text(
        chTodoString,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 16,
          color: Colors.white
        ),
      ),
    );
  }

  static List<Widget> memoListToWidget(List<Memo>  memoList,BuildContext context){
    List<Widget> widgetList = [];
    for (Memo memo in memoList)
      widgetList.add(Column(
        children: <Widget>[
          InkWell(
            onTap: (){
              showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10.0))),
                      backgroundColor: Colors.white,
                      title: Text('${memo.memo}'),
                      content: Builder(
                        builder: (context) {
                          // Get available height and width of the build area of this widget. Make a choice depending on the size.
                          var height = MediaQuery.of(context).size.height;
                          var width = MediaQuery.of(context).size.width;

                          return Container(
                            height: height *0.5,
                            width: width *0.7,
                            child: SingleChildScrollView(
                              child: ListBody(
                                children: <Widget>[
                                  Text('${memo.detailMemo}'),
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
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                          onPressed: () => Navigator.pop(context),
                          color: Colors.blueAccent,
                          radius: BorderRadius.circular(10.0),
                        ),
                      ],
                    );
                  });
            },
            child: Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Column(
                        children: <Widget>[
                          Container(
                            width: MediaQuery.of(context).size.width * 0.59,
                            padding: EdgeInsets.only(left: 16.0),
                            child: Text(
                              '${memo.memo}',
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width * 0.5,
                            padding: EdgeInsets.only(left: 20.0),
                            child: Text(
                              '${memo.detailMemo}',
                              textAlign: TextAlign.left,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Column(
                      children: <Widget>[
                        CustomWidgetMaker.getBuyOrTodo(memo.toDoType),
                        Container(
                          child: Text(
                            CustomFormatter.dateToHyphenString(
                                memo.startDate),
                            textAlign: TextAlign.left,
                            style:
                            TextStyle(fontSize: 14, color: Colors.grey),
                          ),
                        ),
                      ],
                    ),
                    Container(
                      width: 70,
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(16.0),
                      ),
                      child: FlatButton(
                        child: Text(
                          '처리',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Colors.white
                          ),
                        ),
                        onPressed: (){

                        },
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: 16.0, vertical: 4),
            child: Divider(
              color: Colors.grey,
            ),
          ),
        ],
      ));
    return widgetList;
  }

  static List<Widget> onlyTypeList (List<Memo> memoList,BuildContext context,String todoType){
    List<Widget> widgetList = [];



    for (Memo memo in memoList){
        if(memo.toDoType == todoType){
          widgetList.add(Column(
            children: <Widget>[
              InkWell(
                onTap: (){
                  showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(Radius.circular(10.0))),
                          backgroundColor: Colors.white,
                          title: Text('${memo.memo}'),
                          content: Builder(
                            builder: (context) {
                              // Get available height and width of the build area of this widget. Make a choice depending on the size.
                              var height = MediaQuery.of(context).size.height;
                              var width = MediaQuery.of(context).size.width;

                              return Container(
                                height: height *0.5,
                                width: width *0.7,
                                child: SingleChildScrollView(
                                  child: ListBody(
                                    children: <Widget>[
                                      Text('${memo.detailMemo}'),
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
                                style: TextStyle(color: Colors.white, fontSize: 20),
                              ),
                              onPressed: () => Navigator.pop(context),
                              color: Colors.blueAccent,
                              radius: BorderRadius.circular(10.0),
                            ),
                          ],
                        );
                      });
                },
                child: Column(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: Column(
                            children: <Widget>[
                              Container(
                                width:
                                MediaQuery.of(context).size.width * 0.59,
                                padding: EdgeInsets.only(left: 16.0),
                                child: Text(
                                  '${memo.memo}',
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              Container(
                                width:
                                MediaQuery.of(context).size.width * 0.5,
                                padding: EdgeInsets.only(left: 20.0),
                                child: Text(
                                  '${memo.detailMemo}',
                                  textAlign: TextAlign.left,
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Column(
                          children: <Widget>[
                            CustomWidgetMaker.getBuyOrTodo(memo.toDoType),
                            Container(
                              child: Text(
                                CustomFormatter.dateToHyphenString(
                                    memo.startDate),
                                textAlign: TextAlign.left,
                                style:
                                TextStyle(fontSize: 14, color: Colors.grey),
                              ),
                            ),
                          ],
                        ),
                        Container(
                          width: 70,
                          decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(16.0),
                          ),
                          child: FlatButton(
                            child: Text(
                              '처리',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                  color: Colors.white
                              ),
                            ),
                            onPressed: (){

                            },
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 16.0, vertical: 4),
                child: Divider(
                  color: Colors.grey,
                ),
              ),
            ],
          ));
      }else{

        }
    }
    return widgetList;

  }
}