import 'package:flutter/material.dart';
import 'package:flutter_mvvm_provider/core/view_models/login_viewmodel.dart';
import 'package:flutter_mvvm_provider/screens/base_view.dart';
import 'package:flutter_mvvm_provider/screens/login/login_form.dart';

class LoginScreen extends StatelessWidget {
  static const String id = 'sign_screen';

  LoginScreen({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<LoginViewModel>(
        onViewModelReady: (model) =>
            model.setContextLoginViewModel(context: context),
        builder: (context, model, _) => Scaffold(
              body: Stack(
                children: <Widget>[
                  Image.asset(
                    'assets/background-default.jpg',
                    fit: BoxFit.cover,
                    height: double.infinity,
                    width: double.infinity,
                    alignment: Alignment.center,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 30, bottom: 30),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(right: 20, left: 20),
                          child: Hero(
                            tag: 'logo',
                            child: Image.asset(
                              'assets/icons/flutter_icon.png',
                            ),
                          ),
                        ),
                        LoginForm(),
                        Image.asset(
                          'assets/icons/dart_generic.png',
                          height: 80,
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ));
  }
}
