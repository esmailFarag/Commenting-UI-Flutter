import 'package:flutter/material.dart';

import 'package:commentsaspp/models/Community.dart';
import 'package:commentsaspp/servies/api_servies.dart';


class ListComments extends StatefulWidget {
  @override
  _ListCommentsState createState() => _ListCommentsState();
}

class _ListCommentsState extends State<ListComments> {

  int num = 1, position;

  final TextEditingController _titileController = new TextEditingController();
  final TextEditingController _bodeyController = new TextEditingController();

  _onPressed() {
    setState(() {
      sendPost("4", _titileController.text, _bodeyController.text);
    });
  }

  @override
  Widget build(BuildContext context) {

    Widget buildListTile(BuildContext context, List<Community> community) {
      return Stack(
        children: <Widget>[

          ListView.builder(
              physics: BouncingScrollPhysics(),
              itemCount: listOFCommunityPosts.length,
              itemBuilder: (context, position) {
                return new Card(
                    child: new Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          new ListTile(
                            leading: CircleAvatar(
                              radius: 20.0,
                              child: new Container(
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: new DecorationImage(
                                    image: new NetworkImage(
                                        "https://www.kindpng.com/picc/m/24-248729_stockvader-predicted-adig-user-profile-image-png-transparent.png"),
                                  ),
                                ),
                              ),
                            ),
                            title: Text(community[position].creator.name),
                            subtitle: new Row(
                              children: [
                                new Text(
                                  community[position].createdAt,
                                  style: TextStyle(fontSize: 12),
                                ),
                                /*new Icon(
                            Icons.public,
                            size: 15.0,
                          )*/
                              ],
                            ),
                            trailing: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                new GestureDetector(
                                  //key: btnKey,
                                  child: new Icon(Icons.more_horiz),
                                  onTap: () {
                                    //onShow();
                                  },
                                ),
                              ],
                            ),
                          ),
                          new Padding(
                            padding: EdgeInsets.only(left: 20, bottom: 12),
                            child: new Text(community[position].title),
                          ),
                          new Text(community[position].body),
                IconButton(
                icon: Icon(Icons.chat),
                  onPressed: null,
                ),
                        ]));
              }),

        ],
      );
    }

    return Scaffold(
      bottomNavigationBar: Container(
        height: 40.0,
        child: BottomAppBar(
          color: Color.fromRGBO(58, 66, 86, 1.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              IconButton(
                icon: Icon(Icons.arrow_back, color: Colors.white),
                onPressed: () {
                  setState(() {
                    if (num == 1) {
                      num = 1;
                      print("num = 1");
                    } else {
                      num -= 1;
                    }
                  });
                },
              ),
              IconButton(
                icon: Icon(Icons.arrow_forward, color: Colors.white),
                onPressed: () {
                  setState(() {
                    print(currentPage);
                    if (currentPage < last_page) {
                      num = num + 1;
                      print("test: $currentPage");
                      print("Num $num");
                    } else if (currentPage == last_page) {
                      print("no data");
                    }
                  });
                },
              )
            ],
          ),
        ),
      ),
      body: new FutureBuilder(
          future: getCommunityPosts(num),
          builder: (context, snapshot) {
            return snapshot.data != null
                ? buildListTile(context, snapshot.data)
                : Center(
              child: CircularProgressIndicator(),
            );
          }),

    );
  }
}
