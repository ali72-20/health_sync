import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:health_sync/core/routes/pages_route.dart';
import 'package:health_sync/di/di.dart';
import 'package:health_sync/main.dart';
import 'package:health_sync/presentation/ui/core/base_managers/base_ui_state.dart';
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
      child: Scaffold(
        body: BlocProvider(
          create: (_) => viewModel,
          child: BlocConsumer<LoginScreenViewModel, LoginScreenStates>(
            builder: (context, state) {
              if (state is OnLoadingState) {
                return const Center(child: CircularProgressIndicator());
              }
              return LoginScreenBody();
            },
            listener: (context, state) {
              if (state is NavigateToRegisterState) {
                navKey.currentState?.pushNamed(
                  PagesRoutes.registerPage,
                );
              }
              else if(state is LoginScreenOnSuccessState) {
                navKey.currentState?.pushReplacementNamed(
                  PagesRoutes.homePage,
                );
              }
              else if (state is LoginScreenOnErrorState) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text("login Error"),
                    backgroundColor: Theme.of(context).colorScheme.error,
                  ),
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
