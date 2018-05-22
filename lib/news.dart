import 'package:flutter/material.dart';

import 'article.dart';
import 'first_news_item.dart';
import 'news_item.dart';
import 'home.dart';

class News extends StatefulWidget {

  final List<Article> articles;
  final OnRefresh callback;

  News(this.articles, this.callback);

  @override
  NewsState createState() {
    return new NewsState(articles, callback);
  }

}

class NewsState extends State<News> {

  OnRefresh refresh;
  List<Article> articles = [];
  NewsState(this.articles, this.refresh);

  @override
  Widget build(BuildContext context) {
    return new Material(
      child: new Container(
          child: new Stack(
            children: <Widget>[
              (articles == null) ?
              new Center(child: new CircularProgressIndicator()) : new Container(),
              new RefreshIndicator(
                onRefresh: () => refresh(),
                child: new ListView.builder(
                  itemBuilder: (BuildContext context, int index) {
                    if (index  == 0) return new FirstNewsItem(articles[index]);
                    else return new NewsItem(articles[index]);
                  },
                  itemCount: articles == null ? 0 : articles.length,
                ),
              ),
            ],
          ),
        ),
    );
  }
}