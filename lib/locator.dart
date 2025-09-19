import 'package:get_it/get_it.dart';
import 'package:tortoise_assignment/application/product/product_bloc.dart';
import 'package:tortoise_assignment/config.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => Config());
  // locator.registerLazySingleton(() => DataSourceExceptionHandler());
  locator.registerLazySingleton(() => ProductBloc());
}
