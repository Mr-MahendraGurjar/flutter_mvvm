import 'package:flutter/widgets.dart';
import 'package:flutter_mvvm_provider/enums.dart';

abstract class BaseViewModel extends ChangeNotifier {
  ViewState _state = ViewState.idle;
  ViewState get state => _state;
  void setState(ViewState viewState) {
    _state = viewState;
    try {
      notifyListeners();
    } catch (e) {
      print(e);
    }
  }

  Future<List<dynamic>> loadData();
}
