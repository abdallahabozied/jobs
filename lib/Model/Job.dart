import 'package:flutter/material.dart';
class Job extends ChangeNotifier {
  int id;
  String name;
  String job_type;
  String image;
  String location;


  Job(
      {required this.location,required this.image,required this.id, required this.name, required this.job_type});

  factory Job.fromJson(Map<String,dynamic> _map) {
    Job _job = Job(
        id: _map["id"],
        name: _map["name"],
        job_type: _map["job_type"],
        image:_map["image"],
        location:_map["location"]
    );
    return _job;
  }
}