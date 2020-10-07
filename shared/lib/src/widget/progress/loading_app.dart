import 'package:flutter/cupertino.dart';
import 'package:lottie/lottie.dart';
import 'package:shared/src/common/common.dart';
import 'package:shared/src/common/utils/json_assets.dart';

class LoadingApp extends StatelessWidget {
  final bool theme;

  const LoadingApp(
      {Key key,
        this.theme})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Lottie.asset(JsonAssets.covidLoading,
          height: 150
      ),
    );
  }
}
