import 'package:core/core.dart';
import 'package:equatable/equatable.dart';

abstract class MovieComingSoonState extends Equatable {
  const MovieComingSoonState();

  @override
  List<Object> get props => [];
}

class InitialMovieComingSoon extends MovieComingSoonState {}

class MovieComingSoonLoading extends MovieComingSoonState {}

class MovieComingSoonHasData extends MovieComingSoonState {
  final ResponseMovies result;

  const MovieComingSoonHasData([this.result]);

  @override
  List<Object> get props => [result];
}

class MovieComingSoonNoData extends MovieComingSoonState {
  final String message;

  const MovieComingSoonNoData(this.message);

  @override
  List<Object> get props => [message];
}

class MovieComingSoonNoInternetConnection extends MovieComingSoonState {}

class MovieComingSoonError extends MovieComingSoonState {
  final String errorMessage;

  MovieComingSoonError(this.errorMessage);

  @override
  List<Object> get props => [errorMessage];
}
