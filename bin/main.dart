import 'dart:io';
import './models/student.dart';

void main() {
  Student? student1;
  Student? student2;

  while(true) {
    print("==============================");
    print(" Student Profile Menu ");
    print("==============================");
    print("1. Create student profile");
    print("2. Set the grade for the subject index");
    print("3. Get grade by subject name");
    print("4. Display all information about the student");
    print("5. Compare 2 students");
    print("6. Exit\n");

    print("Enter your choice: ");
    String? choice = stdin.readLineSync();

    switch(choice) {
      case "1": {
        try {
          stdout.write("Enter full name: ");
          String userName = stdin.readLineSync()!.trim();

          stdout.write("Enter record book: ");
          String userRecordBook = stdin.readLineSync()!.trim();

          stdout.write("Enter course (1-6): ");
          int userCourse = int.parse(stdin.readLineSync()!);

          stdout.write("Enter grades: ");
          List<int> userGrades = stdin.readLineSync()!.split(" ").map(int.parse).toList();

          student1 = Student(userName, userRecordBook, userCourse, userGrades);
          print("Student profile created successfully\n");
        } catch(e) {
          print("Error: $e\n");
        }
      }
      break;

      case "2": {
        if(student1 == null) {
          print("Create a student first\n");
          break;
        }

        try {
          stdout.write("Enter grade index(0-9): ");
          int index = int.parse(stdin.readLineSync()!);

          stdout.write("Enter new grade (0-100): ");
          int grade = int.parse(stdin.readLineSync()!);

          student1.setGrade(index, grade);
          print("Grade updated successfully\n");
        } catch(e) {
          print("Error: $e\n");
        }
      }
      break;

      case "3": {
        if(student1 == null) {
          print("Create a student first\n");
          break;
        }

        print("Available subjects:");
        for (var s in Subject.values) {
          print("- ${s.name}");
        }

        try {
          stdout.write("Enter subject name: ");
          String subjectName = stdin.readLineSync()!;

          var subject = Subject.values.firstWhere((s) => s.name.toLowerCase() == subjectName.toLowerCase());
          int grade = student1.getGradeBySubject(subject);
          print("Grade for $subjectName: $grade\n");
        } catch(e) {
          print("No such subject\n");
        }
      }
      break;

      case "4": {
        if(student1 == null) {
          print("Create a student first\n");
          break;
        }
        print(student1);
      }
      break;

      case "5": {
        if(student1 == null) {
          print("Create a student first\n");
          break;
        }

        try {
          print("Creating another student for comparison");
          stdout.write("Enter full name: ");
          String fullName = stdin.readLineSync()!;

          stdout.write("Enter record book: ");
          String recordBook = stdin.readLineSync()!;

          stdout.write("Enter course (1–6): ");
          int course = int.parse(stdin.readLineSync()!);

          print("Enter 10 grades (space separated): ");
          List<int> grades = stdin.readLineSync()!.split(" ").map(int.parse).toList();

          student2 = Student(fullName, recordBook, course, grades);
          List<int> diff = student1.compareGrades(student2);
          print("Difference in grades by subjects: $diff\n");
        } catch (e) {
          print("Error: $e\n");
        }
      }
      break;

      case "6": {
        return;
      }

      default:
        print("Incorrect choice\n");
    }
  }
}