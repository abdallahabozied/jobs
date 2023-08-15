import 'package:flutter/material.dart';
class Job extends ChangeNotifier {
  int id;
  String title;
  String subtitle;
  String thumbnailUrl;


  Job(
      {required this.thumbnailUrl,required this.id, required this.title, required this.subtitle});

  factory Job.fromJson(Map _map) {
    Job _job = Job(
        id: _map["id"],
        title: _map["title"],
        subtitle: _map["title"],
        thumbnailUrl:_map["thumbnailUrl"]
    );
    return _job;
  }
}