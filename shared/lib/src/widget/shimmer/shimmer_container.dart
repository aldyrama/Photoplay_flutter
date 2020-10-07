import 'package:shared/shared.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerContainer extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Shimmer.fromColors(
        baseColor: ColorPalettes.greyBg,
        highlightColor: ColorPalettes.white,
        child: Container(
          width: double.infinity,
          height: 240,
          color: ColorPalettes.greyBg,
        ),
      )
    );
  }

}