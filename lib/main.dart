import 'package:flutter/material.dart';

import 'package:medium_clone/NewsHelper.dart';
import 'package:medium_clone/NewsArticle.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Home',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Home',
            style: TextStyle(fontWeight: FontWeight.w400),
          ),
          backgroundColor: Colors.black,
          actions: <Widget>[
            Padding(
                padding: EdgeInsets.only(right: 20.0),
                child: Icon(
                  Icons.notifications,
                  color: Colors.grey,
                )),
            Padding(
                padding: EdgeInsets.only(right: 12.0),
                child: Icon(
                  Icons.search,
                  color: Colors.grey,
                )),
          ],
        ),
        drawer: Drawer(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                child: Padding(
                  padding: EdgeInsets.fromLTRB(32.0, 64.0, 32.0, 16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Icon(
                        Icons.account_circle,
                        size: 90.0,
                      ),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child:
                            Text("John Doe", style: TextStyle(fontSize: 20.0)),
                      ),
                      Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text("See Profile",
                              style: TextStyle(color: Colors.black45)))
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  color: Colors.black12,
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(40.0, 16.0, 40.0, 40.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "Home",
                            style: TextStyle(fontSize: 18.0),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "Audio",
                            style: TextStyle(fontSize: 18.0),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "Bookmarks",
                            style: TextStyle(fontSize: 18.0),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "Interests",
                            style: TextStyle(fontSize: 18.0),
                          ),
                        ),
                        Divider(),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "Become a member",
                            style:
                                TextStyle(fontSize: 18.0, color: Colors.teal),
                          ),
                        ),
                        Divider(),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "New Story",
                            style: TextStyle(fontSize: 18.0),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "Stats",
                            style: TextStyle(fontSize: 18.0),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "Drafts",
                            style: TextStyle(fontSize: 18.0),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
        body: ListView.builder(
          itemCount: NewsHelper.articleCount,
          itemBuilder: (context, position) {
            NewArticle article = NewsHelper.getArticle(position);
            return Padding(
              padding: EdgeInsets.fromLTRB(0.0, 0.5, 0.0, 0.5),
              child: Card(
                child: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        article.categoryTitle,
                        style: TextStyle(
                            color: Colors.black38,
                            fontWeight: FontWeight.w500,
                            fontSize: 16.0),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(0.0, 12.0, 0.0, 12.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Flexible(
                              child: Text(
                                article.title,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 22.0),
                              ),
                              flex: 3,
                            ),
                            Flexible(
                              flex: 1,
                              child: Container(
                                height: 80.0,
                                width: 80.0,
                                child: Image.asset(
                                  "assets/" + article.imageAssetName,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                article.author,
                                style: TextStyle(fontSize: 18.0),
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 10.0),
                                child: Text(
                                  article.date + " . " + article.readTime,
                                  style: TextStyle(
                                      color: Colors.black45,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                            ],
                          ),
                          Icon(Icons.bookmark_border)
                        ],
                      )
                    ],
                  ),
                ),
              ),
            );
          },
        ));
  }
}
