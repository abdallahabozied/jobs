import 'dart:convert';
import 'package:jobsque/Model/Job.dart';
import 'package:http/http.dart' as varHTTP;
import 'package:http/http.dart';
import 'package:jobsque/Model/profileModel.dart';
import 'package:shared_preferences/shared_preferences.dart';

List<Map<String,dynamic>> list = []; //jobs
List list2 = []; //photos
List list3=[];
late int id ;
late String name="";
late String token="";
late String email="";

class HTTPConnections {
  String baseurl = "https://jsonplaceholder.typicode.com/";
  String APIbase = "https://project2.amit-learning.com/api/";
  String profileendpoint= "auth/profile/";
  String postEndPoint = "posts";
  String photosEndPoint = "photos";
  var client = varHTTP.Client();


  void signup(String name,String email, String password) async{
    try{
      Response response = await post(
          Uri.parse("https://project2.amit-learning.com/api/auth/register"),
          body: {
            "name": name,
            "email": email,
            "password": password,
          }
      );
      if(response.statusCode == 200){
        print("account created successfully");
      }else{
        print("failed to post user to server");
      }
    }catch(e){
      print(e.toString());
    }
  }


  Future<bool?> login(String email, String password) async {
    String APIbase = "https://project2.amit-learning.com/api/";
    varHTTP.Response response = await varHTTP.post(
        Uri.parse(APIbase +"auth/login"),
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
       savedlogin.setString("name",_user["user"]["name"]);
       savedlogin.setString("email", _user["user"]["email"]);
       savedlogin.setString("token",_user["token"]);
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
        Uri.parse(APIbase + profileendpoint+"$id"),
        headers: {"Authorization": "Bearer $token"}
    );
    String body = response.body;
    print(body);
    Map<String, dynamic> _user = jsonDecode(body);
    if (response.statusCode == 200) {

      Profile _profile = Profile.fromJson(_user["data"]);
      print("======================================================");
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

    Future<Job> fetchpost(int id) async {
    Response response =
    await client.get(Uri.parse(baseurl + postEndPoint + "/$id"));
    String resposebody = response.body;
    Map<String, dynamic> _map = jsonDecode(resposebody);
    if (response.statusCode == 200) {
      Job _post = Job.fromJson(_map);
      return _post;
    } else {
      print("Cannot retrieve Job with id $id");
      throw Exception("Cannot retrieve Job with id $id");
    }
  }

  Future<Job> fetchphotos(int id) async {
    Response response =
    await client.get(Uri.parse(baseurl + photosEndPoint + "/$id"));
    String resposebody = response.body;
    Map<String, dynamic> _map = jsonDecode(resposebody);
    if (response.statusCode == 200) {
      Job _photo = Job.fromJson(_map);
      return _photo;
    } else {
      print("Cannot retrieve photo with id $id");
      throw Exception("Cannot retrieve photo with id $id");
    }
  }

  Future<List?> GetAllPostswithphotos() async {
    var response = await client.get(Uri.parse("https://project2.amit-learning.com/api/jobs"),
        headers: {"Authorization": "Bearer 816|SkyUNpTu0hO7y96ncZbbSKdPFYeQQHNOavadc5Wv"}
    );
    //var response1 = await client.get(Uri.parse(baseurl + photosEndPoint));
    Map<String, dynamic> responsebody = jsonDecode(response.body);
   // var responsebody = jsonDecode(response.body);
  //  var responsebody1 = jsonDecode(response1.body);
    if (response.statusCode == 200) {
      print(list);
      list2.addAll(responsebody["data"]);
      // list.forEach((element[body]["data"]) {
      //   list2.addall(element);
      // });
      // list2.addAll(responsebody1);
      // List list3 = concatinate(list, list2);
      print("list2 ==============================>");
      print(list2);
      return list2;
    } else {
      print("cannont get all posts");
    }
  }

}

// List concatinate(List list, List list2) {
//   list.forEach((element) {
//     list2.forEach((element2) {
//       if(element2["id"]==element["id"]){
//         list3.add(
//             makenewmap(
//                 element["id"]
//                 ,element["title"]
//                 ,element["body"]
//                 ,element2["thumbnailUrl"]
//             )
//         );
//
//     }});
//   });
//   return list3;
// }
//
// Map<String, dynamic> makenewmap(int id,String title,String body,String thumbnailUrl) {
//   final Map<String, dynamic> data = new Map<String, dynamic>();
//   data["id"] = id;
//   data["title"] = title;
//   data["subtitle"] = body;
//   data["thumbnailUrl"] = thumbnailUrl;
//   return data;
// }