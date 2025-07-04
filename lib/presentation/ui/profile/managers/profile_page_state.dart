
import 'package:health_sync/domain/entities/auth/user_entity.dart';

abstract class ProfilePageState {}
final class ProfilePageInitialState extends ProfilePageState {}
final class ProfilePageOnLoadingState extends ProfilePageState {}
final class ProfilePageOnSuccessState extends ProfilePageState {
  UserEntity userEntity;

  ProfilePageOnSuccessState({required this.userEntity});
}

final class ProfilePageOnErrorState extends ProfilePageState {
  Exception exception;

  ProfilePageOnErrorState({required this.exception});
}