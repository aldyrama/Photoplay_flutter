import 'package:flutter/material.dart';
import 'package:shared/shared.dart';

class ErrorCode extends StatelessWidget {
  final String errorCode;
  final String message;
  final Function onPressed;

  const ErrorCode({Key key, this.errorCode, this.message, this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorPalettes.white,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(ImagesAssets.ilustrationNoInternetConnection, scale: 5,),
            SizedBox(height: Sizes.dp20(context)),
            Text(
              message,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: Sizes.dp16(context),
              ),
            ),
            SizedBox(height: Sizes.dp20(context)),
            RaisedButton(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(Sizes.dp10(context)),
              ),
              onPressed: onPressed,
              child: Text('Reload', style: TextStyle(color: ColorPalettes.white),),
            ),
          ],
        )
    );
  }
}
