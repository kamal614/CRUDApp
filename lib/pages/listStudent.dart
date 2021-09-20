import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crud/pages/updateStudent.dart';
import 'package:flutter/material.dart';

class listStudent extends StatefulWidget {
  const listStudent({Key? key}) : super(key: key);

  @override
  _listStudentState createState() => _listStudentState();
}

class _listStudentState extends State<listStudent> {
  final Stream<QuerySnapshot> userStream =
      FirebaseFirestore.instance.collection('Users').snapshots();
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: userStream,
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            print("An error occured");
          } else if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          final List userList = [];
          snapshot.data!.docs.map((DocumentSnapshot document) {
            Map usersss = document.data() as Map<String, dynamic>;
            userList.add(usersss);
            print(usersss);
          }).toList();
          return Container(
            margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Table(
                border: TableBorder.all(),
                columnWidths: const <int, TableColumnWidth>{
                  1: FixedColumnWidth(140)
                },
                defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                children: [
                  TableRow(children: [
                    TableCell(
                      child: Container(
                        color: Colors.lightBlueAccent,
                        child: Center(
                          child: Text(
                            'Name',
                            style: TextStyle(
                                fontSize: 20.0, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                    TableCell(
                      child: Container(
                        color: Colors.lightBlueAccent,
                        child: Center(
                          child: Text(
                            'Email',
                            style: TextStyle(
                                fontSize: 20.0, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                    TableCell(
                      child: Container(
                        color: Colors.lightBlueAccent,
                        child: Center(
                          child: Text(
                            'Action',
                            style: TextStyle(
                                fontSize: 20.0, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    )
                  ]),
                  for (var i = 0; i < userList.length; i++) ...[
                    TableRow(children: [
                      TableCell(
                        child: Center(
                          child: Text(
                            userList[i]["name"],
                            style: TextStyle(fontSize: 18.0),
                          ),
                        ),
                      ),
                      TableCell(
                        child: Center(
                          child: Text(
                            
                            userList[i]["email"],
                            style: TextStyle(fontSize: 18.0),
                          ),
                        ),
                      ),
                      TableCell(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            IconButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              updateStudent()));
                                },
                                icon: Icon(Icons.edit)),
                            IconButton(
                                onPressed: () {}, icon: Icon(Icons.delete))
                          ],
                        ),
                      ),
                    ]),
                  ]
                ],
              ),
            ),
          );
        });
  }
}
