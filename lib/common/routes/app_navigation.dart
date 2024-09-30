import 'package:flutter/material.dart';
import 'package:movies_flutter_sample/common/routes/path/app_route_path.dart';
import '../../feat/imdb/ui/home_page.dart';
import 'base/feature_navigation.dart';

class AppNavigation extends FeatureNavigation {
  @override
  Map<String, WidgetBuilder> get routes => {AppRoutePath.homePage.path: (_) => const HomePage()};
}
