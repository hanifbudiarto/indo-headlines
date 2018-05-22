import 'package:intl/intl.dart';

DateFormat _parser = new DateFormat("yyyy-MM-dd");

String getFormattedPublishedDate(String datetime) {
  var matcher = new RegExp(r'\d{4}-\d{2}-\d{2} \d{2}:\d{2}:*\w*');
  if (datetime == null || !matcher.hasMatch(datetime)) return "";

  var splitted = datetime.split(" ");
  String date = splitted[0];
  String time = removeMillis(splitted[1]);
  
  int diff = _checkDifference(date, _parser.format(new DateTime.now()));
  if (diff == 0) return time;
  else return _getRelativeDate(diff);
}

String removeMillis(String time) {
  var matcher = new RegExp(r'\d{2}:\d{2}:*\w*');
  if (!matcher.hasMatch(time)) return "";

  List<String> splitted = time.split(":");
  return "${splitted[0].toString()}:${splitted[1].toString()}";
}

String _getRelativeDate(int diff) {
  if (diff == 1) return "Yesterday";
  else return "${diff.toString()} days ago";
}

int _checkDifference(String publishedDate, String now) {
  // yyyy-MM-dd
  DateTime d1 = _parser.parse(publishedDate);
  DateTime d2 = _parser.parse(now);

  return d2.difference(d1).inDays;
}