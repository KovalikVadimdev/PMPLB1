import 'package:test/test.dart';
import '../bin/student.dart';

void main() {
  group('Student validation tests', () {
    test('Valid student should be created successfully', () {
      final student = Student(
        'Kovalyk Vadym',
        'AX999',
        4,
        [90, 85, 80, 70, 95, 88, 92, 76, 84, 89],
      );
      expect(student.fullName, equals('Kovalyk Vadym'));
      expect(student.recordBook, equals('AX999'));
      expect(student.course, equals(4));
      expect(student.avgGrade, closeTo(84.9, 0.1));
      expect(student.grades.length, equals(10));
    });

    // ПІБ не може бути порожнім
    test('Empty fullName should throw exception', () {
      expect(
            () => Student('', 'AX999', 4, List.filled(10, 90)),
        throwsFormatException,
      );
    });

    // ПІБ не може містити цифри
    test('Full name with digits should throw exception', () {
      expect(
            () => Student('Kovalyk Vadym123', 'RB123', 4, List.filled(10, 90)),
        throwsFormatException,
      );
    });

    // Номер залікової книжки не може містити пробіли
    test('Record book number with spaces should throw exception', () {
      expect(
            () => Student('Kovalyk Vadym', 'AX 999', 4, List.filled(10, 90)),
        throwsFormatException,
      );
    });

    // Курс повинен бути в межах 1–6
    test('Invalid course number should throw exception', () {
      expect(
            () => Student('Kovalyk Vadym', 'AX999', 0, List.filled(10, 90)),
        throwsFormatException,
      );
      expect(
            () => Student('Ковалик Вадим', 'AX999', 7, List.filled(10, 90)),
        throwsFormatException,
      );
    });

    // Оцінок має бути рівно 10
    test('Incorrect number of grades should throw exception', () {
      expect(
            () => Student('Ковалик Вадим', 'AX999', 4, [90, 85, 70]), // лише 3
        throwsFormatException,
      );
      expect(
            () => Student('Ковалик Вадим', 'AX999', 4, List.filled(11, 80)), // 11
        throwsFormatException,
      );
    });

    // Оцінка не може бути меншою за 0
    test('Grade less than 0 should throw exception', () {
      expect(
            () => Student('Ковалик Вадим', 'AX999', 4,
            [90, 85, 70, 50, 60, 40, 30, 20, 10, -5]),
        throwsFormatException,
      );
    });

    // Оцінка не може бути більшою за 100
    test('Grade greater than 100 should throw exception', () {
      expect(
            () => Student('Ковалик Вадим', 'AX999', 4,
            [90, 85, 70, 50, 60, 40, 30, 20, 10, 105]),
        throwsFormatException,
      );
    });

    // Середній бал має бути дійсним числом
    test('Average grade should be calculated correctly', () {
      final student = Student(
        'Ковалик Вадим',
        'AX999',
        3,
        [100, 90, 80, 70, 60, 50, 40, 30, 20, 10],
      );
      expect(student.avgGrade, equals(55.0));
      expect(student.avgGrade, isA<double>());
    });
  });
}
