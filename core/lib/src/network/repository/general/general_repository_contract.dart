import '../../../../core.dart';

abstract class GeneralRepositoryContract{

  Future<ResponseMovies> getMoviePopular([
    String apiKey = ApiConstant.apiKey,
    String language = ApiConstant.language
  ]);

  Future<ResponseMovies> getMovieCommingSoon([
    String apiKey = ApiConstant.apiKey,
    String language = ApiConstant.language
  ]);

  Future<ResponseDetailMovies> getMovieDetail([
    String apiKey = ApiConstant.apiKey,
    String language = ApiConstant.language,
    int movieId
  ]);

}