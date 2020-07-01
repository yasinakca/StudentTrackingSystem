import 'package:flutter/material.dart';
import 'package:studenttracking/models/student.dart';
import 'package:studenttracking/validator/student_validation.dart';

class AddStudent extends StatefulWidget{

  List<Student> students;

  AddStudent(List<Student> students) {
    this.students = students;
  }

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _AddStudentState(students);
  }

}

class _AddStudentState extends State<AddStudent> with StudentValidationMixin{

  List<Student> students;

  _AddStudentState(List<Student> students) {
    this.students = students;
  }

  var formKey = GlobalKey<FormState>();
  Student student = Student.withoutInfo();
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Student"),
      ),
      body: Container(
        margin: EdgeInsets.all(20.0),
        child: Form(
          key: formKey,
          child: Column(
            children: <Widget>[
              buildFirstNameField(),
              buildLastNameField(),
              buildGradeField(),
              buildSubmitButton()
            ],
          ),
        ),
      )
    );
  }

  Widget buildFirstNameField() {
    return TextFormField(
      decoration: InputDecoration(labelText: "First Name", hintText: "Enter the first name"),
      validator: validateFirstName,
      onSaved: (String value) {
        student.firstName = value;
      },
    );
  }

  Widget buildLastNameField() {
    return TextFormField(
      decoration: InputDecoration(labelText: "Last Name", hintText: "Enter the last name"),
      validator: validateLastName,
      onSaved: (String value) {
        student.lastName = value;
      },
    );
  }

  Widget buildGradeField() {
    return TextFormField(
      decoration: InputDecoration(labelText: "Grade", hintText: "Enter the grade"),
      validator: validateGrade,
      onSaved: (String value) {
        student.grade = int.parse(value);
      },
    );
  }

  Widget buildSubmitButton() {
    return RaisedButton(
      child: Text("Save"),
      onPressed: () {
        if(formKey.currentState.validate()) {
          formKey.currentState.save();
          students.add(student);
          print("Success");
        }
      },
    );
  }
}