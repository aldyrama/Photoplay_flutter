extension StringExtension on String {
  String get imageOriginalUrl {
    return 'https://image.tmdb.org/t/p/original$this';
  }
}
