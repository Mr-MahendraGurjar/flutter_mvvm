import 'package:flutter/material.dart';
import 'package:flutter_mvvm_provider/constant.dart';
import 'package:flutter_mvvm_provider/core/view_models/login_viewmodel.dart';
import 'package:flutter_mvvm_provider/enums.dart';
import 'package:flutter_mvvm_provider/sharedWidgets/busy_button.dart';
import 'package:provider/provider.dart';

class LoginForm extends StatelessWidget {
  static final id = 'sign.view';

  @override
  Widget build(BuildContext context) {
    return Consumer<LoginViewModel>(
      builder: (context, model, _) => Column(
        children: <Widget>[
          Form(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: <Widget>[
                  TextFormField(
                    initialValue: 'mahendra@gmail.com',
                    style: TextStyle(
                      color: Theme.of(context).accentColor,
                    ),
                    onChanged: (value) {
                      model.email = value;
                    },
                    cursorColor: Theme.of(context).accentColor,
                    decoration: inputDecotationBlack(labelText: 'E-mail'),
                    autovalidateMode: AutovalidateMode.disabled,
                    autocorrect: false,
                    validator: (value) =>
                        (value.isEmpty) ? "E-mail invalid" : null,
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  TextFormField(
                    initialValue: 'password',
                    style: TextStyle(
                      color: Theme.of(context).accentColor,
                    ),
                    cursorColor: Theme.of(context).accentColor,
                    decoration: inputDecotationBlack(labelText: 'Password'),
                    obscureText: true,
                    autocorrect: false,
                    onChanged: (value) {
                      model.password = value;
                    },
                    validator: (value) =>
                        (value.isEmpty) ? "password invalid" : null,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        BusyButton(
                          isOutline: false,
                          isBusy: model.state == ViewState.busy,
                          onPressed: () async => await model.validationForm(),
                        ),
                      ],
                    ),
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
