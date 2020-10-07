import 'package:BaseApp/locator/locator.dart';
import 'package:BaseApp/ui/dashboard/dashboard.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import '../movie.dart';

class CommingSoonMovie extends StatefulWidget {

  @override
  _CommingSoonMovieState createState() => _CommingSoonMovieState();
}

class _CommingSoonMovieState extends State<CommingSoonMovie> with AutomaticKeepAliveClientMixin, BaseView{

  @override
  void initState() {
    super.initState();
    print("<--first load data-->");
    fetchData();
  }

 @override
  void fetchData() {
    super.fetchData();
    context.bloc<MovieComingSoonBloc>().add(LoadMovieComingSoon());
 }

  @override
  void doRefresh() {
    super.doRefresh();
    print("<--do refresh data-->");
    fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<MovieComingSoonBloc, MovieComingSoonState>(
        builder: (context, state) {
          if (state is MovieComingSoonLoading && showLoading){
            return LoadingApp();
          }

          if (state is MovieComingSoonHasData) {
            return StaggeredGridView.countBuilder(
              crossAxisCount: 4,
              staggeredTileBuilder: (int index) => StaggeredTile.fit(2),
              itemCount:  state.result.results == null
                  ? 0
                  : state.result.results.length,
              itemBuilder: (BuildContext context, int index){
                Movies movies = state.result.results[index];
                return CardMoviesGridBorder(
                  image: getString(movies.posterPath),
                  title: getString(movies.title),
                  vote: getDouble(movies.voteAverage),
                  releaseDate: getString(movies.releaseDate),
                  overview: getString(movies.overview),
                  genre: movies.genreIds.take(3).map(GenreText).toList(),
                  onTap: () {
                    navigation.onIntent(RoutName.detailMovieScreen, argumentClass: "argumentClass");
                    },
                );
              },
            );
          }

          else{
            return Center(child: Text(""));
          }

        },
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;

}