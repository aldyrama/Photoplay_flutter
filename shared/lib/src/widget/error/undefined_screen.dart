import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared/shared.dart';

///This class is called when you mis-route
class UndefinedScreen extends StatelessWidget {
  final String name;
  const UndefinedScreen({Key key, this.name}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorPalettes.white,
      body: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(ImagesAssets.ilustration001, scale: 4,),
              SizedBox(height: Sizes.dp20(context)),
              Text('Route for "$name" is not defined',
                style: TextStyle(fontSize: Sizes.dp16(context), color: ColorPalettes.black),
              ),
            ],
          ),
          Positioned(
            top: Sizes.width(context) / 9,
            left: Sizes.dp5(context),
            child: IconButton(
              icon: Platform.isAndroid
                  ? Icon(Icons.arrow_back, color: ColorPalettes.black,)
                  : Icon(Icons.arrow_back_ios, color: ColorPalettes.black,),
              onPressed: () => Navigator.pop(context),
            ),
          ),
        ],
      )
    );
  }
}