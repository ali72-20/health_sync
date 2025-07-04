
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:health_sync/core/api_result/ApiResult.dart';
import 'package:health_sync/domain/entities/auth/register_request_entity.dart';
import 'package:health_sync/domain/use_cases/auth/register_use_case.dart';
import 'package:health_sync/presentation/ui/register/manager/register_page_event.dart';
import 'package:health_sync/presentation/ui/register/manager/register_page_state.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/common/common_imports.dart';

@injectable
class RegisterPageViewModel extends Cubit<RegisterPageState>{
  final RegisterUseCase _registerUseCase;



  RegisterPageViewModel(this._registerUseCase) : super(RegisterPageInitialState());


  _register(RegisterRequestEntity entity, GlobalKey<FormState> key) async{
    if(key.currentState!.validate() == false){
      return;
    }
    emit(RegisterPageOnLoadingState());

    final response = await _registerUseCase.register(entity);
    switch (response) {
      case OnSuccess<void>():
        emit(RegisterPageOnSuccessState());
      case OnFailure<void>():
        emit(RegisterPageOnErrorState());
    }
  }


  onEvent(RegisterPageEvent event){
    switch (event) {
      case RegisterEvent(): _register(event.entity ,event.key);
    }
  }
}