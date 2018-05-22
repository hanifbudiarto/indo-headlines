import 'package:flutter/material.dart';

import 'article.dart';
import 'detail.dart';
import 'helper.dart';
import 'watermark.dart';

class FirstNewsItem extends StatelessWidget {

  final Article article;

  FirstNewsItem(this.article);

  @override
  Widget build(BuildContext context) {
    return new GestureDetector(
      onTap: () => new Detail(context, article),
      child: new Container(
        height: 240.0,            
        child: new Stack(
          fit: StackFit.expand,
          children: <Widget>[
            this.article.urlToImage != null ?
            new Image.network(this.article.urlToImage, fit: BoxFit.fitHeight) :
            new Watermark(20.0),
            new Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[ 
                new Container(
                  height: 100.0,
                  child: new Stack(
                    fit: StackFit.expand,
                    children: <Widget>[
                      new Opacity(
                        opacity: 0.2,
                        child: new Container(
                          color: Theme.of(context).primaryColor
                        ),
                      ),
                      new Center(
                        child: new Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            new Text(this.article.title, textAlign: TextAlign.center, maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: Theme.of(context).textTheme.headline.copyWith(color: Colors.white)),
                            new Text("${article.sourceName} | ${getFormattedPublishedDate(article.publishedAt)}", 
                              style: Theme.of(context).textTheme.caption.copyWith(color: Colors.white)),
                          ],
                        )
                      ), 
                    ],
                  ) 
                )      
              ],
            )
          ],
        ),
        
      ),
    );
  }

}