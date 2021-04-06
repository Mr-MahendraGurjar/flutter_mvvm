

import 'package:flutter_mvvm_provider/core/models/response_model.dart';
import 'package:flutter_mvvm_provider/core/models/user_model.dart';

class AccountService {
  //final Api _api = locator<Api>();

  Future<ResponseModel> loginAccount(email, password) async {
    await Future.delayed(Duration(seconds: 3));
    return ResponseModel(
      data: UserModel(
          id: 1, name: 'Mahendra', email: 'mahendra@gmail.com'),
      status: true,
    );
  }
}
