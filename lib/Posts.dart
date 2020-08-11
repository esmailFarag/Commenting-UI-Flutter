import 'package:flutter/material.dart';

//import 'package:popup_menu/popup_menu.dart';
//import 'package:commentsaspp/New_Post.dart';
import 'package:commentsaspp/models/Community.dart';
import 'package:commentsaspp/servies/api_servies.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class Posts extends StatefulWidget {
  @override
  _PostsState createState() => _PostsState();
}

class _PostsState extends State<Posts> with SingleTickerProviderStateMixin {
  int num = 1, position;

  Widget buildListTile(BuildContext context, List<Community> community) {
    /* GlobalKey btnKey = GlobalKey();
    PopupMenu.context = context;
    void onClickMenu(MenuItemProvider item) {}
    void onDismiss() {}

    onShow() {
      PopupMenu menu = PopupMenu(
          //backgroundColor: Colors.teal,
          //lineColor: Colors.black,
          maxColumn: 2,
          items: [
            MenuItem(
              image: new GestureDetector(
                child: Icon(
                  Icons.edit,
                  color: Colors.white,
                ),
                onTap: () {
                  //goToEditItemView(item);
                },
              ),
              title: 'Edit',
            ),
            MenuItem(
              title: 'Remove',
              // textStyle: TextStyle(fontSize: 10.0, color: Colors.tealAccent),
              image: new GestureDetector(
                child: Icon(
                  Icons.delete_forever,
                  color: Colors.white,
                ),
                onTap: () {
                  setState(() {
                    // items.removeAt(index);
                  });
                },
              ),
            ),
          ],
          onClickMenu: onClickMenu,
          // stateChanged: stateChanged,
          onDismiss: onDismiss);
      menu.show(widgetKey: btnKey);
    }*/

    _onAlertWithCustomContentPressed(context) {
      Alert(
          context: context,
          title: "Post",
          content: Column(
            children: <Widget>[
              TextField(
                decoration: InputDecoration(
                  labelText: 'Title',
                ),
              ),
              TextField(
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Descrabtion',
                ),
              ),
            ],
          ),
          buttons: [
            DialogButton(
              onPressed: () => Navigator.pop(context),
              child: Text(
                "Send",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            )
          ]).show();
    }

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
                      onPressed: () =>
                          _onAlertWithCustomContentPressed(context),
                    ),
                  ]));
            }),
        Positioned(
          bottom: 0,
          child: Container(
              color: Colors.red,
              width: MediaQuery.of(context).size.width,
              child: Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Container(
                        width: MediaQuery.of(context).size.width - 50,
                        child: TextFormField(
                          maxLines: 2,
                          decoration: InputDecoration(
                              labelText: "Wirte Your Quastion",
                              contentPadding: EdgeInsets.all(5),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                              )),
                        ),
                      ),
                      IconButton(
                          icon: Icon(Icons.send),
                          onPressed: () {
                            showDialog(
                                context: context,
                                builder: (_) => AlertDialog(
                                      title: Text("test"),
                                      content: Text("test2"),
                                      actions: <Widget>[
                                        FlatButton(
                                          child: Text("No"),
                                          onPressed: () =>Navigator.pop(context),
                                        ),
                                        FlatButton(
                                          child: Text("yes"),
                                          onPressed: () =>  Navigator.popUntil(context, (r)=>false),
                                        ),
                                      ],
                                      elevation: 24,
                                    ),
                                barrierDismissible: false);
                          }
                          // _onAlertWithCustomContentPressed(context),
                          ),
                    ],
                  )
                ],
              )),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
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
      /*  floatingActionButton: FloatingActionButton.extended(
            icon: Icon(Icons.chat),
            label: Text("Ask"),
            onPressed: () {
              Navigator.of(context).push(new MaterialPageRoute(
                builder: (BuildContext context) => new NewPost(),
              ));
            }),*/
    );
  }
}
