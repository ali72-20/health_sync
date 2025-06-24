

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:health_sync/presentation/ui/home/managers/home_screen_events.dart';
import 'package:health_sync/presentation/ui/home/managers/home_screen_states.dart';
import 'package:injectable/injectable.dart';


@injectable
class HomeScreenViewModel extends Cubit<HomeScreenState>{
  HomeScreenViewModel() : super(HomeScreenInitialState());
  onEvent(HomeScreenEvent event){
    switch (event) {

    }
  }
}