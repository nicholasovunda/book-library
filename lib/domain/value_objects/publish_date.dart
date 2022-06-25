import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:intl/intl.dart';

import 'failure.dart';

class PublishDate extends Equatable {
  final String _value;

  const PublishDate._(this._value);

  static Either<Failure, PublishDate> checkDate(String value) {
    final formatter = DateFormat("yyyy-mm-dd");

    try {
      formatter.parseStrict(value);
    } on FormatException {
      return left(Failure("incorrect date format [yyyy-mm-dd]"));
    }
    return Right(PublishDate._(value));
  }

  DateTime toDate() => DateTime.parse(_value);
  @override
  List<Object?> get props => [_value];
}
