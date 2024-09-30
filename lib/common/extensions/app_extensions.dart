import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import '../../main.dart';
import '../routes/app_navigation.dart';

extension AppExtension on MovieAppSample {
  Map<String, WidgetBuilder> get appRoutes => AppNavigation().routes;
}

void runCatching(Function exec, {Function? onError}) {
  try {
    exec();
  } catch (e) {
    onError?.call(e);
  }
}

void closeApp() {
  if (Platform.isIOS) {
    exit(0);
  } else {
    SystemNavigator.pop();
  }
}
