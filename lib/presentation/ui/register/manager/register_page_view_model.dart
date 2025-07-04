
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:health_sync/domain/use_cases/auth/register_use_case.dart';
import 'package:health_sync/presentation/ui/register/manager/register_page_event.dart';
import 'package:health_sync/presentation/ui/register/manager/register_page_state.dart';
import 'package:injectable/injectable.dart';

@injectable
class RegisterPageViewModel extends Cubit<RegisterPageState>{
  final RegisterUseCase _registerUseCase;



  RegisterPageViewModel(this._registerUseCase) : super(RegisterPageInitialState());


  _register(){

  }


  onEvent(RegisterPageEvent event){
    switch (event) {
      case RegisterEvent(): _register();
    }
  }
}