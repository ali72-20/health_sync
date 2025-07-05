import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:health_sync/main.dart';
import 'package:health_sync/presentation/ui/dash_board/manager/dash_board_page_state.dart';
import 'package:health_sync/presentation/ui/dash_board/manager/dash_board_page_view_model.dart';
import 'package:health_sync/presentation/ui/dash_board/view/dash_board_body.dart';

import '../../../../core/common/common_imports.dart';
import '../../../../core/routes/pages_route.dart';
import '../../../../di/di.dart';
import '../manager/dash_board_page_event.dart';

class DashBoardView extends StatefulWidget {
  const DashBoardView({super.key});

  @override
  State<DashBoardView> createState() => _DashBoardViewState();
}

class _DashBoardViewState extends State<DashBoardView> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<DashBoardPageViewModel>().onEvent(
      DashBoardPageGetInitialDataEvent(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DashBoardPageViewModel, DashBoardPageState>(
      builder: (context, state) {
        if (state is DashBoardPageOnLoadingState) {
          return const Center(child: CircularProgressIndicator());
        }
        if (state is DashBoardPageOnSuccessState) {
          return AdminDashboardScreen(
            activeClinics: state.activeClinics,
            activeDoctors: state.activeDoctors,
            activePatients: state.activePatients,
            pendingRequests: state.allPendingRequests,
          );
        }
        if (state is DashBoardPageOnErrorState) {
          return Center(child: Text(state.exception.toString()));
        }
        return AdminDashboardScreen();
      },
      listener: (context, state) {
        if (state is NavigateToDoctorDetailsPageState) {
          navKey.currentState!.pushNamed(
            PagesRoutes.doctorsDetailsPage,
            arguments: state.doctor,
          );
        }
      },
    );
  }
}
