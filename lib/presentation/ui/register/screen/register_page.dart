import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:health_sync/di/di.dart';
import 'package:health_sync/presentation/ui/register/manager/register_page_state.dart';
import 'package:health_sync/presentation/ui/register/manager/register_page_view_model.dart';
import 'package:health_sync/presentation/ui/register/screen/register_page_body.dart';

import '../../../../core/common/common_imports.dart';

class RegisterPage extends StatelessWidget {
  RegisterPage({super.key});

  final viewModel = getIt<RegisterPageViewModel>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
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
          listener: (context, state) {},
        ),
      )
    ,
    );
  }
}
