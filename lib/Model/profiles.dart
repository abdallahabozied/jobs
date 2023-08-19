import 'package:jobsque/Model/profileModel.dart';

class Profiles {
  String username="";
  String email="";
  int count = 0;
  int postid = 0;
  int appliedjobid=0;
  int appliedjobcount =0;
  List<Profile> profiles = [];
  List<Profile> appliedjobs = [];


  Addtoprofiles(Map<String,dynamic> _map) {
    Profile profile =Profile.fromJson(_map);
    profiles.add(profile);
  }

}
