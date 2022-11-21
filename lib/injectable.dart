import 'package:get_it/get_it.dart';
import 'package:meet_your_roommate_app/iam/application/user_service.dart';
import 'package:meet_your_roommate_app/iam/infraestructure/data/api/user_data_source.dart';
import 'package:meet_your_roommate_app/iam/infraestructure/repositories/user_repository.dart';
import 'package:meet_your_roommate_app/profile/application/user_profile_service.dart';
import 'package:meet_your_roommate_app/profile/infraestructure/data/api/user_profile_data_source.dart';
import 'package:meet_your_roommate_app/profile/infraestructure/repositories/user_profile_repository.dart';
import 'package:meet_your_roommate_app/rental_life_cycle/application/property_asset_service.dart';
import 'package:meet_your_roommate_app/rental_life_cycle/application/property_service.dart';
import 'package:meet_your_roommate_app/rental_life_cycle/application/rental_offer_service.dart';
import 'package:meet_your_roommate_app/rental_life_cycle/application/rental_request_service.dart';
import 'package:meet_your_roommate_app/rental_life_cycle/infrastructure/data/api/property_asset_data_source.dart';
import 'package:meet_your_roommate_app/rental_life_cycle/infrastructure/data/api/property_data_source.dart';
import 'package:meet_your_roommate_app/rental_life_cycle/infrastructure/data/api/rental_offer_data_source.dart';
import 'package:meet_your_roommate_app/rental_life_cycle/infrastructure/data/api/rental_request_data_source.dart';
import 'package:meet_your_roommate_app/rental_life_cycle/infrastructure/repositories/property_asset_repository.dart';
import 'package:meet_your_roommate_app/rental_life_cycle/infrastructure/repositories/property_repository.dart';
import 'package:meet_your_roommate_app/rental_life_cycle/infrastructure/repositories/rental_offer_repository.dart';
import 'package:meet_your_roommate_app/rental_life_cycle/infrastructure/repositories/rental_request_repository.dart';

final GetIt locator = GetIt.instance;

initIjectable() {
  locator.registerFactory<UserDataSource>(() => UserDataSource());
  locator.registerFactory<UserRepository>(() => UserRepository(locator.get()));
  locator.registerFactory<UserService>(() => UserService(locator.get()));

  //profile

  locator.registerFactory<UserProfileDataSource>(() => UserProfileDataSource());
  locator.registerFactory<UserProfileRepository>(
      () => UserProfileRepository(locator.get()));
  locator.registerFactory<UserProfileService>(
      () => UserProfileService(locator.get()));

  //Property Assets

  locator.registerFactory<PropertyAssetDataSource>(
      () => PropertyAssetDataSource());
  locator.registerFactory<PropertyAssetRepository>(
      () => PropertyAssetRepository(locator.get()));
  locator.registerFactory<PropertyAssetService>(
      () => PropertyAssetService(locator.get()));

  // Property
  locator.registerFactory<PropertyDataSource>(() => PropertyDataSource());
  locator.registerFactory<PropertyRepository>(
      () => PropertyRepository(locator.get()));
  locator
      .registerFactory<PropertyService>(() => PropertyService(locator.get()));

  //Rental Offert
  locator.registerFactory<RentalOfferDataSource>(() => RentalOfferDataSource());
  locator.registerFactory<RentalOfferRepository>(
      () => RentalOfferRepository(locator.get()));
  locator.registerFactory<RentalOfferService>(
      () => RentalOfferService(locator.get()));

  //Rental  Request
  locator.registerFactory<RentalRequestDataSource>(
      () => RentalRequestDataSource());
  locator.registerFactory<RentalRequestRepository>(
      () => RentalRequestRepository(locator.get()));
  locator.registerFactory<RentalRequestService>(
      () => RentalRequestService(locator.get()));

  //
}
