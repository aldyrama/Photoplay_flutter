import 'package:BaseApp/locator/locator.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import '../movie.dart';
import 'package:shared/shared.dart';
import 'package:core/core.dart';

class PopularMovie extends StatefulWidget {

  @override
  _PopularMovieState createState() => _PopularMovieState();
}

class _PopularMovieState extends State<PopularMovie> with AutomaticKeepAliveClientMixin, BaseView{

  @override
  void initState() {
    super.initState();
    print("<--first load data-->");
    fetchData();
  }

  @override
  void fetchData() {
    super.fetchData();
    // FirebaseAnalyticsService().logSignIn(SignInEvent("aldy.ramadhan012@gmail.com", "tet", "test"));
    context.bloc<MoviePopularBloc>().add(LoadMoviePopular());
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
      body: BlocBuilder<MoviePopularBloc, MoviePopularState>(
        builder: (context, state) {
          if (state is MoviePopularLoading) {
            return LoadingApp();
          }

          if (state is MoviePopularHasData) {
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