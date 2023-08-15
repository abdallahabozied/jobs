import 'package:flutter/material.dart';
import 'package:jobsque/Model/Job.dart';

class Jobs extends ChangeNotifier {
  int count = 0;
  int postid = 0;
  int appliedjobid=0;
  int appliedjobcount =0;
  List<Job> jobs = [];
  List<Job> appliedjobs = [];
  bool isloggedin=false;
  get Count => count;


  Addtosaved(Map<String,dynamic> _map) {
     Job job =Job.fromJson(_map);
    count++;
    jobs.add(job);
    notifyListeners();
  }
  Addtoapplied(Map<String,dynamic> _map) {
    Job job =Job.fromJson(_map);
    appliedjobcount++;
    appliedjobs.add(job);
    notifyListeners();
  }
  RemovefromApplied(Job job) {
    appliedjobcount--;
    appliedjobs.remove(job);
    notifyListeners();
  }
  Removefromsaved(Job job) {
    count--;
    jobs.remove(job);
    notifyListeners();
  }
}
