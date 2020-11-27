import 'package:intl/intl.dart';

class CustomFormatter{

  static DateFormat dateFormatKr = DateFormat('yy년 MM월 dd일');
  static DateFormat datefomatHyphen = DateFormat('yyyy-MM-dd');

  static String dateToKrString(DateTime date){
    return dateFormatKr.format(date);
  }

  static String dateToHyphenString(DateTime date){
    return datefomatHyphen.format(date);
  }

}