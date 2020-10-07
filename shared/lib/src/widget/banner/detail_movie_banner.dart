import 'package:flutter/material.dart';
import 'package:shared/src/widget/shimmer/shimmer_container.dart';

import '../../../shared.dart';

class DetailMovieBanner extends StatelessWidget {
  DetailMovieBanner(this.imageUrl, {this.isDark = false});

  final String imageUrl;
  final bool isDark;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: Sizes.width(context),
          height: Sizes.width(context) / 1.8,
          child:  CachedNetworkImage(
            fit: BoxFit.cover,
            imageUrl: imageUrl,
            placeholder: (context, url) => ShimmerContainer(),
            errorWidget: (context, url, error) => ErrorImage(),
          ),
        ),
        Positioned(
          bottom: 0,
          child: Image.asset(
            ImagesAssets.bgShadow, fit: BoxFit.cover,
            height: 20, width: Sizes.width(context),
            color: isDark ? ColorPalettes.darkBG : ColorPalettes.white.withOpacity(0.3),),
        ),
        Container(
          width: Sizes.width(context),
          height: Sizes.width(context) / 1.8,
          color: isDark ? ColorPalettes.darkBG.withOpacity(0.6) : ColorPalettes.white.withOpacity(0.5),
        )
      ],
    );
  }
}
