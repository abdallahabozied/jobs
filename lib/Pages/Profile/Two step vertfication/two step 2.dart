import 'package:flutter/material.dart';
import 'package:jobsque/Pages/Profile/Two%20step%20vertfication/two%20step%203.dart';

class Two_Step_2 extends StatefulWidget {
  const Two_Step_2({super.key});

  @override
  State<Two_Step_2> createState() => _Two_Step_2State();
}

class _Two_Step_2State extends State<Two_Step_2> {
  bool two_step = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        scrolledUnderElevation: 0,
        title: const Text("Two step Verification",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 10),
                Container(
                  width: MediaQuery.of(context).size.width * 1,
                  height: 60,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black26),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: SwitchListTile(
                      subtitle: const Text(
                        "Secure your account with \ntwo-step verification",
                        style: TextStyle(fontSize: 15),
                      ),
                      value: two_step,
                      onChanged: (value) {
                        two_step = value;
                        setState(() {});
                      }),
                ),
                const SizedBox(height: 10),
                const Text("Select a verification method"),
                const SizedBox(height: 5),
                ExpansionTile(
                  initiallyExpanded: false,
                    title: const Text("Telephone number (SMS)"),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                        side: const BorderSide(width: 1)
                    )),
                const SizedBox(height: 10),
                const Text(
                    "Turning this feature will sign you out anywhere \nyou're currentle signed in. we will require you to \nenter a verification code the first time you sign with a \nnew device or Joby mobile application.")
              ],
            ),
            Center(
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blueAccent,
                      minimumSize: const Size(600, 50)),
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder:  (context) => const Two_step_3()));
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
