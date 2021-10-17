import 'package:flutter/material.dart';
import 'student.dart';

void main() {
  runApp(Main());
}

List<Student> students = [
  Student(name: 'Ahmad Tamimi',id: '03/0577', gpa: 85.6, year: 1984),
  Student(name: 'Tala Hamed',id: '20/1177', gpa: 90.7, year: 2001),
  Student(name: 'ٌRawan Ashour',id: '18/6039', gpa: 83.6, year: 2000),
  Student(name: 'Mutasem Alheeh',id: '03/0177', gpa: 91.1, year: 1984),
];

class Main extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
          backgroundColor: Colors.cyan,
          appBar: AppBar(
            title: Text('Student App'),
            centerTitle: true,
          ),
          body: ListView(
            children: [
              GestureDetector(
                child: StudentCard(std: students[0],action: 'Tap',),
                onTap: () {
                  print(students[0].toString());
                },
              ),
              GestureDetector(
                child: StudentCard(std: students[1],action: 'Double tap',),
                onDoubleTap: () {
                  print(students[1].toString());
                },
              ),
              GestureDetector(
                child: StudentCard(std: students[2],action: 'Long press',),
                onLongPress: () {
                  print(students[2].toString());
                },
              ),
              GestureDetector(
                child: StudentCard(std: students[3],action: 'Drag right/left',),
                onHorizontalDragEnd: (x) {
                  print(students[3].toString());
                },
              ),
            ],
          ),
        )
    );
  }
}
class StudentCard extends StatelessWidget {
  final Student std;
  final String action;
  StudentCard({this.std,this.action});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Container(
        height: 150.0,
        child: Card(
          elevation: 10.0,
          color: Colors.white70,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text('Name: ', style: TextStyle(fontSize: 23,fontWeight: FontWeight.bold),),
                            Text(this.std.name, style: TextStyle(fontSize: 22,letterSpacing: 2.0),),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text('Id: ', style: TextStyle(fontSize: 23,fontWeight: FontWeight.bold),),
                            Text(this.std.id, style: TextStyle(fontSize: 22,letterSpacing: 2.0),),
                          ],
                        ),
                      ],
                    ),
                    //Image.asset('images/anonymous.jpg',width: 40,height: 40,),
                    CircleAvatar(
                      backgroundImage: AssetImage('assets/images/anonymous.jpg'),
                      radius: 40.0,
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text('${this.action} to show details'),
                    Icon(Icons.navigate_next,size: 30,)
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}