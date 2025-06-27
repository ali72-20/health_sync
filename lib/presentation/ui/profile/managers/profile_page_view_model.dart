

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:health_sync/presentation/ui/profile/managers/profile_page_event.dart';
import 'package:health_sync/presentation/ui/profile/managers/profile_page_state.dart';
import 'package:injectable/injectable.dart';

@injectable
class ProfilePageViewModel extends Cubit<ProfilePageState>{
  ProfilePageViewModel() : super(ProfilePageInitialState());



  onEven(ProfilePageEvent event){
    switch (event) {

    }
  }
}