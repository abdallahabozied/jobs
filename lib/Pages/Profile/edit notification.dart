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
        title: const Text("Notification",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold)),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),
            Container(
              width: MediaQuery.of(context).size.width * 1,
              height: 30,
              decoration: BoxDecoration(color: Colors.grey.shade200),
              padding: const EdgeInsets.only(left: 15),
              child: const Text("Job Notification",
                  style: TextStyle(fontSize: 20, color: Colors.black)),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width*1,
              height: MediaQuery.of(context).size.height*0.4,
              child: Column(
                children: [
                  SwitchListTile(title:const Text(("Job Search Alert")) ,value: job_search, onChanged:(value){
                    job_search = value;
                    setState(() {
                      job_search = value;
                    });
                  }),
                const Divider(indent: 30,endIndent: 30),
                  SwitchListTile(title:const Text(("Job Application Update")) ,value: job_app_update, onChanged:(value){
                    job_app_update = value;
                    setState(() {

                    });
                  }),
                  const Divider(indent: 30,endIndent: 30),
                  SwitchListTile(title:const Text(("Job Application Reminders")) ,value: job_reminder, onChanged:(value){
                    job_reminder = value;
                    setState(() {

                    });
                  }),
                  const Divider(indent: 30,endIndent: 30),
                  SwitchListTile(title:const Text(("Job You may Be Interested In")) ,value: job_interstedin, onChanged:(value){
                    job_interstedin = value;
                    setState(() {
                    });
                  }),
                  const Divider(indent: 30,endIndent: 30),
                  SwitchListTile(title:const Text(("Job Seeker Updates")) ,value: job_seekerupdate, onChanged:(value){
                    job_seekerupdate = value;
                    setState(() {

                    });
                  }),
                  const Divider(indent: 30,endIndent: 30),
                ],
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width * 1,
              height: 30,
              decoration: BoxDecoration(color: Colors.grey.shade200),
              padding: const EdgeInsets.only(left: 15),
              child: const Text("Other Notification",
                  style: TextStyle(fontSize: 20, color: Colors.black)),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width*1,
              height: MediaQuery.of(context).size.height*0.3,
              child: Column(
                children: [
                  SwitchListTile(title:const Text(("Show Profile")) ,value: show_profile, onChanged:(value){
                    show_profile = value;
                    setState(() {
                    });
                  }),
                  const Divider(indent: 30,endIndent: 30),
                  SwitchListTile(title:const Text(("All Message")) ,value: all_Message, onChanged:(value){
                    all_Message = value;
                    setState(() {
                    });
                  }),
                  const Divider(indent: 30,endIndent: 30),
                  SwitchListTile(title:const Text(("Message Nudges")) ,value: message_nudge, onChanged:(value){
                    message_nudge = value;
                    setState(() {

                    });
                  }),
                  const Divider(indent: 30,endIndent: 30),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
