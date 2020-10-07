
import 'package:core/core.dart';

import 'dashboard.dart';

class DashBoardScreen extends StatefulWidget {

  @override
  DashBoardScreenState createState() => DashBoardScreenState();
}

class DashBoardScreenState extends State<DashBoardScreen> {
  PageController _pageController;
  int page = 0;

  void navigationTapped(int page) {
    _pageController.jumpToPage(page);
  }

  void onPageChanged(int page) {
    print("cek page : ${page}");
    setState(() {
      this.page = page;
    });
  }

  @override
  void initState() {
    super.initState();
    FirebasePushNotificationService().initialize();
    _pageController = PageController(initialPage: 0);
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        physics: NeverScrollableScrollPhysics(),
        controller: _pageController,
        onPageChanged: onPageChanged,
        children: <Widget>[
          MovieScreen(active: page),
          TicketsScreen(active: true,),
          CinemasScreen(),
          FavouriteScreen(),
          ProfileScreen()
        ],
      ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      // floatingActionButton: FloatingActionButton(
      //   // onPressed: () => Navigation.intent(context, DiscoverScreen.routeName),
      //   child: Icon(
      //     Icons.location_searching,
      //     color: ColorPalettes.white,
      //   ),
      // ),
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
          // sets the background color of the `BottomNavigationBar`
          canvasColor: Theme.of(context).primaryColor,
          // sets the active color of the `BottomNavigationBar` if `Brightness` is light
          primaryColor: Theme.of(context).accentColor,
          textTheme: Theme.of(context).textTheme.copyWith(
            caption: TextStyle(color: ColorPalettes.setActive),
          ),
        ),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          onTap: navigationTapped,
          currentIndex: page,
          items: [
            BottomNavigationBarItem(
              icon: Image.asset(ImagesAssets.movie, width: Sizes.dp20(context),),
              activeIcon: Image.asset(ImagesAssets.movie, width: Sizes.dp20(context), color: ColorPalettes.lightAccent,),
              title: Text(AppConstant.movies),
            ),
            BottomNavigationBarItem(
              icon: Image.asset(ImagesAssets.tickets, width: Sizes.dp20(context),),
              activeIcon: Image.asset(ImagesAssets.tickets, width: Sizes.dp20(context), color: ColorPalettes.lightAccent,),
              title: Text(AppConstant.tickets),
            ),
            BottomNavigationBarItem(
              icon: Image.asset(ImagesAssets.cinemas, width: Sizes.dp20(context),),
              activeIcon: Image.asset(ImagesAssets.cinemas, width: Sizes.dp20(context), color: ColorPalettes.lightAccent,),
              title: Text(AppConstant.cinemas),
            ),
            BottomNavigationBarItem(
              icon: Image.asset(ImagesAssets.favourite, width: Sizes.dp24(context),),
              activeIcon: Image.asset(ImagesAssets.favourite, width: Sizes.dp24(context), color: ColorPalettes.lightAccent,),
              title: Text(AppConstant.favourite),
            ),
            BottomNavigationBarItem(
              icon: Image.asset(ImagesAssets.profile, width: Sizes.dp20(context),),
              activeIcon: Image.asset(ImagesAssets.profile, width: Sizes.dp20(context), color: ColorPalettes.lightAccent,),
              title: Text(AppConstant.profile),
            )
          ],
        ),
        // child: BottomAppBar(
        //   shape: CircularNotchedRectangle(),
        //   notchMargin: Sizes.dp8(context),
        //   child: Row(
        //     mainAxisAlignment: MainAxisAlignment.spaceAround,
        //     children: [
        //       IconButton(
        //         color:
        //         _page == 0 ? ColorPalettes.darkAccent : ColorPalettes.grey,
        //         icon: Icon(Icons.movie_creation),
        //         onPressed: () => _navigationTapped(0),
        //       ),
        //       IconButton(
        //         color:
        //         _page == 1 ? ColorPalettes.darkAccent : ColorPalettes.grey,
        //         icon: Icon(Icons.live_tv),
        //         onPressed: () => _navigationTapped(1),
        //       ),
        //     ],
        //   ),
        // ),
      ),
    );
  }
}
