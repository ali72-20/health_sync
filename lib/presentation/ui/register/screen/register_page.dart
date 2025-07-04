import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:health_sync/core/routes/pages_route.dart';
import 'package:health_sync/di/di.dart';
import 'package:health_sync/main.dart';
import 'package:health_sync/presentation/ui/register/manager/controller_manager.dart';
import 'package:health_sync/presentation/ui/register/manager/register_page_state.dart';
import 'package:health_sync/presentation/ui/register/manager/register_page_view_model.dart';
import 'package:health_sync/presentation/ui/register/screen/register_page_body.dart';

import '../../../../core/common/common_imports.dart';

class RegisterPage extends StatelessWidget {
  RegisterPage({super.key});

  final viewModel = getIt<RegisterPageViewModel>();
 final controllerManager = getIt<RegisterControllerManager>();
  @override
  Widget build(BuildContext context) {
    return RepositoryProvider<RegisterControllerManager>(
      create: (_)=> controllerManager,
      dispose: (_) => controllerManager.dispose(),
      child: BlocProvider(
        create: (_) => viewModel,
        child: Scaffold(
          body:  BlocConsumer<RegisterPageViewModel, RegisterPageState>(
            builder: (context, state) {
              if(state is RegisterPageOnLoadingState){
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              return RegisterPageBody();
            },
            listener: (context, state) {
              if(state is RegisterPageOnSuccessState){
                navKey.currentState!.pushReplacementNamed(PagesRoutes.homePage);
              }
              else if(state is RegisterPageOnErrorState){
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text("Register Error"),
                    backgroundColor: Theme.of(context).colorScheme.error,
                  ),
                );
              }
            },
          ),
        )
      ,
      ),
    );
  }
}
