import 'package:flutter/material.dart';
import 'package:jobsque/Model/Job.dart';

class Jobs extends ChangeNotifier {
  int count = 0;
  List<Job> jobs = [];
  get Count => count;


  Addtosaved(Map<String,dynamic> _map) {
     Job job =Job.fromJson(_map);
    count++;
    jobs.add(job);
    notifyListeners();
  }

  Removefromsaved(Job job) {
    count--;
    jobs.remove(job);
    notifyListeners();
  }
}
