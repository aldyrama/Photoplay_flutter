import 'package:core/src/network/api/rest_manager.dart';
import 'package:dio/dio.dart';
import '../../../core.dart';

class RestClient extends Repository{
  Dio manager;

  @override
  Future<ResponseMovies> getMoviePopular(
      [String apiKey = ApiConstant.apiKey, String language = ApiConstant.language]) async{

    var queryParam = {"api_key": apiKey, "language": language};
    manager = await RestManager.getManager(showAlert: true);
    Response response = await manager.get(ApiConstant.mvPopularApi, queryParameters: queryParam);
    final data = response.data;

    return ResponseMovies.fromJson(data);
  }

  @override
  Future<ResponseMovies> getMovieCommingSoon(
      [String apiKey = ApiConstant.apiKey, String language = ApiConstant.language]) async{

    var queryParam = {"api_key": apiKey, "language": language};
    manager = await RestManager.getManager(showAlert: true);
    Response response = await manager.get(ApiConstant.mvCommingSoonApi, queryParameters: queryParam);
    final data = response.data;

    return ResponseMovies.fromJson(data);
  }

  @override
  Future<ResponseDetailMovies> getMovieDetail(
      [String apiKey = ApiConstant.apiKey, String language = ApiConstant.language, int movieId]) async{

    var queryParam = {"api_key": apiKey, "language": language};
    manager = await RestManager.getManager(showAlert: true);
    Response response = await manager.get(ApiConstant.mvCommingSoonApi, queryParameters: queryParam);
    final data = response.data;

    // return ResponseDetailMovies.fromJson(data);
  }

}