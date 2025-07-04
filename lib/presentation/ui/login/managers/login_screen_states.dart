import 'package:health_sync/presentation/ui/core/base_managers/base_ui_state.dart';

abstract class LoginScreenStates {}

final class LoginScreenInitialState extends LoginScreenStates{}
final class LoginScreenOnLoadingState extends LoginScreenStates{}
final class LoginScreenOnSuccessState extends LoginScreenStates {}
final class LoginScreenOnErrorState extends LoginScreenStates {}

