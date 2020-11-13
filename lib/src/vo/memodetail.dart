import 'package:flutter/material.dart';

class Memo{
  String _smoMemo;
  String _smoDetailMemo;
  DateTime _smoStartDate;
  DateTime _smoEndDate;
  TimeOfDay _smoStartTime;
  TimeOfDay _smoEndTime;
  String _smoTodoType;

  get memo => _smoMemo;
  get detailMemo => _smoDetailMemo;
  get startDate => _smoStartDate;
  get endDate => _smoEndDate;
  get startTime => _smoStartTime;
  get endTime => _smoEndTime;
  get toDoType => _smoTodoType;

  Memo(
  this._smoMemo,
  this._smoDetailMemo,
  this._smoStartDate,
  this._smoEndDate,
  this._smoStartTime,
  this._smoEndTime,
  this._smoTodoType
  );

  set memoSet (String smoMemo) => _smoMemo = smoMemo;
  set detailMemoSet (String smoDetailMemo) => _smoDetailMemo = smoDetailMemo;
  set startDateSet (DateTime smoDate) => _smoStartDate = smoDate;
  set endDateSet (DateTime smoDate) => _smoEndDate = smoDate;
  set startTimeSet (TimeOfDay smoTime) => _smoStartTime = smoTime;
  set endTimeSet (TimeOfDay smoTime) => _smoEndTime = smoTime;
  set smoTypeSet (String smoTodoType) => _smoTodoType = smoTodoType;
  @override
    String toString(){
    return'[$memo ,$detailMemo ,$startDate ,$endDate ,$startTime ,$endTime]';
  }
}