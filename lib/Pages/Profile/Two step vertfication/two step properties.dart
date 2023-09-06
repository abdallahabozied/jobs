import 'package:flutter/material.dart';
import 'package:jobsque/Pages/Profile/Two%20step%20vertfication/two%20step%202.dart';

class Two_Step_Properties extends StatefulWidget {
  const Two_Step_Properties({super.key});

  @override
  State<Two_Step_Properties> createState() => _Two_Step_PropertiesState();
}

class _Two_Step_PropertiesState extends State<Two_Step_Properties> {
  bool two_step = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        scrolledUnderElevation: 0,
        title: Text("Two step Verification",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 10),
                  Container(
                    width: MediaQuery.of(context).size.width * 1,
                    height: 60,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black26),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: SwitchListTile(
                        subtitle: Text(
                            ("Secure your account with \ntwo-step verification")),
                        value: two_step,
                        onChanged: (value) {
                          two_step = value;
                          setState(() {});
                        }),
                  ),
                  SizedBox(height: 10),
                  ListTile(
                    leading: CircleAvatar(
                      radius: 20,
                      child: Icon(
                        Icons.lock,
                        color: Colors.blueAccent,
                      ),
                      backgroundColor: Colors.blue.shade50,
                    ),
                    subtitle: Text(
                        "Two step verification provides Additional \nsecurity by asking for a verification code \neverytime you log in another device."),
                  ),
                  SizedBox(height: 10),
                  ListTile(
                    leading: CircleAvatar(
                      radius: 20,
                      child: Icon(
                        Icons.phone_android,
                        color: Colors.blueAccent,
                      ),
                      backgroundColor: Colors.blue.shade50,
                    ),
                    subtitle: Text(
                        "Adding phone number or using an \nauthenticator will help keep your account \nsafe from hart"),
                  ),
                ],
              ),
            ),
            Center(
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blueAccent,
                      minimumSize: const Size(600, 50)),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Two_Step_2(),
                        ));
                  },
                  child: const Text(
                    "Next ",
                    style: (TextStyle(color: Colors.black54)),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
