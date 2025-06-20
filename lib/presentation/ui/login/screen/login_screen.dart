import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:health_sync/di/di.dart';
import 'package:health_sync/presentation/ui/login/managers/login_screen_states.dart';
import 'package:health_sync/presentation/ui/login/managers/login_screen_view_model.dart';
import 'package:health_sync/presentation/ui/login/managers/login_text_controllers_manager.dart';
import 'package:health_sync/presentation/ui/login/screen/login_screen_body.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final viewModel = getIt<LoginScreenViewModel>();
  final controllerManager = getIt<LoginTextControllerManager>();

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider<LoginTextControllerManager>(
      create: (_) => controllerManager,
      dispose: (_) => controllerManager.dispose(),
      child: BlocProvider(
        create: (_) => viewModel,
        child: BlocConsumer<LoginScreenViewModel, LoginScreenStates>(
          builder: (context, state) {
            return LoginScreenBody();
          },
          listener: (context, state) {},
        ),
      ),
    );
  }
}
