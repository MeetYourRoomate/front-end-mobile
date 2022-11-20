import 'package:get_it/get_it.dart';
import 'package:meet_your_roommate_app/iam/application/user_service.dart';
import 'package:meet_your_roommate_app/iam/infraestructure/data/api/user_data_source.dart';
import 'package:meet_your_roommate_app/iam/infraestructure/repositories/user_repository.dart';

final GetIt locator = GetIt.instance;

initIjectable() {
  locator.registerFactory<UserDataSource>(() => UserDataSource());
  locator.registerFactory<UserRepository>(() => UserRepository(locator.get()));
  locator.registerFactory<UserService>(() => UserService(locator.get()));
}
