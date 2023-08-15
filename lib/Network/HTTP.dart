import 'dart:convert';
import 'package:jobsque/Model/Job.dart';
import 'package:http/http.dart' as varHTTP;
import 'package:http/http.dart';

List list = []; //jobs
List list2 = []; //photos
List list3=[];
class HTTPConnections {
  String baseurl = "https://jsonplaceholder.typicode.com/";
  String postEndPoint = "posts";
  String photosEndPoint = "photos";
  var client = varHTTP.Client();

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
    var response = await client.get(Uri.parse(baseurl + postEndPoint));
    var response1 = await client.get(Uri.parse(baseurl + photosEndPoint));
    var responsebody = jsonDecode(response.body);
    var responsebody1 = jsonDecode(response1.body);


    if (response.statusCode == 200) {

      list.addAll(responsebody);
      list2.addAll(responsebody1);
      List list3 = concatinate(list, list2);
      return list3;
    } else {
      print("cannont get all posts");
    }
  }

}

List concatinate(List list, List list2) {
  list.forEach((element) {
    list2.forEach((element2) {
      if(element2["id"]==element["id"]){
        list3.add(
            makenewmap(
                element["id"]
                ,element["title"]
                ,element["body"]
                ,element2["thumbnailUrl"]
            )
        );

    }});
  });
  return list3;
}

Map<String, dynamic> makenewmap(int id,String title,String body,String thumbnailUrl){
  final Map<String, dynamic> data = new Map<String, dynamic>();
  data["id"] = id;
  data["title"] = title;
  data["subtitle"] = body;
  data["thumbnailUrl"] = thumbnailUrl;
  return data;
}