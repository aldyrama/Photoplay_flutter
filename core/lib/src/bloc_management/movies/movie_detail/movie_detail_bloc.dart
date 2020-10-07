import 'package:core/core.dart';
import 'package:dio/dio.dart';
import 'package:shared/shared.dart';

class MovieDetailBloc extends Bloc<MovieDetailEvent, MovieDetailState> {
  final Repository repository;

  MovieDetailBloc({this.repository}) : super(InitialMovieDetail());

  @override
  Stream<MovieDetailState> mapEventToState(MovieDetailEvent event) async* {
    if (event is LoadMovieDetail) {
      yield* _mapLoadDetailToState(event);
    }
  }

  Stream<MovieDetailState> _mapLoadDetailToState(LoadMovieDetail event) async* {
    try {
      yield MovieDetailLoading();
      var movies = await repository.getMovieDetail(ApiConstant.apiKey, ApiConstant.language, event.movieId);
      if (movies == null) {
        yield MovieDetailNoData(AppConstant.noData);
      } else {
        yield MovieDetailHasData(result: movies);
      }
    } on DioError catch (e) {
      if (e.type == DioErrorType.CONNECT_TIMEOUT || e.type == DioErrorType.RECEIVE_TIMEOUT) {
        yield MovieDetailNoInternetConnection();
      } else if (e.type == DioErrorType.DEFAULT) {
        yield MovieDetailNoInternetConnection();
      } else {
        yield MovieDetailError(e.toString());
      }
    }
  }
}
