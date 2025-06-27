import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:health_sync/presentation/ui/patients/managers/patients_page_event.dart';
import 'package:health_sync/presentation/ui/patients/managers/patients_screen_state.dart';
import 'package:injectable/injectable.dart';


@injectable
class PatientsPageViewModel extends Cubit<PatientsPageState>{
  PatientsPageViewModel() : super(PatientsPageInitialState());

  void onEvent(PatientsPageEvent event) {
    switch (event) {
      // Handle events here
    }
  }
}