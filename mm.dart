import 'dart:io';

class Student {
  String name;
  double course;
  double yearlevel;
  double id;


  Student(this.name, this.course, this.yearlevel,  this.id);
}


void pressEnterToContinue() {
  stdout.write('\nPress Enter to return to the Main Menu...');
  stdin.readLineSync();
}

void main() {
  List<Student> student = [];
  bool running = true;
  double currentIdCounter = 1.0; 

  while (running) {
    print('\n==================================');
    print('    STUDENT MANAGEMENT SYSTEM     ');
    print('==================================');
    print('1. Add student (Auto-ID)');
    print('2. View student list');
    print('3. Edit student');
    print('4. Delete student');
    print('5. Exit');
    stdout.write('Choose an option (1-5): ');
    String? choice = stdin.readLineSync();

    switch (choice) {
      case '1':
        addStudent();
        break;

      case '2':
        print('\n--- Student List ---');
        if (student.isEmpty) {
          print('No students found in the database.');
        } else {
          for (var s in student) {
            print('ID: ${s.id}  | course: ${s.course}  | yearlevel: ${s.yearlevel}  | Name: ${s.name}   '      );
          }
        }
        pressEnterToContinue();
        break;

      case '3':
        print('\n--- Edit Student ---');
        stdout.write('Enter the ID of the student to edit: ');
        double? searchId = double.tryParse(stdin.readLineSync() ?? '');
        
        if (searchId == null) {
          print(' Invalid ID format.');
          pressEnterToContinue();
          break;
        }

        Student? studentToEdit;
        for (var s in student) {
          if (s.id == searchId) {
            studentToEdit = s;
            break;
          }
        }

        if (studentToEdit != null) {
          stdout.write('Enter new name (leave blank to keep "${studentToEdit.name}"): ');
          String? newName = stdin.readLineSync();
          if (newName != null && newName.isNotEmpty) {
            studentToEdit.name = newName;
          }
          print(' Student updated successfully!');
        } else {
          print(' Student with ID $searchId not found.');
        }
        pressEnterToContinue();
        break;

      case '4':
        print('\n--- Delete Student ---');
        stdout.write('Enter the ID of the student to delete: ');
        double? deleteId = double.tryParse(stdin.readLineSync() ?? '');

        if (deleteId == null) {
          print(' Invalid ID format.');
          pressEnterToContinue();
          break;
        }

        int initialLength = student.length;
        student.removeWhere((s) => s.id == deleteId);

        if (student.length < initialLength) {
          print(' Student deleted successfully!');
        } else {
          print(' Student with ID $deleteId not found.');
        }
        pressEnterToContinue();
        break;

      case '5':
        print('\n Exiting system. Goodbye!');
        running = false;
        break;

      default:
        print('\n Invalid choice. Please select from options 1 to 5.');
        pressEnterToContinue();

    }
  }
}

void addStudent(){

}
