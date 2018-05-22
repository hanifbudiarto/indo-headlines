import 'package:intl/intl.dart';
import 'package:test/test.dart';

import '../lib/helper.dart';

void main() {
  test('test published date', () {
    DateTime now = new DateTime.now();
    DateTime sixDaysAgo = now.subtract(new Duration(days: 6));

    DateFormat parser = new DateFormat("yyyy-MM-dd HH:mm:ss");

    String pubdate = getFormattedPublishedDate(parser.format(sixDaysAgo));
    expect(pubdate, "6 days ago");

    DateTime yesterday = now.subtract(new Duration(days: 1));
    pubdate = getFormattedPublishedDate(parser.format(yesterday));
    expect(pubdate, "Yesterday");

    pubdate = getFormattedPublishedDate(null);
    expect(pubdate, "");

    DateTime twoHoursBefore = now.subtract(new Duration(hours: 2));
    String strTwoHoursBefore = parser.format(twoHoursBefore);
    pubdate = getFormattedPublishedDate(strTwoHoursBefore);
    String timeComparison = removeMillis(strTwoHoursBefore.split(" ")[1]);
    expect(pubdate, timeComparison);

    expect(removeMillis("12:"), "");
    expect(removeMillis("12:10"), "12:10");
    expect(removeMillis("12:10:949Z"), "12:10");

    expect(getFormattedPublishedDate("this_is_a_string"), "");
    expect(getFormattedPublishedDate("1990-02-09"), "");
    expect(getFormattedPublishedDate(strTwoHoursBefore + "ZZZ"), timeComparison);

  });
}