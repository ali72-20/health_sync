


import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:health_sync/presentation/ui/clinics/managers/clinics_page_state.dart';
import 'package:injectable/injectable.dart';

import 'clinics_page_event.dart';


@injectable
class ClinicsPageViewModel extends Cubit<ClinicsPageState>{
  ClinicsPageViewModel() : super(ClinicsPageInitialState());

  void onEvent(ClinicsPageEvent event) {
    switch (event) {
      // Handle events here
    }
  }
}