import 'package:shared/src/widget/shimmer/shimmer_container.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

import 'card.dart';
import 'package:shared/src/common/common.dart';
import 'package:shared/src/common/extension/exten.dart';

class CardMoviesGridBorder extends StatelessWidget {
  final String image;
  final double vote;
  final String title;
  final String releaseDate;
  final List<Widget> genre;
  final String overview;
  final Function onTap;

  const CardMoviesGridBorder(
      {Key key,
        this.image,
        this.vote,
        this.title,
        this.releaseDate,
        this.genre,
        this.overview,
        this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(Sizes.dp5(context)),
      child: InkWell(
        onTap: onTap,
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(Sizes.dp8(context))
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Stack(
                children: [
                  Container(
                      width: Sizes.width(context),
                      height: 240,
                      child: ClipRRect(
                        borderRadius: BorderRadius.only(topLeft: Radius.circular(8), topRight: Radius.circular(8)),
                        child: CachedNetworkImage(
                          imageUrl: image.imageOriginalUrl,
                          fit: BoxFit.fill,
                          placeholder: (context, url) => ShimmerContainer(),
                          errorWidget: (context, url, error) => ErrorImage(),
                        ),
                      ),
                  ),
                  Positioned(
                    bottom: 0,
                    child: Image.asset(ImagesAssets.bgShadow,
                      color: ColorPalettes.darkBG, height: 50,
                      width: Sizes.width(context), fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                    left: Sizes.dp10(context),
                    bottom: Sizes.dp12(context),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: genre,
                          ),
                        ),
                        SmoothStarRating(
                            allowHalfRating: false,
                            starCount: 5,
                            rating: vote / 2,
                            size: Sizes.dp12(context),
                            color: ColorPalettes.lightAccent,
                            borderColor: ColorPalettes.grey,
                            spacing: 0.0
                        ),
                      ],
                    )
                  )
                ],
              ),
              ListTile(
                title: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(title, style: TextStyle(fontSize: Sizes.dp14(context)),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(height: Sizes.dp5(context),),
                    Text(releaseDate, style: TextStyle(fontSize: Sizes.dp10(context)),)
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
