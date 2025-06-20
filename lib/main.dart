import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:health_sync/core/providers/language_provider.dart';
import 'package:health_sync/core/providers/theme_provider.dart';
import 'package:health_sync/core/routes/navigation_controller.dart';
import 'package:health_sync/core/routes/pages_route.dart';
import 'package:health_sync/presentation/themes/theme.dart';
import 'package:provider/provider.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'core/localization/app_localizations.dart';
import 'core/localization/l10n.dart';
import 'di/di.dart';

void main() {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => getIt<ThemeProvider>()),
        ChangeNotifierProvider(create: (context) => getIt<LanguageProvider>())
      ],
      child: const HealthSync(),
    ),
  );
}

final GlobalKey<NavigatorState> navKey = GlobalKey<NavigatorState>();

class HealthSync extends StatelessWidget {
  const HealthSync({super.key});

  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<ThemeProvider>(context);
    var languageProvider = Provider.of<LanguageProvider>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: const[
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: L10n.all,
      theme: themeProvider.isLightTheme()
          ? AppTheme.lightTheme
          : AppTheme.darkTheme,
      navigatorKey: navKey,
      locale: Locale(languageProvider.currentLanguage),
      initialRoute: PagesRoutes.loginPage,
      onGenerateRoute: NavigationController.onGenerateRoute,
    );
  }
}
