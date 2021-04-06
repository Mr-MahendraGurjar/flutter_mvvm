
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mvvm_provider/locator.dart';
import 'package:flutter_mvvm_provider/screens/home/home_screen.dart';
import 'package:flutter_mvvm_provider/screens/login/login_screen.dart';
import 'package:flutter_mvvm_provider/screens/profile/profile_screen.dart';
import 'package:flutter_mvvm_provider/stores/user_store.dart';
import 'package:provider/provider.dart';

import 'constant.dart';


void main() async {
  setupLocator();
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => UserStore()),
      ],
      child: MaterialApp(
        localizationsDelegates: [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: [
          const Locale('en'), // English
        ],
        routes: {
          LoginScreen.id: (context) => LoginScreen(),
          HomeScreen.id: (context) => HomeScreen(),
          ProfileScreen.id: (context) => ProfileScreen(),
        },
        title: kAppTitle,
        theme: defaultThemeData,
        onGenerateRoute: (RouteSettings settings) {
          // switch (settings.name) {
          //   case '/':
          //   case BookingScreen.id:
          //     return MaterialPageRoute(builder: (_) {
          //       return _isAuthenticated
          //           ? acess == '3' ? AdminScreen() :
          //           ? RedirectUserType()
          //           : LoginScreen();
          //     });
          //   case LoginScreen.id:
          return MaterialPageRoute(builder: (_) => LoginScreen());
        },
      ),
    );
  }
}
