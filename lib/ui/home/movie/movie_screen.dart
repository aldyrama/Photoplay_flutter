import 'package:BaseApp/ui/dashboard/dashboard.dart';
import 'package:BaseApp/ui/home/movie/comming_soon/comming_soon_movie.dart';
import 'package:BaseApp/ui/home/movie/popular/popular_movie.dart';
import 'package:core/core.dart';


class MovieScreen extends StatefulWidget {
  final int active;

  const MovieScreen({Key key, this.active}) : super(key: key);

  @override
  _MovieState createState() => _MovieState();
}

class _MovieState extends State<MovieScreen> with SingleTickerProviderStateMixin, AutomaticKeepAliveClientMixin {
  TabController _tabController;
  PageController _pageController;
  int _page = -1;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 2);
    _pageController = PageController(initialPage: 0);
    _page = _tabController.index;

  }

  void _onPageChanged(int page) {
    setState(() {
      this._page = page;
      _tabController.index = page;
    });
  }

  void _navigationTapped(int page) {
    setState(() {
      this._page = page;
      _pageController.jumpToPage(page);
    });
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
    _pageController.dispose();
  }

  @override
  void didUpdateWidget(MovieScreen oldWidget) {
    super.didUpdateWidget(oldWidget);
    _page = -1;
    if(widget.active == 0) _page = 0; else _page = -1;
    if(_page == 0){
      _onPageChanged(_page);
      _navigationTapped(_page);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(AppConstant.movies),
        centerTitle: true,
        bottom: _buildTabBar(),
      ),
      body: _buildTabView(),
    );
  }

  Widget _buildTabBar(){
    return TabBar(
      controller: _tabController,
      onTap: _navigationTapped,
      tabs: <Widget>[
        Tab(text: AppConstant.popular,),
        Tab(text: AppConstant.commingSoon,),
      ],
    );
  }

  Widget _buildTabView(){
    return  PageView(
      controller: _pageController,
      onPageChanged: _onPageChanged,
      children: <Widget>[
        BlocProvider<MoviePopularBloc>(
          create: (BuildContext context) =>
              MoviePopularBloc(repository: GeneralRepository()),
          child: PopularMovie(),
        ),
        BlocProvider<MovieComingSoonBloc>(
          create: (BuildContext context) =>
              MovieComingSoonBloc(repository: ApiRepository()),
          child: CommingSoonMovie(),
        )
      ],
    );
  }

  @override
  bool get wantKeepAlive => true;

}