import 'package:flutter/material.dart';


class NewPost extends StatefulWidget {
  @override
  _NewPostState createState() => _NewPostState();
}

class _NewPostState extends State<NewPost> {
  TextEditingController titleController;

  /*@override
  void initState() {
    super.initState();
    titleController = new TextEditingController(
        text: widget.item != null ? widget.item.title : null);
  }*/

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          /*title: Text(
          widget.item != null ? 'Edit todo' : 'Comments',
          key: Key('new-item-title'),
        ),
        centerTitle: true,*/
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new Card(
                child: new Column(
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

                      title: Text("User"),
                      subtitle: new Row(
                        children: [
                          new Text("10:20"),
                          new Icon(
                            Icons.public,
                            size: 15.0,
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 25 , bottom: 25 , right:25),
                      child: TextField(
                        controller: titleController,
                        autofocus: true,
                        onSubmitted: (value) => submit(),
                        decoration: InputDecoration(hintText: 'Write something here...'),
                      ),
                    ),

                    SizedBox(
                      height: 14.0,
                    ),
                    RaisedButton(
                      color: Theme.of(context).primaryColor,
                      child: Text(
                        'Post',
                        style: TextStyle(
                            color: Theme.of(context).primaryTextTheme.title.color),
                      ),
                      elevation: 3.0,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(10.0),
                              topRight: Radius.circular(10.0))),
                      onPressed: () => submit(),
                    )
                  ],
                ),
              ),

            ],
          ),
        ),
          floatingActionButton: FloatingActionButton.extended(
            icon: Icon(Icons.chat),
            label: Text("Ask"),
            onPressed: () {
              Navigator.of(context).push(new MaterialPageRoute(
                builder: (BuildContext context) => null,
              ));
            }),
      ),

    );
  }

  void submit() {
    Navigator.of(context).pop(titleController.text);
  }
}
