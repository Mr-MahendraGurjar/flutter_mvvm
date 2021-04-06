
import 'package:flutter/material.dart';
import 'package:flutter_mvvm_provider/screens/profile/widgets/profile_card.dart';
import 'package:flutter_mvvm_provider/sharedWidgets/default_scaffold.dart';

class ProfileScreen extends StatelessWidget {
  static const id = 'profile_screen';
  @override
  Widget build(BuildContext context) {

    return DefaultScaffold(
      body: Center(child: ProfileCard()),
    );
  }
}
