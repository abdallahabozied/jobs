import 'package:flutter/material.dart';

class notification_properties extends StatefulWidget {
  const notification_properties({super.key});

  @override
  State<notification_properties> createState() => _notification_propertiesState();
}
bool job_search=false ;
bool job_app_update=false ;
bool job_reminder=false ;
bool job_interstedin=false ;
bool job_seekerupdate=false ;
bool show_profile=false;
bool all_Message=false;
bool message_nudge=false ;
class _notification_propertiesState extends State<notification_properties> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        scrolledUnderElevation: 0,
        title: Text("Notification",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold)),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 10),
            Container(
              width: MediaQuery.of(context).size.width * 1,
              height: 30,
              decoration: BoxDecoration(color: Colors.grey.shade200),
              padding: EdgeInsets.only(left: 15),
              child: Text("Job Notification",
                  style: TextStyle(fontSize: 20, color: Colors.black)),
            ),
            Container(
              width: MediaQuery.of(context).size.width*1,
              height: MediaQuery.of(context).size.height*0.4,
              child: Column(
                children: [
                  SwitchListTile(title:Text(("Job Search Alert")) ,value: job_search, onChanged:(value){
                    job_search = value;
                    setState(() {
                      job_search = value;
                    });
                  }),
                Divider(indent: 30,endIndent: 30),
                  SwitchListTile(title:Text(("Job Application Update")) ,value: job_app_update, onChanged:(value){
                    job_app_update = value;
                    setState(() {

                    });
                  }),
                  Divider(indent: 30,endIndent: 30),
                  SwitchListTile(title:Text(("Job Application Reminders")) ,value: job_reminder, onChanged:(value){
                    job_reminder = value;
                    setState(() {

                    });
                  }),
                  Divider(indent: 30,endIndent: 30),
                  SwitchListTile(title:Text(("Job You may Be Interested In")) ,value: job_interstedin, onChanged:(value){
                    job_interstedin = value;
                    setState(() {
                    });
                  }),
                  Divider(indent: 30,endIndent: 30),
                  SwitchListTile(title:Text(("Job Seeker Updates")) ,value: job_seekerupdate, onChanged:(value){
                    job_seekerupdate = value;
                    setState(() {

                    });
                  }),
                  Divider(indent: 30,endIndent: 30),
                ],
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width * 1,
              height: 30,
              decoration: BoxDecoration(color: Colors.grey.shade200),
              padding: EdgeInsets.only(left: 15),
              child: Text("Other Notification",
                  style: TextStyle(fontSize: 20, color: Colors.black)),
            ),
            Container(
              width: MediaQuery.of(context).size.width*1,
              height: MediaQuery.of(context).size.height*0.3,
              child: Column(
                children: [
                  SwitchListTile(title:Text(("Show Profile")) ,value: show_profile, onChanged:(value){
                    show_profile = value;
                    setState(() {
                    });
                  }),
                  Divider(indent: 30,endIndent: 30),
                  SwitchListTile(title:Text(("All Message")) ,value: all_Message, onChanged:(value){
                    all_Message = value;
                    setState(() {
                    });
                  }),
                  Divider(indent: 30,endIndent: 30),
                  SwitchListTile(title:Text(("Message Nudges")) ,value: message_nudge, onChanged:(value){
                    message_nudge = value;
                    setState(() {

                    });
                  }),
                  Divider(indent: 30,endIndent: 30),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
