import '../../../shared.dart';
import 'package:core/core.dart';

Widget GenreText(int id) {
  return Container(
    margin: EdgeInsets.only(right: 5),
    child: Text(
      "${GenreList.genresList[id]},",
      style: TextStyle(fontSize: 12,
          color: ColorPalettes.lightAccent,
          fontWeight: FontWeight.w600
      ),
    ),
  );
}