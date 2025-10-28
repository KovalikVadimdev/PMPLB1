class InvalidNameException implements Exception {
  final String message;
  InvalidNameException(this.message);
  @override
  String toString() => "InvalidNameException: $message";
}

class InvalidRecordBookException implements Exception {
  final String message;
  InvalidRecordBookException(this.message);
  @override
  String toString() => "InvalidRecordBookException: $message";
}

class InvalidCourseException implements Exception {
  final String message;
  InvalidCourseException(this.message);
  @override
  String toString() => "InvalidCourseException: $message";
}

class InvalidGradeException implements Exception {
  final String message;
  InvalidGradeException(this.message);
  @override
  String toString() => "InvalidGradeException: $message";
}
