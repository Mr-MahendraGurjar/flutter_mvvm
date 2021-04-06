import 'package:flutter/widgets.dart';
import 'package:flutter_mvvm_provider/core/models/response_model.dart';
import 'package:flutter_mvvm_provider/core/models/user_model.dart';
import 'package:flutter_mvvm_provider/core/services/account_services.dart';
import 'package:flutter_mvvm_provider/core/services/storage_service.dart';
import 'package:flutter_mvvm_provider/core/view_models/base_viewmodel.dart';
import 'package:flutter_mvvm_provider/enums.dart';
import 'package:flutter_mvvm_provider/locator.dart';
import 'package:flutter_mvvm_provider/screens/home/home_screen.dart';
import 'package:flutter_mvvm_provider/stores/user_store.dart';
import 'package:flutter_mvvm_provider/utils/navigation.dart';
import 'package:flutter_mvvm_provider/utils/response_message.dart';
import 'package:provider/provider.dart';

class LoginViewModel extends BaseViewModel {
  String email = 'vitor.iassia@innovareti.com.br';
  String password = 'password';
  AccountService _accountService = AccountService();
  StorageService _service = locator<StorageService>();
  BuildContext _contextOfLoginViewModel;
  @override
  Future<List> loadData() async {
    return null;
  }

  Future<void> validationForm() async {
    if (this.email == "" || this.password == "")
      responseMessage(
          'Invalid Email or Password', 'error', _contextOfLoginViewModel);
    else
      _login();
  }

  Future<void> _login() async {
    setState(ViewState.busy);
    ResponseModel user = await _accountService.loginAccount(email, password);
    if (user.status) {
      await _setupUser(user, _contextOfLoginViewModel);
      navegationTowithAnimationRemoveUtils(
          context: this._contextOfLoginViewModel, page: HomeScreen());
    } else {
      responseMessage(user.data, 'error', _contextOfLoginViewModel);
    }
    setState(ViewState.idle);
  }

  Future<void> _setupUser(ResponseModel user, context) async {
    UserModel newUserModel = user.data;
    Provider.of<UserStore>(context, listen: false).setUser(newUserModel);
    await _service.addstorage('id', newUserModel.id.toString());
    await _service.addstorage('access_token', newUserModel.token.toString());
  }

  setContextLoginViewModel({@required BuildContext context}) =>
      _contextOfLoginViewModel = context;
}
