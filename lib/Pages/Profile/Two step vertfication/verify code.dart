import 'package:flutter/material.dart';
import 'package:jobsque/Pages/Sign%20In/Sign%20In.dart';
import 'package:jobsque/Network/HTTP.dart' as varhttp;

class Verify_code extends StatefulWidget {
  const Verify_code({super.key});

  @override
  State<Verify_code> createState() => _Verify_codeState();
}

class _Verify_codeState extends State<Verify_code> {
  String lastfourdigits = varhttp.phone.substring(varhttp.phone.length - 4);

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
                  Text("Enter the 6 digit code"),
                  SizedBox(height: 5),
                  Text(
                      "Please confirm your account by entering the \nauthorization code sent to ****_****_$lastfourdigits"),
                  SizedBox(height: 5),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(3),
                              border: Border.all(width: 2)),
                          width: 50,
                          height: 50,
                          child: TextField(
                            decoration: InputDecoration(

                                floatingLabelAlignment:
                                    FloatingLabelAlignment.center),
                          )),
                      SizedBox(width: 3),
                      Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(3),
                              border: Border.all(width: 2)),
                          width: 50,
                          height: 50,
                          child: TextField(
                            decoration: InputDecoration(
                                floatingLabelAlignment:
                                    FloatingLabelAlignment.center),
                          )),
                      SizedBox(width: 3),
                      Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(3),
                              border: Border.all(width: 2)),
                          width: 50,
                          height: 50,
                          child: TextField(

                            decoration: InputDecoration(
                                floatingLabelAlignment:
                                    FloatingLabelAlignment.center),
                          )),
                      SizedBox(width: 3),
                      Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(3),
                              border: Border.all(width: 2)),
                          width: 50,
                          height: 50,
                          child: TextField(

                            decoration: InputDecoration(
                                floatingLabelAlignment:
                                    FloatingLabelAlignment.center),
                          )),
                      SizedBox(width: 3),
                      Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(3),
                              border: Border.all(width: 2)),
                          width: 50,
                          height: 50,
                          child: TextField(

                            decoration: InputDecoration(
                                floatingLabelAlignment:
                                    FloatingLabelAlignment.center),
                          )),
                      SizedBox(width: 3),
                      Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(3),
                              border: Border.all(width: 2)),
                          width: 50,
                          height: 50,
                          child: TextField(

                            decoration: InputDecoration(
                                floatingLabelAlignment:
                                    FloatingLabelAlignment.center),
                          )),
                      SizedBox(width: 3),
                    ],
                  )
                ],
              ),
            ),
            Center(
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blueAccent,
                      minimumSize: const Size(600, 50)),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Sign_In()));
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
