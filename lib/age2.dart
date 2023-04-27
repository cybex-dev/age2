import 'package:collection/collection.dart';

import 'src/data.dart';
import 'src/extensions/duration_extension.dart';
import 'src/models/labelled_age_range.dart';

class Age {
  static List<LabelledAgeRange> groups = ageData.map(LabelledAgeRange.fromJson).toList();

  /// Calculates difference between 2 [DateTime]s as years
  static int dateDifference({required DateTime fromDate, DateTime? toDate}) {
    DateTime currentDate = toDate ?? DateTime.now();
    currentDate = currentDate.add(const Duration(days: 1));
    return currentDate.difference(fromDate).toYears();
  }

  static LabelledAgeRange toGroup({required int age}) {
    assert(age >= 18);
    return groups.firstWhereOrNull((element) => element.lowerAge <= age) ?? groups.last;
  }
}
