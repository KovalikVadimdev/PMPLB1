import './exception.dart';

enum Subject {
  intelligentAutonomousSystems,
  fundamentalsOfInnovativeITProjectManagement,
  mobileDeviceProgramming,
  economicsAndBusiness,
  informationSecurityInComputerSystems,
  computerNetworks,
  computerSystems,
  computerSystemDesignTechnologies,
  computerArchitecture,
  systemSoftware
}

class Student {
  final String fullName;
  final String recordBook;
  final int course;
  late double avgGrade;
  final List<int> grades;

  Student(this.fullName, this.recordBook, this.course, this.grades) : avgGrade = grades.reduce((a, b) => a + b) / grades.length {
    // Check name student
    RegExp nameRegex = RegExp(r"^[A-Za-zА-Яа-яІіЇїЄє']+( [A-Za-zА-Яа-яІіЇїЄє']+)*$");
    if(fullName.isEmpty || !nameRegex.hasMatch(fullName)) {
      throw InvalidNameException("Incorrect name entered");
    }

    // Check record book number
    RegExp recordBookRegex = RegExp(r"\s");
    if(recordBookRegex.hasMatch(recordBook)) {
      throw InvalidRecordBookException("Incorrect record book number");
    }

    // Check course
    if(course < 1 || course > 6) {
      throw InvalidCourseException("Incorrect course value");
    }

    // Check length grades
    if (grades.length != Subject.values.length) {
      throw InvalidGradeException("The student must have exactly 10 grades");
    }

    // Check grades
    for (var g in grades) {
      if (g < 0 || g > 100) {
        throw InvalidGradeException("Grade must be between 0 and 100");
      }
    }
  }

  // Method for set grade with using index
  void setGrade(int index, int value) {
    if (index < 0 || index >= grades.length) {
      throw InvalidGradeException("Invalid subject index");
    }

    if(value < 0 || value > 100) {
      throw InvalidGradeException("Grade must be between 0 and 100");
    }

    grades[index] = value;
    avgGrade = grades.reduce((a, b) => a + b) / grades.length;
  }

  // Method for get grade with name subject
  int getGradeBySubject(Subject subject) {
    return grades[subject.index];
  }

  // Method for compare two students
  List<int> compareGrades(Student other) {
    List<int> differences = [];

    for(int i = 0; i < grades.length; i++) {
      differences.add((grades[i] - other.grades[i]).abs());
    }

    return differences;
  }


  @override
  String toString() {
    StringBuffer sb = StringBuffer();
    sb.writeln("Full Name: $fullName");
    sb.writeln("Record Book: $recordBook");
    sb.writeln("Course: $course");
    sb.writeln("Average Grade: $avgGrade");
    sb.writeln("Grades:");
    for (int i = 0; i < Subject.values.length; i++) {
      sb.writeln("  ${Subject.values[i].name}: ${grades[i]}");
    }
    return sb.toString();
  }
}

