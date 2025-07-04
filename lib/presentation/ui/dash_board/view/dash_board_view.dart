import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:health_sync/presentation/ui/dash_board/manager/dash_board_page_state.dart';
import 'package:health_sync/presentation/ui/dash_board/manager/dash_board_page_view_model.dart';
import 'package:health_sync/presentation/ui/dash_board/view/dash_board_body.dart';

import '../../../../core/common/common_imports.dart';
import '../../../../di/di.dart';

class DashBoardView extends StatelessWidget {
  DashBoardView({super.key});

  final viewModel = getIt.get<DashBoardPageViewModel>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => viewModel,
      child: BlocConsumer<DashBoardPageViewModel, DashBoardPageState>(
        builder: (context, state) {
          return AdminDashboardScreen();
        },
        listener: (context, state) {},
      ),
    );
  }
}
