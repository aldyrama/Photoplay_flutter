import 'package:core/core.dart';
import 'package:flutter/material.dart';

class ApiRepository extends Repository {
  final LocalRepository localRepository;
  final RestClient restClient;

  static final ApiRepository _singleton = ApiRepository._internal(
      restClient: RestClient(), localRepository: LocalRepository());

  factory ApiRepository() {
    return _singleton;
  }

  ApiRepository._internal(
      {@required this.restClient, @required this.localRepository});

  @override
  Future<ResponseMovies> getMoviePopular(
      [String apiKey = ApiConstant.apiKey, String language = ApiConstant.language]) async{
    final data = await restClient.getMoviePopular(apiKey, language);
    return data;

    /// use as below if you want to save the response and hit Api periodically
    // try {
    //   var fromLocal = await localRepository.getMoviePopular(apiKey, language);
    //   if (fromLocal != null) {
    //     return fromLocal;
    //   } else {
    //     throw Exception();
    //   }
    // } catch (_) {
    //   final data = await restClient.getMoviePopular(apiKey, language);
    //   localRepository.saveMoviePopular(data);
    //   return data;
    // }
  }

  @override
  Future<ResponseMovies> getMovieCommingSoon(
      [String apiKey = ApiConstant.apiKey, String language = ApiConstant.language]) async{
    final data = await restClient.getMovieCommingSoon(apiKey, language);
    return data;
  }

  @override
  Future<ResponseDetailMovies> getMovieDetail(
      [String apiKey = ApiConstant.apiKey, String language = ApiConstant.language, int movieId]) {

  }

}