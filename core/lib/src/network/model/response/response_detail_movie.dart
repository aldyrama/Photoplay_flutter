import 'package:core/src/network/model/entity/genre.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

// part 'response_detail_movies.g.dart';

@JsonSerializable()
class ResponseDetailMovies extends Equatable {
  @JsonKey(name: 'adult')
  final String adult;

  @JsonKey(name: 'backdrop_path')
  final String backdropPath;

  @JsonKey(name: 'budget')
  final String budget;

  @JsonKey(name: 'genres')
  final List<Genre> genres;

  @JsonKey(name: 'id')
  final int id;

  @JsonKey(name: 'imdb_id')
  final int imdbId;

  @JsonKey(name: 'original_title')
  final int originalTitle;

  const ResponseDetailMovies(
      this.adult,
      this.backdropPath,
      this.budget,
      this.genres,
      this.id,
      this.imdbId,
      this.originalTitle
      );

  @override
  List<Object> get props => [
    adult,
    backdropPath,
    budget,
    genres,
    id,
    imdbId,
    originalTitle
  ];

  // factory ResponseDetailMovies.fromJson(Map<String, dynamic> json) => _$ResponseDetailMoviesFromJson(json);
  //
  // Map<String, dynamic> toJson() => _$ResponseDetailMoviesToJson(this);
}