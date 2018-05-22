import 'package:flutter/material.dart';

class Watermark extends StatelessWidget {

  final double fontSize;

  Watermark(this.fontSize);

  @override
  Widget build(BuildContext context) {
  return new Container(
      color: Colors.grey[200],
      padding: new EdgeInsets.all(8.0),
      child: new Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
            new Flexible(child: new Text("Indo Headlines", textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.caption.copyWith(fontSize: fontSize)))
        ],
      ),
    );
  }

}