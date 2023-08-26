import 'package:flutter/material.dart';
import 'package:jobsque/Model/Job.dart';
import 'package:shared_preferences/shared_preferences.dart';
import'profileModel.dart';
class Jobs extends ChangeNotifier {

  String username="";
  String useremail="";
  int count = 0;
  int postid = 0;
  int appliedjobid=0;
  int appliedjobcount =0;
  List<Profile> profiles=[];
  List<Job> jobs = [];
  List savedjobs=[];
  List appliedjobs = [];
  bool? isloggedin=false;
  get Count => count;





  AddtoProfiles(Map<String,dynamic> profile) {
    Profile _profile =Profile.fromJson(profile);
    count++;
    profiles.add(_profile);
    notifyListeners();
  }

  Addtosaved(Map<String,dynamic> _map) {
     Job job =Job.fromJson(_map);
    savedjobs.add(job);
    notifyListeners();
  }

  Removefromsaved(Map<String,dynamic> _map) {
    count--;
    savedjobs.remove(_map);
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

}
