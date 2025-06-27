import 'package:easy_sidemenu/easy_sidemenu.dart';
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
              title: "Dashboard",
              onTap: (index, _) => sideMenuController.changePage(index),
            ),
            SideMenuItem(
              title: "Doctors",
              onTap: (index, _) => sideMenuController.changePage(index),
            ),
            SideMenuItem(
              title: "Patients",
              onTap: (index, _) => sideMenuController.changePage(index),
            ),
            SideMenuItem(
              title: "Clinics",
              onTap: (index, _) => sideMenuController.changePage(index),
            ),
            SideMenuItem(
              title: "Reports",
              onTap: (index, _) => sideMenuController.changePage(index),
            ),
            SideMenuItem(
              title: "Profile",
              onTap: (index, _) => sideMenuController.changePage(index),
            ),
          ],
          controller: sideMenuController,
          title: Text("HealthSync"),
          style: SideMenuStyle(
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
