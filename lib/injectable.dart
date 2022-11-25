import 'package:get_it/get_it.dart';
import 'package:meet_your_roommate_app/iam/application/user_service.dart';
import 'package:meet_your_roommate_app/iam/infraestructure/data/api/user_data_source.dart';
import 'package:meet_your_roommate_app/iam/infraestructure/repositories/user_repository.dart';
import 'package:meet_your_roommate_app/profile/application/user_profile_service.dart';
import 'package:meet_your_roommate_app/profile/infraestructure/data/api/user_profile_data_source.dart';
import 'package:meet_your_roommate_app/profile/infraestructure/repositories/user_profile_repository.dart';
import 'package:meet_your_roommate_app/rental_life_cycle/application/property_asset_service.dart';
import 'package:meet_your_roommate_app/rental_life_cycle/application/property_feature_service.dart';
import 'package:meet_your_roommate_app/rental_life_cycle/application/property_service.dart';
import 'package:meet_your_roommate_app/rental_life_cycle/application/rental_offer_service.dart';
import 'package:meet_your_roommate_app/rental_life_cycle/application/rental_request_service.dart';
import 'package:meet_your_roommate_app/rental_life_cycle/infrastructure/data/api/property_asset_data_source.dart';
import 'package:meet_your_roommate_app/rental_life_cycle/infrastructure/data/api/property_data_source.dart';
import 'package:meet_your_roommate_app/rental_life_cycle/infrastructure/data/api/property_feature_data_source.dart';
import 'package:meet_your_roommate_app/rental_life_cycle/infrastructure/data/api/rental_offer_data_source.dart';
import 'package:meet_your_roommate_app/rental_life_cycle/infrastructure/data/api/rental_request_data_source.dart';
import 'package:meet_your_roommate_app/rental_life_cycle/infrastructure/repositories/property_asset_repository.dart';
import 'package:meet_your_roommate_app/rental_life_cycle/infrastructure/repositories/property_feature_repository.dart';
import 'package:meet_your_roommate_app/rental_life_cycle/infrastructure/repositories/property_repository.dart';
import 'package:meet_your_roommate_app/rental_life_cycle/infrastructure/repositories/rental_offer_repository.dart';
import 'package:meet_your_roommate_app/rental_life_cycle/infrastructure/repositories/rental_request_repository.dart';
import 'package:meet_your_roommate_app/user_matching/application/duty_service.dart';
import 'package:meet_your_roommate_app/user_matching/application/roommate_request_service.dart';
import 'package:meet_your_roommate_app/user_matching/application/team_request_service.dart';
import 'package:meet_your_roommate_app/user_matching/application/team_service.dart';
import 'package:meet_your_roommate_app/user_matching/infraestructure/data/api/duty_data_source.dart';
import 'package:meet_your_roommate_app/user_matching/infraestructure/data/api/roommate_request_data_source.dart';
import 'package:meet_your_roommate_app/user_matching/infraestructure/data/api/team_data_source.dart';
import 'package:meet_your_roommate_app/user_matching/infraestructure/data/api/team_request_data_source.dart';
import 'package:meet_your_roommate_app/user_matching/infraestructure/repositories/duty_repository.dart';
import 'package:meet_your_roommate_app/user_matching/infraestructure/repositories/roommate_request_repository.dart';
import 'package:meet_your_roommate_app/user_matching/infraestructure/repositories/team_repository.dart';
import 'package:meet_your_roommate_app/user_matching/infraestructure/repositories/team_request_repository.dart';

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

  //property Feature

  locator.registerFactory<PropertyFeatureDataSource>(
      () => PropertyFeatureDataSource());
  locator.registerFactory<PropertyFeatureRepository>(
      () => PropertyFeatureRepository(locator.get()));
  locator.registerFactory<PropertyFeatureService>(
      () => PropertyFeatureService(locator.get()));

  // Roommate request

  locator.registerFactory<RoomateRequestDataSource>(
      () => RoomateRequestDataSource());
  locator.registerFactory<RoomateRequestRepository>(
      () => RoomateRequestRepository(locator.get()));
  locator.registerFactory<RoommateRequestService>(
      () => RoommateRequestService(locator.get()));

  // duties
  locator.registerFactory<DutyDataSource>(() => DutyDataSource());
  locator.registerFactory<DutyRepository>(() => DutyRepository(locator.get()));
  locator.registerFactory<DutyService>(() => DutyService(locator.get()));

  //teams

  locator.registerFactory<TeamDataSource>(() => TeamDataSource());
  locator.registerFactory<TeamRepository>(() => TeamRepository(locator.get()));
  locator.registerFactory<TeamService>(() => TeamService(locator.get()));

  // TeamRequest

  locator.registerFactory<TeamRequestDataSource>(() => TeamRequestDataSource());
  locator.registerFactory<TeamRequestRepository>(
      () => TeamRequestRepository(locator.get()));
  locator.registerFactory<TeamRequestService>(
      () => TeamRequestService(locator.get()));
}
