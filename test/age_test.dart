import 'package:age2/age2.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test("Check 18 or older", () {
    final dateNow = DateTime.now();
    final date18YearsAgo = DateTime(dateNow.year - 18, dateNow.month, dateNow.day);
    final age = Age.dateDifference(fromDate: date18YearsAgo, toDate: dateNow);
    expect(age.years, greaterThanOrEqualTo(18));
  });

  test("Younger than 18", () {
    final dateNow = DateTime.now();
    DateTime dateAlmost18YearsAgo = DateTime(
      dateNow.year - 18,
      dateNow.month,
      dateNow.day,
      dateNow.hour,
      dateNow.minute,
      dateNow.second,
      dateNow.millisecond,
      dateNow.microsecond,
    );
    dateAlmost18YearsAgo = dateAlmost18YearsAgo.add(Duration(days: 1));

    final age = Age.dateDifference(fromDate: dateAlmost18YearsAgo, toDate: dateNow, includeToDate: false);
    expect(age.years, lessThan(18));
  });

  test("Check leap year", () {
    expect(Age.isLeapYear(2024), equals(true));
  });
}
