import 'general_local_data_source.dart';
import 'general_remote_data_source.dart';
import 'general_repository_contract.dart';

import '../../../../core.dart';

class GeneralRepository extends GeneralRepositoryContract{
  final GeneralLocalDataSource generalLocalDataSource;
  final GeneralRemoteDataSource generalRemoteDataSource;

  static final GeneralRepository _singleton = GeneralRepository._internal(
    generalLocalDataSource: GeneralLocalDataSource(),
    generalRemoteDataSource: GeneralRemoteDataSource(),
  );

  factory GeneralRepository() {
    return _singleton;
  }

  GeneralRepository._internal({this.generalLocalDataSource, this.generalRemoteDataSource});

  @override
  Future<ResponseMovies> getMovieCommingSoon([String apiKey = ApiConstant.apiKey,
    String language = ApiConstant.language]) {
    return generalRemoteDataSource.getMovieCommingSoon(apiKey, language);
  }

  @override
  Future<ResponseDetailMovies> getMovieDetail([String apiKey = ApiConstant.apiKey,
    String language = ApiConstant.language, int movieId]) {
  }

  @override
  Future<ResponseMovies> getMoviePopular([String apiKey = ApiConstant.apiKey,
    String language = ApiConstant.language]) async{
    return generalRemoteDataSource.getMovieCommingSoon(apiKey, language);
  }
}