import 'dart:async';
import 'dart:collection';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'article.dart';
import 'news.dart';


typedef Future<Null> OnRefresh();

class Home extends StatefulWidget {

  final List<String> categories = [
    "Business", "Entertainment", "Health", "Science", "Sports", "Technology"
  ];

  final Map<String, List<Article>> data = new HashMap<String, List<Article>>();

  Home() {
    for (String c in categories) {
      data.putIfAbsent(c, () => null);
    }
  }

  @override
  HomeState createState() {
    return new HomeState(categories, data);
  }

}

class HomeState extends State<Home> {
  
  final List<String> categories;
  final Map<String, List<Article>> data;
  final Map<String, String> headers = {
    'X-Api-Key' : "a55ec3febad444518664aa1e0601f270"
  };

  HomeState(this.categories, this.data);

  @override
  void initState() {
    super.initState();
    _initData();
  }

  @override
  Widget build(BuildContext context) {
    return new DefaultTabController(
      length: categories.length,
      child: new Scaffold(
        appBar: new AppBar(
          elevation: 0.0,
          title: new Text("Indo Headlines", style: new TextStyle(fontFamily: 'CinzelDecorative'),),
          actions: <Widget>[
            new IconButton(icon: new Icon(Icons.info), onPressed: () => _onPressInfo(context),)
          ],
          bottom: new TabBar(
            isScrollable: true,
            indicatorWeight: 4.0,
            indicatorSize: TabBarIndicatorSize.label,
            tabs: categories.map((category) => new Tab(text: category)).toList()
          ),
        ),
        body: new TabBarView(
          children: categories.map((category) => new News(data[category], () => _getData(category),)).toList()
        )
      ),
    );
  }

  _onPressInfo(BuildContext context) {
    showAboutDialog(
      context: context,
      applicationName: "Indo Headlines",
      applicationVersion: "1.0.0",
      applicationIcon: new Icon(Icons.view_headline),
      children: [
        new Text("Powered by News API")
      ]
    );
  }

  _initData() {
    for(String c in categories) {
      _getData(c);
    }
  }

  Future<Null> _getData(String category) async {
    String url = "https://newsapi.org/v2/top-headlines?country=id&category=$category";
    http.Response response = await http.get(url, headers: headers);
    var results = json.decode(response.body);
    List list = results["articles"];    

    setState(() {
      data[category] = list.map((item) => 
        new Article(
          item["source"]["name"], item["author"], 
          item["title"], item["description"], item["url"], 
          item["urlToImage"], item["publishedAt"])
        ).toList();
    });
  }

}