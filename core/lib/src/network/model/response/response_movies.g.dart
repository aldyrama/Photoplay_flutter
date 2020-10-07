// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'response_movies.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResponseMovies _$ResponseMoviesFromJson(Map<String, dynamic> json) {
  return ResponseMovies(
    (json['results'] as List)
        ?.map((e) =>
            e == null ? null : Movies.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$ResponseMoviesToJson(ResponseMovies instance) =>
    <String, dynamic>{
      'results': instance.results,
    };
