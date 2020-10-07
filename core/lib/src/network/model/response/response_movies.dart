import 'package:core/src/network/model/entity/movies.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'response_movies.g.dart';

@JsonSerializable()
class ResponseMovies extends Equatable {
  @JsonKey(name: 'results')
  final List<Movies> results;

  const ResponseMovies([this.results = const []]);

  @override
  List<Object> get props => [results];

  factory ResponseMovies.fromJson(Map<String, dynamic> json) => _$ResponseMoviesFromJson(json);

  Map<String, dynamic> toJson() => _$ResponseMoviesToJson(this);
}