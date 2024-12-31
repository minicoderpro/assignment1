
abstract class Role {
  void displayRole();
}

//==============================================================================

class Person implements Role {
  String name;
  int age;
  String address;
  late Role role;

  Person(this.name, this.age, this.address);

  String getName() => name;
  int getAge() => age;
  String getAddress() => address;

  @override
  void displayRole() {
    print("Role: $role");
  }
}

//==============================================================================

class Student extends Person {
  String studentID;
  String grade;
  List<int> courseScores;

  Student(super.name, super.age, super.address, this.studentID, this.grade, this.courseScores);

  @override
  void displayRole() {
    print("Role: Student");
  }

  double calculateAverageScore() {
    if (courseScores.isEmpty) return 0.0;
    int totalScore = courseScores.reduce((a, b) => a + b);
    return totalScore / courseScores.length;
  }
}

//==============================================================================

class Teacher extends Person {
  String teacherID;
  List<String> coursesTaught;

  Teacher(super.name, super.age, super.address, this.teacherID, this.coursesTaught);

  @override
  void displayRole() {
    print("Role: Teacher");
  }

  void displayCoursesTaught() {
    print("Courses Taught:");
    for (var course in coursesTaught) {
      print("- $course");
    }
  }
}


//==============================================================================

class StudentManagementSystem {

  static void main() {

    Student student = Student("John Doe", 20, "123 Main St", "S12345", "A", [90, 85, 82]);
    Teacher teacher = Teacher("Mrs. Smith", 35, "456 Oak St", "T98765", ["Math", "English", "Bangla"]);

    print("Student Information:");
    student.displayRole();
    print("Name: ${student.getName()}");
    print("Age: ${student.getAge()}");
    print("Address: ${student.getAddress()}");
    print("Average Score: ${student.calculateAverageScore()}");
    print("");

    print("Teacher Information:");
    teacher.displayRole();
    print("Name: ${teacher.getName()}");
    print("Age: ${teacher.getAge()}");
    print("Address: ${teacher.getAddress()}");
    teacher.displayCoursesTaught();
  }
}

//==============================================================================

void main() {
  StudentManagementSystem.main();
}
