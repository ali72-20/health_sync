

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:health_sync/core/api_result/ApiResult.dart';
import 'package:health_sync/domain/entities/auth/user_entity.dart';
import 'package:health_sync/domain/use_cases/auth/get_user_profile_use_case.dart';
import 'package:health_sync/presentation/ui/profile/managers/profile_page_event.dart';
import 'package:health_sync/presentation/ui/profile/managers/profile_page_state.dart';
import 'package:injectable/injectable.dart';

@injectable
class ProfilePageViewModel extends Cubit<ProfilePageState>{
  final GetUserProfileUseCase _getUserProfileUseCase;
  ProfilePageViewModel(this._getUserProfileUseCase) : super(ProfilePageInitialState());



  _getUserProfile() async {
    emit(ProfilePageOnLoadingState());
    final response = await _getUserProfileUseCase.getUserProfile();
    switch (response) {
      case OnSuccess<UserEntity>():
        emit(ProfilePageOnSuccessState(userEntity: response.data!));
      case OnFailure<UserEntity>():
        emit(ProfilePageOnErrorState(exception: response.exception!));
    }
  }
  onEven(ProfilePageEvent event){
    switch (event) {
      case GetUserProfileEvent(): _getUserProfile();
    }
  }
}