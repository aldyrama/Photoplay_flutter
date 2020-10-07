import 'package:core/core.dart';
import 'general_repository_contract.dart';
import 'general_local_data_source.dart';

class GeneralRemoteDataSource extends GeneralRepositoryContract{
  final RestClient restClient;
  final GeneralLocalDataSource generalLocalDataSource;

  static final GeneralRemoteDataSource _singleton = GeneralRemoteDataSource._internal(
      restClient: RestClient(),
      generalLocalDataSource: GeneralLocalDataSource(),
  );

  factory GeneralRemoteDataSource() {
    return _singleton;
  }

  GeneralRemoteDataSource._internal({this.restClient, this.generalLocalDataSource});

  @override
  Future<ResponseMovies> getMovieCommingSoon([String apiKey = ApiConstant.apiKey,
    String language = ApiConstant.language]) async{
    final data = await restClient.getMovieCommingSoon(apiKey, language);
    return data;
  }

  @override
  Future<ResponseDetailMovies> getMovieDetail([String apiKey = ApiConstant.apiKey,
    String language = ApiConstant.language, int movieId]) async{
  }

  @override
  Future<ResponseMovies> getMoviePopular([String apiKey = ApiConstant.apiKey,
    String language = ApiConstant.language]) async{
    print("get popular movie");
    final data = await restClient.getMoviePopular(apiKey, language);
    return data;
  }
}