import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:file_picker/file_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:dio/dio.dart';


Future uploadPdf() async {
  SharedPreferences savedlogin = await SharedPreferences.getInstance();
  String token = savedlogin.getString("token")!;
  print(token);
  var dio = Dio();
  FilePickerResult? result = await FilePicker.platform.pickFiles();
  FilePickerResult? result2 = await FilePicker.platform.pickFiles();
  if (result != null && result2 != null) {
    File image_file = File(result.files.single.path ?? " ");
    File cv_file = File(result2.files.single.path ?? " ");
    // print("=====================================");
    // print(image_file);
    // print(cv_file);
    // String imagefilename = image_file.path.split('/').last;
    String imagefilepath = image_file.path;

    // String cvfilename = cv_file.path.split('/').last;
    String cvpath = cv_file.path;
    // print("$imagefilepath");
    // print(cvpath);
    FormData formdata = FormData.fromMap({
      "cv_file": await MultipartFile.fromFile(cvpath),
      "image": await MultipartFile.fromFile(imagefilepath)
    });
    Response response = await dio
        .post("https://project2.amit-learning.com/api/user/profile/portofolios",
        options: Options(
            headers: {
              "Authorization": "Bearer $token",
              "Content-Type": "multipart/form-data",
              "Accept": "application/json",
            },
            followRedirects: false,
            validateStatus: (status) {
              return status! < 500;
            }),
        data: formdata, onSendProgress: (int sent, int total) {
          print("$sent   from $total");
        });
    if (response.statusCode == 200) {
      print("uploaded successfully");
      print(response.statusMessage);
      print(response.statusCode);
    } else {
      print("======cant upload========");
      print(response.toString());
      print(response.statusCode);
      print(response.statusMessage);
    }
  }
}
Future AddtoApplied(String name ,String email , String mobile , String work_type , String jobsid , String userid) async {
  SharedPreferences savedlogin = await SharedPreferences.getInstance();
  String token = savedlogin.getString("token")!;
  print(token);
  var dio = Dio();
  FilePickerResult? result = await FilePicker.platform.pickFiles();
  FilePickerResult? result2 = await FilePicker.platform.pickFiles();
  if (result != null && result2 != null) {
    File other_file = File(result.files.single.path ?? " ");
    File cv_file = File(result2.files.single.path ?? " ");

    String otherfilepath = other_file.path;


    String cvpath = cv_file.path;

    FormData formdata = FormData.fromMap({
      "cv_file": await MultipartFile.fromFile(cvpath),
      "other_file": await MultipartFile.fromFile(otherfilepath),
      "name":name.toString(),
      "email":email.toString(),
      "mobile":mobile.toString(),
      "work_type":work_type.toString(),
      "jobs_id":jobsid.toString(),
      "user_id":userid.toString()

    });
    Response response = await dio
        .post("https://project2.amit-learning.com/api/apply",
        options: Options(
            headers: {
              "Authorization": "Bearer $token",
              "Content-Type": "multipart/form-data",
              "Accept": "application/json",
            },
            followRedirects: false,
            validateStatus: (status) {
              return status! < 500;
            }),
        data: formdata, onSendProgress: (int sent, int total) {
          print("$sent   from $total");
        });
    if (response.statusCode == 200) {
      print("uploaded successfully");
      print(response.statusMessage);
      print(response.statusCode);
    } else {
      print("======cant upload========");
      print(response.toString());
      print(response.statusCode);
      print(response.statusMessage);
    }
  }
}

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

class Intested_joblocation {
  final int? id;
  final String? name;

  Intested_joblocation({
    this.id,
    this.name,
  });
}
class Intested_jobtypes {
  final int? id;
  final String? name;

  Intested_jobtypes({
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
class Message {

  String? text;
  DateTime? date ;
  bool? issentbyme;

  Message({required this.text , required this.date , required this.issentbyme});

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

