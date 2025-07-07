import 'package:easy_sidemenu/easy_sidemenu.dart';
import 'package:health_sync/core/extensions/extensions.dart';
import 'package:health_sync/presentation/themes/colors.dart';
import 'package:health_sync/presentation/ui/clinics/view/clinic_details_page.dart';
import 'package:health_sync/presentation/ui/clinics/view/clinics_search_result_view.dart';
import 'package:health_sync/presentation/ui/dash_board/view/dash_board_view.dart';
import 'package:health_sync/presentation/ui/doctors/view/doctor_details.dart';
import 'package:health_sync/presentation/ui/doctors/view/doctors_search_result.dart';
import 'package:health_sync/presentation/ui/doctors/view/doctors_view.dart';
import 'package:health_sync/presentation/ui/patients/view/patients_view.dart';
import 'package:health_sync/presentation/ui/profile/view/profile_view.dart';
import 'package:health_sync/presentation/ui/reports/view/reports_view.dart';

import '../../../../core/common/common_imports.dart';
import '../../clinics/view/clinics_view.dart';

class HomeBody extends StatefulWidget {
  final Widget currentView;

  const HomeBody({super.key, required this.currentView});

  @override
  State<HomeBody> createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  PageController pageController = PageController();

  SideMenuController sideMenuController = SideMenuController();

  @override
  void initState() {
    super.initState();
    sideMenuController.addListener((index) {
      pageController.jumpToPage(index);
    });
  }

  List<Widget> views = [
    DashBoardView(),
    DoctorsView(),
    ClinicSearchResultsPage(),
    ClinicsScreen(),
    ReportsView(),
    ProfileView(),
  ];

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SideMenu(
          items: [
            SideMenuItem(
              icon: const Icon(Icons.dashboard),
              title: context.locale.dashboard,
              onTap: (index, _) => sideMenuController.changePage(index),
            ),
            // MODIFIED: Icon added for Doctors
            SideMenuItem(
              icon: const Icon(Icons.medical_services),
              title: context.locale.doctors,
              onTap: (index, _) => sideMenuController.changePage(index),
            ),
            // MODIFIED: Icon added for Patients
            SideMenuItem(
              icon: const Icon(Icons.local_hospital),
              title: context.locale.clinics,
              onTap: (index, _) => sideMenuController.changePage(index),
            ),
            SideMenuItem(
              icon: const Icon(Icons.bar_chart),
              title: context.locale.reports,
              onTap: (index, _) => sideMenuController.changePage(index),
            ),
            SideMenuItem(
              icon: const Icon(Icons.person),
              title: context.locale.profile,
              onTap: (index, _) => sideMenuController.changePage(index),
            ),
          ],
          controller: sideMenuController,
          title: const Text("HealthSync"), // Added const for performance
          style: SideMenuStyle(
            selectedIconColor: Theme.of(context).colorScheme.secondary,
            hoverColor: Colors.transparent,
            selectedTitleTextStyle: Theme.of(context)
                .textTheme
                .labelLarge
                ?.copyWith(color: Theme.of(context).colorScheme.secondary),
            unselectedTitleTextStyle: Theme.of(context)
                .textTheme
                .labelLarge
                ?.copyWith(color: Theme.of(context).colorScheme.onSecondary),
            backgroundColor: offWhite,
            selectedColor: Theme.of(context).colorScheme.primary,
          ),
        ),
        Expanded(
          child: PageView(
            controller: pageController,
            children: views,
            // It's a good idea to disable swiping if navigation is only through the menu
            physics: const NeverScrollableScrollPhysics(),
          ),
        ),
      ],
    );
  }
}
