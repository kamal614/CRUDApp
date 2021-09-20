import 'package:flutter/material.dart';

class updateStudent extends StatefulWidget {
  const updateStudent({Key? key}) : super(key: key);

  @override
  _updateStudentState createState() => _updateStudentState();
}

class _updateStudentState extends State<updateStudent> {
  final _formKey = GlobalKey<FormState>();
  updateUser() {
    print("User info updates");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Update User"),
      ),
      body: Form(
          key: _formKey,
          child: ListView(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 30.0),
                child: TextFormField(
                  autofocus: false,
                  initialValue: "Kamal",
                  onChanged: (value) => {},
                  decoration: InputDecoration(
                      labelText: "Name",
                      border: OutlineInputBorder(),
                      errorStyle: TextStyle(color: Colors.red)),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter name";
                    } else {
                      return null;
                    }
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 30.0),
                child: TextFormField(
                  autofocus: false,
                  initialValue: "Kamal@gmail.com",
                  onChanged: (value) => {},
                  decoration: InputDecoration(
                      labelText: "Email",
                      border: OutlineInputBorder(),
                      errorStyle: TextStyle(color: Colors.red)),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter email";
                    } else if (!value.contains("@") && !value.contains(".")) {
                      return "Please enter correct email";
                    } else {
                      return null;
                    }
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 30.0),
                child: TextFormField(
                  autofocus: false,
                  obscureText: true,
                  initialValue: "123456789",
                  onChanged: (value) => {},
                  decoration: InputDecoration(
                      labelText: "Password",
                      border: OutlineInputBorder(),
                      errorStyle: TextStyle(color: Colors.red)),
                  validator: (value) {
                    if (value == null || value.isEmpty || value.length <= 6) {
                      return "Please enter password";
                    } else {
                      return null;
                    }
                  },
                ),
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            updateUser();
                            Navigator.pop(context);
                          }
                        },
                        child: Text("Update")),
                    ElevatedButton(onPressed: () {}, child: Text("Reset"))
                  ],
                ),
              ),
            ],
          )),
    );
  }
}
