import 'dart:async';
import 'package:BaseApp/locator/locator.dart';
import 'package:BaseApp/ui/launcher/launcher.dart';
import 'package:get/route_manager.dart';
import 'package:package_info/package_info.dart';

class SplashScreen extends StatefulWidget {

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with BaseView {
  Future<String> _getVersion() async {
    final PackageInfo info = await PackageInfo.fromPlatform();
    return info.version;
  }

  _startSplashScreen() async {
    var _duration = Duration(seconds: 5);
    return Timer(_duration, _navigationPage);
  }

  void _navigationPage() {
    navigation.onIntentOffAll(RoutName.dashboardScreen);
  }

  @override
  void initState() {
    super.initState();
    _startSplashScreen();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        top: false,
        bottom: false,
        child: Stack(
          children: [
            Center(
              child: Image.asset(
                ImagesAssets.splashScreen, fit: BoxFit.cover, width: double.infinity,
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: FutureBuilder<String>(
                future: _getVersion(),
                builder:
                    (BuildContext context, AsyncSnapshot<String> snapshot) {
                  var verInfo = "";
                  if (snapshot.hasData) {
                    verInfo = "v ${snapshot.data}";
                  }
                  return Container(
                    margin: EdgeInsets.only(bottom: Sizes.dp30(context)),
                    child: Text(
                      verInfo,
                      style: TextStyle(fontWeight: FontWeight.bold, color: ColorPalettes.white),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
