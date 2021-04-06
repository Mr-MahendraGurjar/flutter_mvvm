import 'package:flutter/material.dart';
import 'package:flutter_mvvm_provider/screens/home/home_screen.dart';
import 'package:flutter_mvvm_provider/screens/login/login_screen.dart';
import 'package:flutter_mvvm_provider/screens/profile/profile_screen.dart';
import 'package:flutter_mvvm_provider/sharedWidgets/drawer_item.dart';
import 'package:flutter_mvvm_provider/utils/navigation.dart';

class DrawerMenu extends StatelessWidget {
  const DrawerMenu({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final userModel = Provider.of<UserStore>(context).user;
    return Container(
      width: 280,
      child: Drawer(
        // Add a ListView to the drawer. This ensures the user can scroll
        // through the options in the drawer if there isn't enough vertical
        // space to fit everything.
        child: Container(
          padding: EdgeInsets.all(10),
          color: Colors.grey[200],
          child: Column(
            children: <Widget>[
              Expanded(
                child: ListView(
                  // Important: Remove any padding from the ListView.
                  padding: EdgeInsets.zero,
                  children: <Widget>[
                    UserAccountsDrawerHeader(
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey,
                            blurRadius:
                                30.0, // has the effect of softening the shadow
                            spreadRadius:
                                5.0, // has the effect of extending the shadow
                            offset: Offset(
                              10.0, // horizontal, move right 10
                              10.0, // vertical, move down 10
                            ),
                          )
                        ],
                        borderRadius: new BorderRadius.only(
                          bottomLeft: new Radius.circular(20.0),
                          bottomRight: new Radius.circular(20.0),
                        ),
                        color: Colors.white,
                      ),
                      accountName: Text(
                        'Mahendra',
                        style: TextStyle(color: Colors.black),
                      ),
                      accountEmail: Text(
                        'mahendra@gmail.com',
                        style: TextStyle(color: Colors.black),
                      ),
                      currentAccountPicture: CircleAvatar(
                        radius: 10.0,
                        backgroundColor: Colors.white,
                        backgroundImage: AssetImage('assets/dude.jpg'),
                      ),
                    ),
                    DrawerItem(
                      icon: Icons.home,
                      text: 'Home',
                      onTap: () {
                        if (ModalRoute.of(context).settings.name ==
                            'home_screen') {
                          Navigator.pop(context);
                        } else {
                          navegationTo(context: context, page: HomeScreen.id);
                        }
                      },
                    ),
                    DrawerItem(
                      icon: Icons.person,
                      text: 'Profile',
                      onTap: () {
                        if (ModalRoute.of(context).settings.name ==
                            'profile_screen') {
                          Navigator.pop(context);
                        } else {
                          navegationTo(
                              context: context, page: ProfileScreen.id);
                        }
                      },
                    ),
                  ],
                ),
              ),
              DrawerItem(
                icon: Icons.exit_to_app,
                text: 'Log Out',
                onTap: () {
                  Navigator.pop(context);

                  Navigator.pushNamedAndRemoveUntil(
                    context,
                    LoginScreen.id,
                    (r) => false,
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
