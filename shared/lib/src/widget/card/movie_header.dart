import 'package:flutter/material.dart';
import 'package:shared/shared.dart';

class MoviesHeader extends StatelessWidget {
  final List<Widget> genre;
  final String title;
  final String imageBanner;
  final String imagePoster;
  final double rating;
  final bool isDark;

  const MoviesHeader(
      {Key key,
        this.genre,
        this.title,
        this.imageBanner,
        this.imagePoster,
        this.rating,
        this.isDark})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DetailMovieBanner(
            "https://i.ytimg.com/vi/AjvdnzWfuDU/hqdefault.jpg",
            isDark: isDark,
        ),
        // Positioned(
        //   bottom: 0.0,
        //   left: Sizes.dp16(context),
        //   right: Sizes.dp16(context),
        //   child: Row(
        //     crossAxisAlignment: CrossAxisAlignment.end,
        //     mainAxisAlignment: MainAxisAlignment.end,
        //     children: [
        //       Poster(
        //         imagePoster,
        //         Sizes.width(context) / 2,
        //       ),
        //       SizedBox(width: Sizes.dp16(context)),
        //       Expanded(child: movieInformation),
        //     ],
        //   ),
        // ),
      ],
    );
  }
}
