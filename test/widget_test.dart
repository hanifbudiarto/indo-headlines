import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../lib/source_news.dart';

void main() {
  testWidgets("my first test widget", (WidgetTester widgetTester) async {
    await widgetTester.pumpWidget(
      new MaterialApp(
        home: new Material(
          child: new SourceNews("CNN.com") ,
        ),
      )
    );
    Text text = widgetTester.widget(find.byKey(new Key("test")));
    expect(text.data, "CNN.com");
  });
}