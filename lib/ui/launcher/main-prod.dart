import 'dart:async';

import 'package:BaseApp/locator/locator.dart';
import 'package:BaseApp/ui/launcher/main_app.dart';
import 'package:core/core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared/shared.dart';
import 'app_config.dart';
import 'launcher.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

void main() async {
  /// BlocSupervisor oversees Blocs and delegates to BlocDelegate.
  /// We can set the BlocSupervisor's delegate to an instance of `SimpleBlocDelegate`.
  /// This will allow us to handle all transitions and errors in SimpleBlocDelegate.
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = AppBlocObserver(HydratedBloc.storage = await HydratedStorage.build());

  Config.appFlavor = Flavor.RELEASE;

  setupLocator();

  FirebasePushNotificationService().initialize();

  var _isDark;
  await ThemeHelper().getTheme().then((value) => _isDark = value);

  runZonedGuarded(() {
    runApp(
      CustomTheme(
        initialThemeKey: _isDark ? ThemesKeys.DARK : ThemesKeys.LIGHT,
        child: MainApp(),
      ),
    );
  }, (error, stackTrace) {
    // FirebaseCrashlytics.instance.recordError(error, stackTrace);
  });
}