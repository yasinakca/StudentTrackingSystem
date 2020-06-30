import 'package:flutter/material.dart';

import 'models/student.dart';

void main() {
  runApp(MaterialApp(
    home: MyApp()
  ));
}

class MyApp extends StatelessWidget {
  List<Student> students = [
    Student("Yasin","Akca",60),
    Student("Emir","Parlak",40)
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
                );
              }
          ),
        ),
        Center(
            child: RaisedButton(
              child: Text("See the result"),
              onPressed: () {
                String message;
                int grade = 50;
                if(grade > 50) {
                  message = "Passed";
                }else {
                  message = "Failed";
                }
                var alert = AlertDialog(
                  title: Text("Alert"),
                  content: Text(message),
                );
                showDialog(context: context, builder: (BuildContext context) => alert);
              },
            )
        ),
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