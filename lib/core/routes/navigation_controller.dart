import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:health_sync/core/routes/pages_route.dart';
import 'package:health_sync/presentation/ui/login/screen/login_screen.dart';

class NavigationController {
  NavigationController._();

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case PagesRoutes.loginPage:
        return _handleMaterialPageRoute(
          widget: LoginScreen(),
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
