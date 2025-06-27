import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:health_sync/di/di.dart';
import 'package:health_sync/presentation/ui/home/managers/home_screen_states.dart';
import 'package:health_sync/presentation/ui/home/managers/home_screen_view_model.dart';
import 'package:health_sync/presentation/ui/home/widgets/dash_board_view.dart';
import 'package:health_sync/presentation/ui/home/widgets/home_body.dart';

import '../../../core/common/common_imports.dart';

class Home extends StatelessWidget {
  Home({super.key});

  final viewModel = getIt.get<HomeScreenViewModel>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => viewModel,
      child: Scaffold(
        body: BlocConsumer<HomeScreenViewModel, HomeScreenState>(
          builder: (context, state) {
            return HomeBody(currentView: DashBoardView());
          },
          listener: (context, state) {},
        ),
      ),
    );
  }
}
