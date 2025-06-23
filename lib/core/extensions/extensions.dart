

import 'package:flutter/cupertino.dart';
import 'package:health_sync/core/localization/app_localizations.dart';

extension Context on BuildContext{
  double get height => MediaQuery.of(this).size.height;
  double get width => MediaQuery.of(this).size.width;
}

extension Localization on BuildContext {
  AppLocalizations get locale => AppLocalizations.of(this)!;
}

