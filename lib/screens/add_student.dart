import 'package:flutter/material.dart';

class AddStudent extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _AddStudentState();
  }

}

class _AddStudentState extends State<AddStudent>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Student"),
      ),
      body: Center(
        child: Text("Form Area"),
      ),
    );
  }
}