import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:google_signin_app/controller_login.dart';
import 'package:provider/provider.dart';

final GoogleSignIn googleSignIn = GoogleSignIn();

class LogInScreen extends StatefulWidget {
  const LogInScreen({Key? key}) : super(key: key);

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {

  loginUIController(){
    return Consumer<ControllerLogin>(
      builder: (context, model, child){
        //This checks if the user is already logged in
        if(model.userDetailsModels != null){
          return Center(
            //Wll show the home screen
            child: alreadyLoggedInScreen(model),

          );
        }
        //If the user is not logged in
        else{
          //Show sign in screen
          return notLoggedInScreen();
        }
      },
    );
  }

  notLoggedInScreen(){
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.all(10.0),
            child: Image.asset('assets/googleback.jpg'),
          ),
          GestureDetector(
            onTap: (){
              Provider.of<ControllerLogin>(context, listen: false).allowUserToLogin();
            },
            child: Image.asset('assets/google.png', width: 250,),
          ),
        ],
      ),
    );
  }

  alreadyLoggedInScreen(ControllerLogin model){
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CircleAvatar(
          backgroundImage: Image.network(model.userDetailsModels!.photoURL ?? "").image,
          radius: 100,
        ),
        SizedBox(height: 20.0,),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.person,
              color: Colors.deepPurpleAccent,
            ),
            SizedBox(width: 20,),
            Text(
              model.userDetailsModels!.displayName ?? "",
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold, color: Colors.amber),
            ),
          ],
        ),
        SizedBox(height: 20.0,),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.email,
              color: Colors.deepPurpleAccent,
            ),
            SizedBox(width: 20,),
            Text(
              model.userDetailsModels!.email ?? "",
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold, color: Colors.amber),
            ),
          ],
        ),
        SizedBox(height: 20.0,),
        ActionChip(
          backgroundColor: Colors.black,
          avatar: Padding(
            padding: EdgeInsets.only(left: 15.0, right: 15.0),
            child: Icon(
              Icons.logout,
              color: Colors.white,
            ),
          ),
          label: Padding(
            padding: EdgeInsets.only(left: 15.0, right: 15.0),
            child: Text(
              'Logout',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold
              ),
            ),
          ),
          onPressed: (){
            Provider.of<ControllerLogin>(context, listen: false).allowUserToLogOut();
          },
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: loginUIController(),
    );
  }
}
