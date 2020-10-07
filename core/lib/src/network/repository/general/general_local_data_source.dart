import 'general_repository_contract.dart';
import '../../../../core.dart';
import '../../model/model.dart';

class GeneralLocalDataSource extends GeneralRepositoryContract{
  @override
  Future<ResponseMovies> getMovieCommingSoon([String apiKey = ApiConstant.apiKey,
    String language = ApiConstant.language]) {
    // TODO: implement getMovieCommingSoon
    throw UnimplementedError();
  }

  @override
  Future<ResponseDetailMovies> getMovieDetail([String apiKey = ApiConstant.apiKey,
    String language = ApiConstant.language, int movieId]) {
    // TODO: implement getMovieDetail
    throw UnimplementedError();
  }

  @override
  Future<ResponseMovies> getMoviePopular([String apiKey = ApiConstant.apiKey,
    String language = ApiConstant.language]) {
    // TODO: implement getMoviePopular
    throw UnimplementedError();
  }

}