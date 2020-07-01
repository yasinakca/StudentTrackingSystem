import 'package:flutter/material.dart';
import 'package:studenttracking/screens/add_student.dart';

import 'models/student.dart';

void main() {
  runApp(MaterialApp(
    home: MyApp()
  ));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  Student selectedStudent = Student.withId(0, "", "", 0);

  List<Student> students = [
    Student.withId(1,"Yasin","Akca",60),
    Student.withId(2,"Emir","Parlak",40)
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Student Tracking"),
      ),
      body: buildBody(context)
    );
  }

  Widget buildBody(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
          child: ListView.builder(
              itemCount: students.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage("https://cdn.pixabay.com/photo/2016/11/18/23/38/child-1837375_1280.png"),
                  ),
                  title: Text(students[index].firstName + " " + students[index].lastName),
                  subtitle: Text(students[index].grade.toString()),
                  trailing: buildIcon(students[index].grade),
                  onTap: () {
                    setState(() {
                      selectedStudent = students[index];
                    });
                  },
                );
              }
          ),
        ),
        Text(selectedStudent.firstName),
        Row(
          children: <Widget>[
            Flexible(
              fit: FlexFit.tight,
              flex: 1,
              child: RaisedButton(
                color: Colors.amberAccent,
                child: Row(
                  children: <Widget>[
                    Icon(Icons.add),
                    SizedBox(width: 5),
                    Text("Add")
                  ],
                ),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => AddStudent(students)));
                },
              ),
            ),
            Flexible(
              fit: FlexFit.tight,
              flex: 1,
              child: RaisedButton(
                color: Colors.blueAccent,
                child: Row(
                  children: <Widget>[
                    Icon(Icons.update),
                    SizedBox(width: 5),
                    Text("Update")
                  ],
                ),
                onPressed: () {

                },
              ),
            ),
            Flexible(
              fit: FlexFit.tight,
              flex: 1,
              child: RaisedButton(
                color: Colors.purpleAccent,
                child: Row(
                  children: <Widget>[
                    Icon(Icons.delete),
                    SizedBox(width: 5),
                    Text("Delete")
                  ],
                ),
                onPressed: () {
                  setState(() {
                    students.remove(selectedStudent);
                    selectedStudent = Student.withId(0, "", "", 0);
                  });
                },
              ),
            )
          ],
        )
      ],
    );
  }

  Widget buildIcon(int grade) {
    if(grade > 50) {
      return Icon(Icons.done);
    }else{
      return Icon(Icons.cancel);
    }
  }
}