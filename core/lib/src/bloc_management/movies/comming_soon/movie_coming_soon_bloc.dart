import 'package:core/core.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared/shared.dart';

class MovieComingSoonBloc extends Bloc<MovieComingSoonEvent, MovieComingSoonState> {
  final Repository repository;

  MovieComingSoonBloc({this.repository}) : super(InitialMovieComingSoon());

  @override
  Stream<MovieComingSoonState> mapEventToState(MovieComingSoonEvent event) async* {
    if (event is LoadMovieComingSoon) {
      yield* _mapLoadNowPlayingToState();
    }
  }

  Stream<MovieComingSoonState> _mapLoadNowPlayingToState() async* {
    try {
      yield MovieComingSoonLoading();
      var movies = await repository.getMovieCommingSoon(
          ApiConstant.apiKey, ApiConstant.language);
      if (movies.results.isEmpty) {
        yield MovieComingSoonNoData(AppConstant.noData);
      } else {
        yield MovieComingSoonHasData(movies);
      }
    } on DioError catch (e) {
      if (e.type == DioErrorType.CONNECT_TIMEOUT ||
          e.type == DioErrorType.RECEIVE_TIMEOUT) {
        yield MovieComingSoonNoInternetConnection();
      } else if (e.type == DioErrorType.DEFAULT) {
        yield MovieComingSoonNoInternetConnection();
      } else {
        yield MovieComingSoonError(e.toString());
      }
    }
  }
}
