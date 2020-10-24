import 'package:get_it/get_it.dart';
import 'package:management_app_ui/utilities/analytics.dart';
GetIt locator=GetIt.instance;
void setUpLocator(){
  locator.registerLazySingleton(() => FirebaseAnalyticsPage());
  print("registered");
}