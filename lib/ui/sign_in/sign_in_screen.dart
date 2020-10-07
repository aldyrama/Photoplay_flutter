
import 'package:BaseApp/ui/launcher/launcher.dart';

import 'sign_in.dart';

class SignInScreen extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignInScreen>{
  var _isDark = false;

  Future<void> getTheme() async{
    await ThemeHelper().getTheme().then((value) {
      setState(() {
        _isDark = value;
      });
    });
    print("object theme signin : ${_isDark}");
  }

  @override
  void initState() {
    super.initState();
    getTheme();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          _buildBgImage()
        ],
      ),
    );
  }

  Widget _buildBgImage(){
    return Column(
      children: [
        Expanded(
            child: Stack(
              children: [
                Image.asset(ImagesAssets.bgMovie, fit: BoxFit.cover, height: double.infinity,),
                Container(
                  width: double.infinity,
                  alignment: Alignment.bottomCenter,
                  child: Image.asset(ImagesAssets.bgShadow, width: double.infinity,
                    fit: BoxFit.cover, color: _isDark ? ColorPalettes.darkBG : ColorPalettes.lightBG,
                  ),
                ),
              ],
            )
        ),
        Expanded(child: Container())
      ],
    );
    return Container(
      alignment: Alignment.topCenter,
      child: Image.asset(ImagesAssets.bgMovie),
    );
  }
}