import 'age_range.dart';

class LabelledAgeRange extends AgeRange {
  final String label;

  factory LabelledAgeRange.fromJson(Map<String, dynamic> data) => LabelledAgeRange(
        label: data["label"] as String,
        min: data["lower"] as int,
        max: data["upper"] as int,
      );

  const LabelledAgeRange({required this.label, required super.min, required super.max});

  /// check if the given year is within the range
  bool isDobInRange(int year) => min >= year || year < max;

  /// check if the given age is within the range
  bool ageInRange(int age) => isDobInRange(DateTime.now().year - age);

  /// return the upper bounds range as age value
  int get upperAge => DateTime.now().year - min;

  /// return the lower bounds range as age value
  int get lowerAge => DateTime.now().year - max;

  AgeRange get toRange => AgeRange(min: lowerAge, max: upperAge);
}
