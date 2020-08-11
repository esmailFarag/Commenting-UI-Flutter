import 'dart:convert';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import 'package:commentsaspp/models/Community.dart';
import 'package:commentsaspp/models/channel.dart';
import 'package:commentsaspp/models/courses.dart';
import 'package:commentsaspp/models/YouTube.dart';
import 'package:commentsaspp/models/topics.dart';
import 'package:commentsaspp/models/user.dart';

String url = 'http://www.Yoken-domain.com/api';

var status;
var token = "Your Yoken";
User user;
List<Channel> listOFChannel;
List<Course> listOFCourse;
List<Course> listSpecificCourses;
List<YouTube> listOFYouTube;
List<Topics> listOFWordTopics;
List<User> listOFuser;
var currentPage, last_page;
List<Community> listOFCommunityPosts;

Future<User> getprofile() async {
  final prefs = await SharedPreferences.getInstance();
  final key = 'access_token';
  final value = prefs.get(key) ?? null;

  var respond = await http.get(Uri.encodeFull("$url/auth/profile"), headers: {
    "Accept": "application/json",
    "Authorization": "Bearer $value",
  });

  if (respond.statusCode == 200) {
    var data = json.decode(respond.body);
    var respondBody = data["data"];
    user = new User.fromJson(respondBody);
    print(user.email);
  } else {
    print("not found data profle");
  }
  return user;
}

Future<List<Community>> getCommunityPosts(int numPage) async {
  var respond = await http.get(
      Uri.encodeFull("$url/threads/computer-science-subjects/?page=$numPage"),
      headers: {
        "Accept": "application/json",
        "Authorization": "Bearer $token",
      });

  if (respond.statusCode == 200) {
    var data = json.decode(respond.body);
    var respondBody = data["data"] as List;

    last_page = data["last_page"];
    currentPage = data["current_page"];

    //print("last page 2 :::: $respondBody2");

    //  LastPage page = new LastPage.fromJson(data);
    /// print("last_page v : ${page.lastPage}");

    listOFCommunityPosts =
        respondBody.map<Community>((json) => Community.fromJson(json)).toList();
  }

  // print("list OF Community Posts length: ${listOFCommunityPosts.length}");
  // print("Posts [0] title: ${listOFCommunityPosts[0].body}");
  //print("Posts [7] creator name: ${listOFCommunityPosts[7].creator.name}");

  return listOFCommunityPosts;
}

sendPost(String channelId, String title, String body) async {
  // String myUrl = "$url/threads";

  final response = await http.post("$url/threads", headers: {
    "Accept": "application/json",
    "Authorization": "Bearer $token",
  }, body: {
    "channel_id": "$channelId",
    "title": "$title",
    "body": "$body",
  });

  // status = response.body.contains('failure');
  var data = json.decode(response.body);

  if (response.statusCode != 201) {
    print('message : ${data["message"]}');
  } else {
    print("Seccess  sendPost");
  }
}
