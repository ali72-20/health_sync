


import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:health_sync/presentation/ui/dash_board/manager/dash_board_page_state.dart';
import 'package:injectable/injectable.dart';

import 'dash_board_page_event.dart';

@injectable
class DashBoardPageViewModel extends Cubit<DashBoardPageState>{
  DashBoardPageViewModel() : super(DashBoardPageInitialState());

  void onEvent(DashBoardPageEvent event) {
    switch (event) {
      // Handle events here
    }
  }
}