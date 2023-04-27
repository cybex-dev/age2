import 'dart:math' as math;

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class AgeRange extends Equatable {
  final int min;
  final int max;

  const AgeRange({this.min = 0, this.max = 100});

  factory AgeRange.fromRangeValues(RangeValues rangeValue) => AgeRange(min: rangeValue.start.toInt(), max: rangeValue.end.toInt());

  RangeValues toRangeValues() => RangeValues(min.toDouble(), max.toDouble());

  /// checks if the given range atleast overlaps this.
  /// Use `strict = true` to require the age range must be completely inclusive
  bool inRange(AgeRange range, {bool strict = false}) {
    if (strict) {
      return (range.min < range.max && range.min < max && range.min >= min && range.max > min && range.max <= max);
    } else {
      return (range.min < range.max && range.min < max && range.max > min);
    }
  }

  /// Checks whether a single value is within the given range, inclusive.
  bool inRangeValue(int value) => value >= min && value <= max;

  @override
  String toString() => "$min-$max";

  String get toStringFancy {
    if (min == max) {
      return "$max";
    } else {
      return "$min - $max";
    }
  }

  @override
  List<Object?> get props => [min, max];

  AgeRange copyWith({
    int? min,
    int? max,
  }) {
    return AgeRange(
      min: min ?? this.min,
      max: max ?? this.max,
    );
  }

  /// Merges this and provided RangePreference performing a union operation i.e. finds max of upper values and min of lower values, returning a new RangePreferences with these.
  AgeRange union(AgeRange ageRange) {
    int min = math.min(this.min, ageRange.min);
    int max = math.max(this.max, ageRange.max);
    return AgeRange(min: min, max: max);
  }

  /// Compares this and provided RangePreference and performs an intersection operation i.e. combining values found in both
  AgeRange intersect(AgeRange ageRange) {
    int min = math.max(this.min, ageRange.min);
    int max = math.min(this.max, ageRange.max);
    return AgeRange(min: min, max: max);
  }
}
