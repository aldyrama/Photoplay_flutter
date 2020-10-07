import 'dart:convert';

import 'package:core/core.dart';
import 'package:shared/shared.dart';

class LocalRepository extends Repository {

  Future<bool> saveMoviePopular(ResponseMovies result) {
    return PrefHelper.storeCache(AppConstant.moviePopularKey, jsonEncode(result));
  }

  @override
  Future<ResponseMovies> getMoviePopular(
      [String apiKey = ApiConstant.apiKey, String language = ApiConstant.language]) async{
    var fromCache = await PrefHelper.getCache(AppConstant.moviePopularKey);
    if (fromCache != null) {
      Map json = jsonDecode(fromCache);
      return ResponseMovies.fromJson(json);
    }
    return null;
  }

  @override
  Future<ResponseMovies> getMovieCommingSoon(
      [String apiKey = ApiConstant.apiKey, String language = ApiConstant.language]) async{
    var fromCache = await PrefHelper.getCache(AppConstant.movieCommingSoonKey);
    if (fromCache != null) {
      Map json = jsonDecode(fromCache);
      return ResponseMovies.fromJson(json);
    }
    return null;
  }

  @override
  Future<ResponseDetailMovies> getMovieDetail(
      [String apiKey = ApiConstant.apiKey, String language = ApiConstant.language, int movieId]) async{
    var fromCache = await PrefHelper.getCache(AppConstant.movieDetailKey);
    if (fromCache != null) {
      Map json = jsonDecode(fromCache);
      // return ResponseDetailMovies.fromJson(json);
    }
    return null;
  }

}