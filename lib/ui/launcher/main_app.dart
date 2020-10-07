import 'package:core/core.dart';
import 'package:get/get.dart';
import 'launcher.dart';
import 'package:shared/shared.dart';

class MainApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => MainAppState();

}

class MainAppState extends State<MainApp> with BaseView{

  @override
  void initState() {
    super.initState();
    RestManager.initAPIManager(context);
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: Config.title,
      popGesture: Get.isPopGestureEnable,
      debugShowCheckedModeBanner: Config.isDebug,
      theme: CustomTheme.of(context),
      initialRoute: RoutName.splashScreen,
      getPages: RouterConfig.page,
      onGenerateRoute: RouterConfig().generateRoute,
      navigatorKey: RestManager.alice.getNavigatorKey(),
      navigatorObservers: [analytics.getAnalyticsObserver()],
      onUnknownRoute: (settings) => MaterialPageRoute(
          builder: (context) => UndefinedScreen(name: settings.name,)
      ),
    );
  }
}