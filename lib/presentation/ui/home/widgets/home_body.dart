import 'package:easy_sidemenu/easy_sidemenu.dart';
import 'package:health_sync/core/extensions/extensions.dart';
import 'package:health_sync/presentation/themes/colors.dart';
import 'package:health_sync/presentation/ui/home/widgets/dash_board_view.dart';
import 'package:health_sync/presentation/ui/home/widgets/doctors_view.dart';
import 'package:health_sync/presentation/ui/home/widgets/patients_view.dart';
import 'package:health_sync/presentation/ui/home/widgets/profile_view.dart';
import 'package:health_sync/presentation/ui/home/widgets/reports_view.dart';

import '../../../../core/common/common_imports.dart';
import 'clinics_view.dart';

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
    PatientsView(),
    ClinicsView(),
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
              icon: Icon(Icons.dashboard),
              title: context.locale.dashboard,
              onTap: (index, _) => sideMenuController.changePage(index),
            ),
            SideMenuItem(
              title: context.locale.doctors,
              onTap: (index, _) => sideMenuController.changePage(index),
            ),
            SideMenuItem(
              title: context.locale.patients,
              onTap: (index, _) => sideMenuController.changePage(index),
            ),
            SideMenuItem(
              icon: Icon(Icons.local_hospital),
              title: context.locale.clinics,
              onTap: (index, _) => sideMenuController.changePage(index),
            ),
            SideMenuItem(
              icon: Icon(Icons.bar_chart),
              title: context.locale.reports,
              onTap: (index, _) => sideMenuController.changePage(index),
            ),
            SideMenuItem(
              icon: Icon(Icons.person),
              title: context.locale.profile,
              onTap: (index, _) => sideMenuController.changePage(index),
            ),
            SideMenuItem(
              icon: Icon(Icons.logout),
              title: context.locale.logout,
              onTap: (_,_){

              }
            )
          ],
          controller: sideMenuController,
          title: Text("HealthSync"),
          style: SideMenuStyle(
            selectedIconColor: Theme.of(context).colorScheme.secondary,
            hoverColor: Colors.transparent,
            selectedTitleTextStyle: Theme.of(context).textTheme.labelLarge
                ?.copyWith(color: Theme.of(context).colorScheme.secondary),
            unselectedTitleTextStyle: Theme.of(context).textTheme.labelLarge
                ?.copyWith(color: Theme.of(context).colorScheme.onSecondary),
            backgroundColor: offWhite,
            selectedColor: Theme.of(context).colorScheme.primary,
          ),
        ),
        Expanded(
          child: PageView(controller: pageController, children: views),
        ),
      ],
    );
  }
}
