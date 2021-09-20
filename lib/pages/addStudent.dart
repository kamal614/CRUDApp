import 'package:flutter/material.dart';

class addStudent extends StatefulWidget {
  addStudent({Key? key}) : super(key: key);

  @override
  _addStudentState createState() => _addStudentState();
}

class _addStudentState extends State<addStudent> {
  final _formKey = GlobalKey<FormState>();
  var name = "";
  var email = "";
  var password = "";
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  addUser() {
    print("User added");
  }

  clearText() {
    nameController.clear();
    emailController.clear();
    passwordController.clear();
  }

  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add User info"),
      ),
      body: Form(
          key: _formKey,
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 20.0),
            child: ListView(
              children: [
                Container(
                  margin:
                      EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                  child: TextFormField(
                      autofocus: false,
                      decoration: InputDecoration(
                        labelText: "Name",
                        border: OutlineInputBorder(),
                        errorStyle:
                            TextStyle(color: Colors.red, fontSize: 15.0),
                      ),
                      controller: nameController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please Enter your name";
                        }
                        return null;
                      }),
                ),
                Container(
                  margin:
                      EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                  child: TextFormField(
                      autofocus: false,
                      decoration: InputDecoration(
                        labelText: "Email",
                        border: OutlineInputBorder(),
                        errorStyle:
                            TextStyle(color: Colors.red, fontSize: 15.0),
                      ),
                      controller: emailController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please Enter your Email";
                        } else if (!value.contains("@") &&
                            !value.contains(".")) {
                          return "Please enter correct email";
                        }
                        return null;
                      }),
                ),
                Container(
                  margin:
                      EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                  child: TextFormField(
                      obscureText: true,
                      autofocus: false,
                      decoration: InputDecoration(
                        labelText: "Password",
                        border: OutlineInputBorder(),
                        errorStyle:
                            TextStyle(color: Colors.red, fontSize: 15.0),
                      ),
                      controller: TextEditingController(),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please Enter Password";
                        } else if (value.length <= 6) {
                          return "Minimum Password length should be 6";
                        }

                        return null;
                      }),
                ),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ElevatedButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              setState(() {
                                name = nameController.text;
                                email = emailController.text;
                                password = passwordController.text;
                                addUser();
                                clearText();
                              });
                            }
                          },
                          child: Text("Submit")),
                      ElevatedButton(
                          onPressed: () {
                            clearText();
                          },
                          child: Text("Reset"))
                    ],
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
