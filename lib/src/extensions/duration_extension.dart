extension DurationExtension on Duration {
  static const double daysPerYear = 365.25;

  int toYears() => (inDays / daysPerYear).floor();
}
