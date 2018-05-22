import 'package:flutter/material.dart';

import 'article.dart';
import 'detail.dart';
import 'helper.dart';
import 'source_news.dart';
import 'watermark.dart';

class NewsItem extends StatelessWidget {

  final Article article;

  NewsItem(this.article);

  @override
  Widget build(BuildContext context) {
    return new GestureDetector(
      onTap: () => new Detail(context, article),
      child: new Column(
        children: <Widget>[
          new Container(
            padding: new EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
            height: 100.0,
              child: new Row(
                children: <Widget>[                             
                  new Expanded(
                    child: new Container(
                      child: new Column(
                        children: <Widget>[
                          new Text(article.title, maxLines: 3, overflow: TextOverflow.ellipsis, 
                            style: Theme.of(context).textTheme.subhead),                     
                          new Expanded(
                            child: new Row(
                              children: <Widget>[
                                new Expanded(
                                  child: new Align(
                                    alignment: Alignment.bottomLeft,
                                    child: new SourceNews(article.sourceName),
                                  )
                                ),
                                new Align(
                                  alignment: Alignment.bottomRight,
                                  child: new Container(
                                    padding: new EdgeInsets.all(4.0),
                                    child: new Text(
                                      getFormattedPublishedDate(
                                        article.publishedAt.replaceAll(new RegExp(r'T'), ' ')
                                      ), style: Theme.of(context).textTheme.caption)
                                  )
                                )                          
                              ],
                            )
                          )
                        ],
                      ),
                    ),
                  ),
                  new Container(
                    width: 100.0,
                    height: 100.0,
                    padding: new EdgeInsets.only(left: 8.0),
                    child: new Stack(
                      fit: StackFit.expand,
                      children: <Widget>[
                        new Watermark(10.0),
                        article.urlToImage != null ?
                        Image.network(article.urlToImage, fit: BoxFit.fitHeight) :
                        new Container()
                      ],
                    )
                  )
                ],
              ),
          ),
          new Divider(height: 8.0,)
        ],

      ),
    );
  }

}