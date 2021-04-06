

import 'package:flutter_mvvm_provider/core/services/storage_service.dart';
import 'package:flutter_mvvm_provider/core/view_models/login_viewmodel.dart';
import 'package:get_it/get_it.dart';

import 'core/services/api.dart';

GetIt locator = GetIt.instance;
void setupLocator() {
  locator.registerFactory(() => LoginViewModel());
 // locator.registerLazySingleton(() => Api());
  locator.registerLazySingleton(() => StorageService());
}
