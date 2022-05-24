import 'package:antonx/core/services/auth_service.dart';
import 'package:antonx/core/services/database_service.dart';
import 'package:get_it/get_it.dart';

GetIt locator = GetIt.asNewInstance();

setuplocator(){
  locator.registerSingleton(DataBaseServices());
  locator.registerSingleton(AuthResult());
}