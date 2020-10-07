import 'package:BaseApp/ui/dashboard/dashboard.dart';

class FavouriteScreen extends StatefulWidget {
  @override
  _FavouriteState createState() => _FavouriteState();
}

class _FavouriteState extends State<FavouriteScreen>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(AppConstant.favouriteMovies),
        centerTitle: true,
      ),
    );
  }

}