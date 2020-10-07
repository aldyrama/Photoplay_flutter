import 'package:core/core.dart';
import 'package:equatable/equatable.dart';

abstract class MovieDetailState extends Equatable {
  const MovieDetailState();

  @override
  List<Object> get props => [];
}

class InitialMovieDetail extends MovieDetailState {}

class MovieDetailLoading extends MovieDetailState {}

class MovieDetailHasData extends MovieDetailState {
  final ResponseDetailMovies result;

  const MovieDetailHasData({this.result});

  @override
  List<Object> get props => [result];
}

class MovieDetailNoData extends MovieDetailState {
  final String message;

  const MovieDetailNoData(this.message);

  @override
  List<Object> get props => [message];
}

class MovieDetailNoInternetConnection extends MovieDetailState {}

class MovieDetailError extends MovieDetailState {
  final String errorMessage;

  MovieDetailError(this.errorMessage);

  @override
  List<Object> get props => [errorMessage];
}
