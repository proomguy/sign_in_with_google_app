import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:google_signin_app/user_details_models.dart';

class ControllerLogin with ChangeNotifier{

  var googleSignInNow = GoogleSignIn();
  GoogleSignInAccount? googleSignInAccount;

  UserDetailsModels? userDetailsModels;

  allowUserToLogin() async{
    this.googleSignInAccount = await googleSignInNow.signIn();
    this.userDetailsModels = new UserDetailsModels(
      displayName: this.googleSignInAccount!.displayName,
      email: this.googleSignInAccount!.email,
      photoURL: this.googleSignInAccount!.photoUrl
    );
  }

  allowUserToLogOut() async{
    this.googleSignInAccount = await googleSignInNow.signOut();
    userDetailsModels = null;
    notifyListeners();
  }

}