import 'package:flutter/material.dart';

class SourceNews extends StatelessWidget {

  final String source;

  SourceNews(this.source);

  @override
  Widget build(BuildContext context) {
    return new Container(
      padding: new EdgeInsets.all(4.0),
      child: new Text(source, 
        style: Theme.of(context).textTheme.caption.copyWith(color: Colors.white),
        key: new Key("test"),
      ),
      decoration: new BoxDecoration(
        color: Theme.of(context).accentColor,
        borderRadius: new BorderRadius.all(new Radius.circular(5.0))
      ),
    );
  }

}