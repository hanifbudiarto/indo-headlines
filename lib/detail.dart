import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import 'article.dart';

class Detail {

  Detail(BuildContext context, Article article) {
    showDialog(
      context: context,
      builder: (context) => 
        new AlertDialog(
          title: new Text(article.title),
          content: new Text(article.description, style: Theme.of(context).textTheme.body2,),
          actions: <Widget>[
            new FlatButton(
              child: new Text("VISIT LINK", style: new TextStyle(
                color: Theme.of(context).accentColor
              )),
              onPressed: () => launch(article.url),
            )
          ],
        )
    );
  }


}