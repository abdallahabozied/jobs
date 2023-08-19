import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:jobsque/Pages/Home%20&%20Search/Home_Home.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';


// Future <SharedPreferences> AddstringtoSharedPrefrence (String key,String name)async{
//   var saved = await SharedPreferences.getInstance();
//   saved.setString("{$key}",name);
//   return saved ;
// }
// Future <String?> getstringfromSharedPrefrence (String key)async{
//   var saved = await SharedPreferences.getInstance();
//   var x = saved.getString("{$key}");
//   return x ;
// }







Future<UserCredential> signInWithGoogle() async {
  // Trigger the authentication flow
  final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

  // Obtain the auth details from the request
  final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

  // Create a new credential
  final credential = GoogleAuthProvider.credential(
    accessToken: googleAuth?.accessToken,
    idToken: googleAuth?.idToken,
  );

  // Once signed in, return the UserCredential
  return await FirebaseAuth.instance.signInWithCredential(credential);
}

extension EmailValidator on String {
  bool isValidEmail() {
    return RegExp(
            r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
        .hasMatch(this);
  }
}

class Animal {
  final int? id;
  final String? name;

  Animal({
    this.id,
    this.name,
  });
}

class Job_Type {
  final int? id;
  final String? name;

  Job_Type({
    this.id,
    this.name,
  });
}

List<Step> getSteps() => [
      Step(
          label: Text("BioData"),
          title: Divider(),
          content: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Type of work"),
              Text("Type of work"),
              Text("Type of work"),
              Text("Type of work"),
              Text("Type of work"),
              Text("Type of work"),
              Text("Type of work"),
              Text("Type of work"),
              Text("Type of work"),
              Text("Type of work"),
              Text("Type of work"),
              Text("Type of work"),
              Text("Type of work"),
              Text("Type of work"),
              Text("Type of work"),
              Text("Type of work"),

            ],
          )),
      Step(
          label: Text("Type of work"),
          title: Divider(),
          content: Center(child: Text("hello2"))),
      Step(
          label: Text("Upload Portofolio"),
          title: Divider(),
          content: Center(child: Text("hello3"))),
    ];
