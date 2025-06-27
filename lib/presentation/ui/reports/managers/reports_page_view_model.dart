


import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:health_sync/presentation/ui/reports/managers/reports_page_events.dart';
import 'package:health_sync/presentation/ui/reports/managers/reports_page_state.dart';
import 'package:injectable/injectable.dart';

@injectable
class ReportsScreeViewModel extends Cubit<ReportsPageState>{
  ReportsScreeViewModel() : super(ReportsPageInitialState());


  onEvent(ReportsPageEvent event) {
    switch (event) {

    }
  }
}