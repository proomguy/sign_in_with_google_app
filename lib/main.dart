import 'package:flutter/material.dart';
import 'package:google_signin_app/controller_login.dart';
import 'package:google_signin_app/log_in_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ControllerLogin())
      ],
      child: MaterialApp(
        title: 'Google Sign IN APP',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        debugShowCheckedModeBanner: false,
        home: LogInScreen(),
      ),
    );
  }
}


