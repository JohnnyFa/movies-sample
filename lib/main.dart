import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:movies_flutter_sample/common/di/setup_locator.dart';
import 'package:movies_flutter_sample/common/extensions/app_extensions.dart';
import 'package:overlay_support/overlay_support.dart';
import 'common/routes/path/app_route_path.dart';
import 'common/routes/route_observer.dart';
import 'common/services/navigator_service.dart';

void main() async {
  await dotenv.load(fileName: '.env');
  setupLocator();
  await getIt.allReady();
  runApp(const MovieAppSample());
}

class MovieAppSample extends StatelessWidget {
  const MovieAppSample({super.key});

  @override
  Widget build(BuildContext context) {
    return OverlaySupport(
      child: Builder(
        builder: (context) {
          return MediaQuery(
            data: MediaQuery.of(context).copyWith(textScaler: const TextScaler.linear(1.0)),
            child: MaterialApp(
              navigatorObservers: [
                routeObserver,
              ],
              onGenerateRoute: (settings) {
                final WidgetBuilder? widgetBuilder = appRoutes[settings.name];
                if (widgetBuilder == null) return null;
                return MaterialPageRoute(
                  builder: (context) => Container(
                    child: widgetBuilder(context),
                  ),
                  settings: settings,
                );
              },
              navigatorKey: NavigationService.navigationKey,
              initialRoute: AppRoutePath.homePage.path,
            ),
          );
        },
      ),
    );
  }
}
