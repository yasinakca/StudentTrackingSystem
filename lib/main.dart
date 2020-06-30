import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: MyApp()
  ));
}

class MyApp extends StatelessWidget {
  List<String> students = ["Yasin Akca","Emir Parlak","Yigit Caglar"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Student Tracking"),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: ListView.builder(
                itemCount: students.length,
                itemBuilder: (BuildContext context, int index) {
                  return Text(students[index]);
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
      ),
    );
  }

}