import 'dart:io';

import 'package:flutter/material.dart';
import 'package:shared/shared.dart';

class DetailMovieScreen extends StatefulWidget {
  /// this variable for condition active page indicator
  final int active;

  const DetailMovieScreen({Key key, this.active}) : super(key: key);

  @override
  _DetailMovieScreenState createState() => _DetailMovieScreenState();
}

class _DetailMovieScreenState extends State<DetailMovieScreen> with BaseView{

  @override
  void initState() {
    super.initState();
    _getTheme();
  }

  void _getTheme() async{
    await ThemeHelper().getTheme().then((value) {
      setState(() {
        darkMode = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          MoviesHeader(
            isDark: darkMode,
          ),
          Positioned(
            top: Sizes.width(context) / 9,
            left: Sizes.dp5(context),
            child: IconButton(
              icon: Platform.isAndroid
                  ? Icon(Icons.arrow_back)
                  : Icon(Icons.arrow_back_ios),
              onPressed: () => Navigator.pop(context),
            ),
          ),
        ],
      )
    );
  }
  
}