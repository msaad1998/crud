import 'package:flutter/material.dart';

import 'package:firebase_core/firebase_core.dart';
import 'homepage.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();
  MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _initialization,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          print("something went wrong");
        }
        if (snapshot.connectionState == ConnectionState.done) {
          print("done");
          return MaterialApp(
            title: 'Flutter Demo',
            theme: ThemeData(
              primarySwatch: Colors.blue,
            ),
            debugShowCheckedModeBanner: false,
            home: HomePage(),
          );
        }

        return CircularProgressIndicator();
      },
    );
  }
}
