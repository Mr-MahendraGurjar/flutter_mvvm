import 'package:flutter/material.dart';
import 'package:flutter_mvvm_provider/screens/home/widgets/home_card.dart';
import 'package:flutter_mvvm_provider/sharedWidgets/default_scaffold.dart';

class HomeScreen extends StatelessWidget {
  static const id = 'home_screen';
  @override
  Widget build(BuildContext context) {
    //var store = Provider.of<UserStore>(context);

    return DefaultScaffold(
      body: Center(child: HomeCard()),
    );
  }
}
