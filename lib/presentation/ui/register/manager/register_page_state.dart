import 'package:health_sync/presentation/ui/core/base_managers/base_ui_state.dart';

abstract class RegisterPageState extends BaseUIState{}


final class RegisterPageInitialState extends RegisterPageState {}

final class RegisterPageOnLoadingState extends RegisterPageState{}
final class RegisterPageOnSuccessState extends RegisterPageState {}
final class RegisterPageOnErrorState extends RegisterPageState {}