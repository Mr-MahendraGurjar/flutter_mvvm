import 'dart:convert';
import 'package:flutter_mvvm_provider/models/post.dart';
import 'package:flutter_mvvm_provider/notifiers/posts_notifier.dart';
import 'package:flutter_mvvm_provider/utils/url_and_keys.dart';
import 'package:http/http.dart' as http;

class ApiService {
  static Future<bool> loginApi(Post post, PostsNotifier postNotifier) async {
    print("login api");
    bool result = false;
    await http
        .post(Uri.parse(UrlAndKeys.BASE_URL + UrlAndKeys.LOGIN_URL),
            headers: {"Content-type": "application/json; charset=UTF-8"},
            body: json.encode(post.toMap()))
        .then((response) {
      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');

      if (response.statusCode == 200) {
        print("successful");
        result = true;
        postNotifier.addPostToList(post);
      }
    });

    return result;
  }
}
