import 'package:equatable/equatable.dart';

abstract class MovieComingSoonEvent extends Equatable {
  const MovieComingSoonEvent();

  @override
  List<Object> get props => [];
}

class LoadMovieComingSoon extends MovieComingSoonEvent {}