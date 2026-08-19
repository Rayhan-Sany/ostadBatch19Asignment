import 'dart:io';

class Student {
  String name;
  int age;
  String studentId;
  String email;
  String phone;
  Student({
    required this.name,
    required this.age,
    required this.studentId,
    required this.email,
    required this.phone,
  });
}

class AcademicResult {
  int totalMark;
  int obtainedMark;
  String studentId;

  AcademicResult({required this.studentId, required  this.totalMark, required this.obtainedMark});

  int get percentage {
    return ((100 / totalMark) * obtainedMark).toInt();
  }

  String get grade {
    String grade;
    if (percentage >= 80) {
      grade = "A+";
    } else if (percentage <= 79 && percentage >= 70) {
      grade = "A";
    } else if (percentage <= 69 && percentage >= 60) {
      grade = "A-";
    } else if (percentage <= 59 && percentage >= 50) {
      grade = "B";
    } else if (percentage <= 49 && percentage >= 40) {
      grade = "C";
    } else if (percentage <= 39 && percentage >= 33) {
      grade = "D";
    } else {
      grade = "F";
    }

    return grade;
  }

  String get status{
    return percentage < 33 ? "Fail" : "Pass";
  }
}

void main() {
  Student studentInfo = takeInputStudentInfo();
  print("\n\n===== Student Information =====\n\n");
  showStudentInfo(studentInfo);
  print("\n");
  AcademicResult studentResultInfo =takeMarksInfoInput(studentInfo.studentId);

  print("\n\n===== Academic Result =====\n\n");
  showResult(studentResultInfo);
}


void showStudentInfo(Student studentInfo) {
  print("Student name is : ${studentInfo.name}");
  print("Student Age is : ${studentInfo.age}");
  print("Student ID is : ${studentInfo.studentId}");
  print("Student Email is : ${studentInfo.email}");
  print("Student Phone Number is : ${studentInfo.phone}");
}

void showResult(AcademicResult studentResultInfo) {
  print("Total Mark : ${studentResultInfo.totalMark}");
  print("Obtained Mark : ${studentResultInfo.obtainedMark}");
  print("Percentage : ${studentResultInfo.percentage}\%");
  print("Grade : ${studentResultInfo.grade}");
  print("Status : ${studentResultInfo.status}");
}

Student takeInputStudentInfo() {
  stdout.write("Enter Student Name : ");
  String name = stdin.readLineSync()!;

  stdout.write("Enter Student Age : ");
  int age = int.tryParse(stdin.readLineSync()??"")??-1;

  stdout.write("Enter Student ID : ");
  String studentId = stdin.readLineSync()!;

  stdout.write("Enter Student Email : ");
  String email = stdin.readLineSync()!;

  stdout.write("Enter Student Phone Number : ");
  String? phone = stdin.readLineSync();

  phone == null || phone.trim().isEmpty ? phone = "01xxxxxxxxx" : phone = phone;

  Student studentInfo = Student(
    name: name,
    age: age,
    studentId: studentId,
    email: email,
    phone: phone,
  );
  return studentInfo;
}

AcademicResult takeMarksInfoInput(String studentId) {
  stdout.write("Enter Student Obtained Mark : ");
  int obtainedMark = int.tryParse(stdin.readLineSync()??"")??-1;
  stdout.write("Enter Total Mark : ");
  int totalMark = int.tryParse(stdin.readLineSync()??"")??-1;
  AcademicResult studentResultInfo = AcademicResult(studentId:studentId,totalMark: totalMark, obtainedMark: obtainedMark);

  return studentResultInfo;
}
