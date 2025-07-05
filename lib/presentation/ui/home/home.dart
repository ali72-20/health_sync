import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:health_sync/di/di.dart';
import 'package:health_sync/presentation/ui/doctors/managers/doctors_page_view_model.dart';
import 'package:health_sync/presentation/ui/home/managers/home_screen_states.dart';
import 'package:health_sync/presentation/ui/home/managers/home_screen_view_model.dart';
import 'package:health_sync/presentation/ui/dash_board/view/dash_board_view.dart';
import 'package:health_sync/presentation/ui/home/widgets/home_body.dart';

import '../../../core/common/common_imports.dart';
import '../dash_board/manager/dash_board_page_view_model.dart';
import '../profile/managers/profile_page_view_model.dart';

class Home extends StatelessWidget {
  Home({super.key});

  final viewModel = getIt.get<HomeScreenViewModel>();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<HomeScreenViewModel>(create: (_) => viewModel),
        BlocProvider<DashBoardPageViewModel>(
          create: (_) => getIt.get<DashBoardPageViewModel>(),
        ),
        BlocProvider<ProfilePageViewModel>(
          create: (_) => getIt.get<ProfilePageViewModel>(),
        ),
        BlocProvider<DoctorsPageViewModel>(
          create: (_) => getIt.get<DoctorsPageViewModel>(),
        ),
      ],
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
