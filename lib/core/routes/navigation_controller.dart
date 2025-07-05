import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:health_sync/core/routes/pages_route.dart';
import 'package:health_sync/presentation/ui/doctors/view/doctor_details.dart';
import 'package:health_sync/presentation/ui/home/home.dart';
import 'package:health_sync/presentation/ui/login/screen/login_screen.dart';
import 'package:health_sync/presentation/ui/register/screen/register_page.dart';

class NavigationController {
  NavigationController._();

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case PagesRoutes.loginPage:
        return _handleMaterialPageRoute(
          widget: LoginScreen(),
          settings: settings,
        );
      case PagesRoutes.homePage:
        return _handleMaterialPageRoute(widget: Home(), settings: settings);
      case PagesRoutes.registerPage:
        return _handleMaterialPageRoute(
          widget: RegisterPage(),
          settings: settings,
        );
      case PagesRoutes.doctorsDetailsPage:
        return _handleMaterialPageRoute(
          widget: DoctorDetailsView(),
          settings: settings,
        );
      default:
        return _handleMaterialPageRoute(
          widget: const Scaffold(body: Center(child: Text('Page not found'))),
          settings: settings,
        );
    }
  }

  static MaterialPageRoute<dynamic> _handleMaterialPageRoute({
    required Widget widget,
    required RouteSettings settings,
  }) {
    return MaterialPageRoute(builder: (context) => widget, settings: settings);
  }
}
