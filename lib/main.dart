import 'package:crud/pages/home_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  Future<FirebaseApp> _initiliazation = Firebase.initializeApp();
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _initiliazation,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            print("Somwthing went wrong");
          } else if (snapshot.connectionState == ConnectionState.done) {
            return MaterialApp(
              title: "CRUD App",
              theme: ThemeData(primarySwatch: Colors.blue),
              debugShowCheckedModeBanner: false,
              home: Homepage(),
            );
          }
          return CircularProgressIndicator();
        });
  }
}
