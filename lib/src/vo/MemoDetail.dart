import 'package:flutter/material.dart';

class Memo{
  String _smoMemo;
  String _smoDetailMemo;
  DateTime _smoStartDate;
  DateTime _smoEndDate;
  TimeOfDay _smoStartTime;
  TimeOfDay _smoEndTime;
  String _smoTodoType;

  String get memo => _smoMemo;
  String get detailMemo => _smoDetailMemo;
  DateTime get startDate => _smoStartDate;
  DateTime get endDate => _smoEndDate;
  TimeOfDay get startTime => _smoStartTime;
  TimeOfDay get endTime => _smoEndTime;
  String get toDoType => _smoTodoType;


  set memo (String smoMemo) => _smoMemo = smoMemo;
  set detailMemo (String smoDetailMemo) => _smoDetailMemo = smoDetailMemo;
  set startDate (DateTime smoDate) => _smoStartDate = smoDate;
  set endDate (DateTime smoDate) => _smoEndDate = smoDate;
  set startTime (TimeOfDay smoTime) => _smoStartTime = smoTime;
  set endTime (TimeOfDay smoTime) => _smoEndTime = smoTime;
  set toDoType (String smoTodoType) => _smoTodoType = smoTodoType;

  Memo(
  this._smoMemo,
  this._smoDetailMemo,
  this._smoStartDate,
  this._smoEndDate,
  this._smoStartTime,
  this._smoEndTime,
  this._smoTodoType
  );

  
  @override
    String toString(){
    return'[$memo ,$detailMemo ,$startDate ,$endDate ,$startTime ,$endTime]';
  }
}