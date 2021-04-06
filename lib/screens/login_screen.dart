import 'package:flutter/material.dart';
import 'package:flutter_mvvm_provider/models/post.dart';
import 'package:flutter_mvvm_provider/notifiers/posts_notifier.dart';
import 'package:flutter_mvvm_provider/utils/colors.dart';
import 'package:provider/provider.dart';

class AddPostScreen extends StatefulWidget {
  @override
  State createState() {
    return AddPostScreenSate();
  }
}

class AddPostScreenSate extends State<AddPostScreen> {
  final _formKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  Post _post = new Post();

  _showSnackBar(String text, BuildContext context) {
    final snackbar = SnackBar(content: Text(text));
    _scaffoldKey.currentState.showSnackBar(snackbar);
  }

  _createPost(BuildContext context) {
    if (!_formKey.currentState.validate()) {
      _showSnackBar("Failed to create Post", context);
      return;
    }
    _formKey.currentState.save();

    PostsNotifier postNotifier = Provider.of(context, listen: false);
    postNotifier.loginPost(_post).then((value) {
      if (value) {
        _showSnackBar("Login Successfully", context);
        Navigator.pushNamed(context, "/homeScreen");

      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/food.jpeg'), fit: BoxFit.cover)),
          ),
          Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
                  Colors.transparent,
                  Colors.transparent,
                  Color(0xff161d27).withOpacity(0.9),
                  Color(0xff161d27),
                ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
          ),
          Center(
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Text(
                    "Welcome!",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 38,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Time to cook, let's Sign in",
                    style: TextStyle(color: Colors.grey.shade500, fontSize: 16),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: 50,
                    margin: EdgeInsets.only(left: 40, right: 40),
                    child: TextFormField(
                      style: TextStyle(fontSize: 16, color: Colors.white),
                      decoration: InputDecoration(
                        hintText: "Email",
                        hintStyle: TextStyle(color: Colors.grey.shade700),
                        filled: true,
                        fillColor: Color(0xff161d27).withOpacity(0.9),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: BorderSide(color: colors)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: BorderSide(color: colors)),
                      ),
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Email field cannot be empty';
                        }
                        return null;
                      },
                      onSaved: (String value) {
                        _post.email = value;
                      },
                    ),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Container(
                    height: 50,
                    margin: EdgeInsets.only(left: 40, right: 40),
                    child: TextFormField(
                      obscureText: true,
                      style: TextStyle(fontSize: 16, color: Colors.white),
                      decoration: InputDecoration(
                        hintText: "Password",
                        hintStyle: TextStyle(color: Colors.grey.shade700),
                        filled: true,
                        fillColor: Color(0xff161d27).withOpacity(0.9),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: BorderSide(color: colors)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: BorderSide(color: colors)),
                      ),
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Password field cannot be empty';
                        }
                        return null;
                      },
                      onSaved: (String value) {
                        _post.password = value;
                      },
                    ),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: Padding(
                      padding: EdgeInsets.only(right: 40),
                      child: Text(
                        "Forgot Password?",
                        style: TextStyle(
                            color: colors, fontSize: 14, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: 50,
                    width: double.infinity,
                    margin: EdgeInsets.only(left: 40, right: 40),
                    child: MaterialButton(
                      onPressed: () {
                        _createPost(context);
                      },
                      color: colors,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Text(
                        "LOG IN",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 16),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "It's your first time here?",
                        style: TextStyle(color: Colors.white),
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Text(
                        "Sign up",
                        style:
                        TextStyle(color: colors, fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
