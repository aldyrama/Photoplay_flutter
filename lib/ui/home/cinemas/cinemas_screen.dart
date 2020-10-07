import 'package:BaseApp/ui/dashboard/dashboard.dart';

class CinemasScreen extends StatefulWidget {
  @override
  _CinemasState createState() => _CinemasState();
}

class _CinemasState extends State<CinemasScreen>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(AppConstant.cinemas),
        centerTitle: true,
      ),
    );
  }

}