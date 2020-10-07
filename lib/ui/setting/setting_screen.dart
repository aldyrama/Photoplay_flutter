import 'package:BaseApp/ui/launcher/launcher.dart';
import 'package:flutter/cupertino.dart';
import 'package:package_info/package_info.dart';

class SettingScreen extends StatefulWidget {

  @override
  _SettingScreenState createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  static final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  bool _isDark = false;

  @override
  void initState() {
    super.initState();
    _getTheme();
  }

  void _getTheme() async{
    await ThemeHelper().getTheme().then((value) {
      setState(() {
        _isDark = value;
      });
    });
  }

  void _handleRadioValueChange(bool value) {
    setState(() {
      _isDark = value;
      if (_isDark) {
        ThemeHelper().saveTheme(true);
        _changeTheme(context, ThemesKeys.DARK);
      } else {
        ThemeHelper().saveTheme(false);
        _changeTheme(context, ThemesKeys.LIGHT);
      }
    });
  }

  void _changeTheme(BuildContext buildContext, ThemesKeys key) {
    CustomTheme.instanceOf(buildContext).changeTheme(key);
  }

  Future<String> _getVersion() async {
    final PackageInfo info = await PackageInfo.fromPlatform();
    return info.version;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        title: Text('Settings'),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(Sizes.dp10(context)),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text('Theme'),
                Transform.scale(
                  scale: 0.8,
                  child: CupertinoSwitch(
                    value: _isDark,
                    onChanged: (val){
                      setState(() {
                        _isDark = val;
                        _handleRadioValueChange(_isDark);
                      });
                    },
                  ),
                )
              ],
            ),
            Divider(),
            Spacer(),
            FutureBuilder<String>(
              future: _getVersion(),
              builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
                var verInfo = "";
                if (snapshot.hasData) {
                  verInfo = "v ${snapshot.data}";
                }
                return Container(
                  margin: EdgeInsets.only(bottom: Sizes.dp30(context)),
                  child: Text(
                    verInfo,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
