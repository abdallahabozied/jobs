import 'dart:convert';
import 'dart:io';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as varHTTP;
import 'package:http/http.dart';
import 'package:jobsque/Model/Job.dart';
import 'package:jobsque/Model/profileModel.dart';
import 'package:shared_preferences/shared_preferences.dart';

List<Map<String,dynamic>> list = []; //jobs
List list2 = []; //photos
List listofsavedjobs=[];
List listofappliedjobs =[];
List list4=[];
late int id ;
late String name="";
late String token="";
late String email="";

class HTTPConnections {
  String baseurl = "https://jsonplaceholder.typicode.com/";
  String APIbase = "https://project2.amit-learning.com/api/";
  String profileendpoint = "auth/profile/";
  String postEndPoint = "posts";
  String photosEndPoint = "photos";
  var client = varHTTP.Client();


  void signup(String name, String email, String password) async {
    try {
      Response response = await post(
          Uri.parse("https://project2.amit-learning.com/api/auth/register"),
          body: {
            "name": name,
            "email": email,
            "password": password,
          }
      );
      if (response.statusCode == 200) {
        print("account created successfully");
      } else {
        print("failed to post user to server");
      }
    } catch (e) {
      print(e.toString());
    }
  }

  Future<bool?> login(String email, String password) async {
    String APIbase = "https://project2.amit-learning.com/api/";
    varHTTP.Response response = await varHTTP.post(
        Uri.parse(APIbase + "auth/login"),
        body: {
          "email": email,
          "password": password,
        });
    String body = response.body;
    Map<String, dynamic> _user = jsonDecode(body);
    if (response.statusCode == 200) {
      print("==============================");
      print(response.body);
      print("==============================");
      SharedPreferences savedlogin = await SharedPreferences.getInstance();
      savedlogin.setInt("id", _user["user"]["id"]);
      savedlogin.setString("name", _user["user"]["name"]);
      savedlogin.setString("email", _user["user"]["email"]);
      savedlogin.setString("token", _user["token"]);
      print("The token is =====================================>");
      print(savedlogin.getString("token"));
      return true;
    } else
      return false;
  }

  Future<Profile> fetchuser() async {
    SharedPreferences savedlogin = await SharedPreferences.getInstance();
    id = savedlogin.getInt("id")!;
    token = savedlogin.getString("token")!;
    varHTTP.Response response = await varHTTP.get(
        Uri.parse(APIbase + profileendpoint + "$id"),
        headers: {"Authorization": "Bearer $token"}
    );
    String body = response.body;
    print(body);
    Map<String, dynamic> _user = jsonDecode(body);
    if (response.statusCode == 200) {
      Profile _profile = Profile.fromJson(_user["data"]);
      print("====================================================== "+"${token}");
      //  name= _profile.name;
      //  email = _profile.email;
      //  SharedPreferences savedlogin = await SharedPreferences.getInstance();
      //savedlogin.setString("name", _profile.name) ;
      //savedlogin.setString("email", _profile.email);
      name = savedlogin.getString("name")!;
      email = savedlogin.getString("email")!;
      //  print(_profile.name);
      return _profile;
    } else {
      throw Exception();
    }
  }

  Future<List?> GetAllPostswithphotos() async {
    SharedPreferences savedlogin = await SharedPreferences.getInstance();
    token = savedlogin.getString("token")!;
    var response = await client.get(
        Uri.parse("https://project2.amit-learning.com/api/jobs"),
        headers: {"Authorization": "Bearer $token"}
    );
    Map<String, dynamic> responsebody = jsonDecode(response.body);
    if (response.statusCode == 200) {
      return responsebody["data"];
    } else {
      print("cannont get all posts");
    }
  }

  void Addtosaved(int user_id, int job_id) async {
     SharedPreferences savedlogin = await SharedPreferences.getInstance();
     token = savedlogin.getString("token")!;
     try{
       Response response = await post(
           Uri.parse("https://project2.amit-learning.com/api/favorites"),
           body: {
             "job_id": job_id.toString(),
             "user_id": user_id.toString(),
           },headers: {"Authorization":"Bearer $token"}
       );
       if (response.statusCode == 200) {

         print("Added to saved posts");
       }
     }
         catch(e){
       print("the error is ============");
       print(e.toString());
         }

  }

  Future<List?> Getsavedjobs()async{
    SharedPreferences savedlogin = await SharedPreferences.getInstance();
    id = savedlogin.getInt("id")!;
    token = savedlogin.getString("token")!;
    var response = await client.get(
        Uri.parse("https://project2.amit-learning.com/api/favorites/$id"),
        headers: {"Authorization": "Bearer $token"}
    );
    Map<String, dynamic> responsebody = jsonDecode(response.body);
    if (response.statusCode == 200) {
      listofsavedjobs= responsebody["data"];
      return listofsavedjobs;
    } else {
      print("cannont get all posts");
    }
  }

  void deleteSavedJob(int jobid) async {
      try{
        Response response =
        await client.delete(Uri.parse("https://project2.amit-learning.com/api/favorites/${jobid.toString()}"),
            headers: {"Authorization":"Bearer $token"});
        if (response.statusCode == 200) {
          print("deleted from saved");
        }else{

          print("response code error is "+ "${response.statusCode}");
          print("cannot delete from saved ");
        }
      }catch(e){
        print(e.toString());
      }
    }

  void AddtoApplied(int user_id,int job_id ,String name ,String email , String mobile, String work_type) async {
    SharedPreferences savedlogin = await SharedPreferences.getInstance();
    token = savedlogin.getString("token")!;
    try{
      Response response = await post(
          Uri.parse("https://project2.amit-learning.com/api/apply"),
          body: {
            "jobs_id": job_id.toString(),
            "user_id": user_id.toString(),
            "name": name.toString(),
            "email": email.toString(),
            "mobile": mobile.toString(),
            "work_type": work_type.toString(),

          },headers: {"Authorization":"Bearer $token"}
      );
      if (response.statusCode == 200) {
        print("Added to Applied jobs");
        print (user_id);
        print(job_id);
        print(name);
        print(email);
        print(mobile);
        print(token);
        print(work_type);
      }
      else{
        print (user_id);
        print(job_id);
        print(name);
        print(email);
        print(mobile);
        print(token);
        print(work_type);

      }
    }
    catch(e){
      print("the error is ============");
      print(e.toString());
    }

  }

  Future<List?> GetAppliedjobs()async{
    SharedPreferences savedlogin = await SharedPreferences.getInstance();
    id = savedlogin.getInt("id")!;
    token = savedlogin.getString("token")!;
    var response = await client.get(
        Uri.parse("https://project2.amit-learning.com/api/apply/$id"),
        headers: {"Authorization": "Bearer $token"}
    );
    Map<String, dynamic> responsebody = jsonDecode(response.body);
    if (response.statusCode == 200) {
      listofappliedjobs = responsebody["data"];
      print(responsebody["data"]);
      return listofappliedjobs;
    } else {
      print("cannont get all posts");
    }
  }

  Future<Map<String,dynamic>> fetchjob(int job_id) async {
    SharedPreferences savedlogin = await SharedPreferences.getInstance();
    id = savedlogin.getInt("id")!;
    token = savedlogin.getString("token")!;
  Response response =
  await client.get(Uri.parse("https://project2.amit-learning.com/api/jobs/$job_id"),
      headers: {"Authorization": "Bearer $token"},
  );
  String resposebody = response.body;
  Map<String, dynamic> _map = jsonDecode(resposebody);
  if (response.statusCode == 200) {
    return _map["data"];
  } else {
    print("Cannot retrieve Job with id $id");
    throw Exception("Cannot retrieve Job with id $id");
  }
}



  Future<bool> EditProfile(String bio , String address , String mobile ) async {
    SharedPreferences savedlogin = await SharedPreferences.getInstance();
    id = savedlogin.getInt("id")!;
    token = savedlogin.getString("token")!;
    Response response =
    await client.put(Uri.parse("https://project2.amit-learning.com/api/user/profile/edit/$id"),
      body: {
      "bio": bio.toString(),
      "address": address.toString(),
      "mobile": mobile.toString()
      },
      headers: {"Authorization": "Bearer $token"},
    );
    String resposebody = response.body;
    // Map<String, dynamic> _map = jsonDecode(resposebody);
    if (response.statusCode == 200) {
      print("user data edited");
      print(resposebody);
      return true;
    } else {
      print("Cannot edit data for this user");
      return false;
    }

  }
  void AddPortofolio(File cv_file) async {
    SharedPreferences savedlogin = await SharedPreferences.getInstance();
    id = savedlogin.getInt("id")!;
    savedlogin.setString("image", cv_file.path);
    token = savedlogin.getString("token")!;
    try{

      Response response = await post(
          Uri.parse("https://project2.amit-learning.com/api/user/profile/portofolios/$id"),
          body: {
            "cv_file": cv_file.path,
            "name": "cv",
            "image": "File path:[com.mr.flutter.plugin.filepicker.FileInfo@113c58a]",
          }
          ,headers: {"Authorization":"Bearer $token"}
      );

      if (response.statusCode == 200) {
        print("Added to Portofolios");
      }
      else{
        // print(id);
        // print(token);
        print(savedlogin.getString("image"));
        // print(token.toString());
        print("Not Added to Portofolios");
      }
    }
    catch(e){
      print("the error is ============");
      print(e.toString());
    }

  }

  Future<void> uploadFile(File file) async {
    SharedPreferences savedlogin = await SharedPreferences.getInstance();
    id = savedlogin.getInt("id")!;

   var uri = Uri.parse('https://project2.amit-learning.com/api/user/profile/portofolios/$id');
    token = savedlogin.getString("token")!;

    var request = MultipartRequest('POST',uri);
    request.files.add(await MultipartFile.fromPath('cv_file', file.absolute.path));
   // request.fields["cv_file"]= cv_file;
    request.fields["image"]= "/data/user/0/com.example.jobsque/cache/file_picker/FB_IMG_1691616401697.jpg";
    request.fields["name"]= "abdallah";
    var response = await request.send();
    if (response.statusCode == 200) {
      print('File uploaded successfully');
    } else {
     // print(image);
      print(name);
      print('Error uploading file');
    }
  }

  }


// Future<Profile> fetchuser() async {
//   String  token = "Bearer 645|JEwbkvocOCjqgrWJLBVB46R6hCMGGeNxiTPTwvG7";
//   Response response =
//   await varHTTP.get(Uri.parse(APIbase + profileendpoint),
//       headers:{"Authorization":"$token" });
//   String body = response.body;
//   print(body);
//   Map<String,dynamic> _user = jsonDecode(body);
//   if (response.statusCode == 200) {
//     Profile _profile = Profile.fromJson(_user["data"]);
//     print("======================================================");
//     print(_profile.name);
//     return _profile;
//   } else {
//     throw Exception();
//   }
// }

//   Future<Job> fetchpost(int id) async {
//   Response response =
//   await client.get(Uri.parse(baseurl + postEndPoint + "/$id"));
//   String resposebody = response.body;
//   Map<String, dynamic> _map = jsonDecode(resposebody);
//   if (response.statusCode == 200) {
//     Job _post = Job.fromJson(_map);
//     return _post;
//   } else {
//     print("Cannot retrieve Job with id $id");
//     throw Exception("Cannot retrieve Job with id $id");
//   }
// }

// Future<Job> fetchphotos(int id) async {
//   Response response =
//   await client.get(Uri.parse(baseurl + photosEndPoint + "/$id"));
//   String resposebody = response.body;
//   Map<String, dynamic> _map = jsonDecode(resposebody);
//   if (response.statusCode == 200) {
//     Job _photo = Job.fromJson(_map);
//     return _photo;
//   } else {
//     print("Cannot retrieve photo with id $id");
//     throw Exception("Cannot retrieve photo with id $id");
//   }