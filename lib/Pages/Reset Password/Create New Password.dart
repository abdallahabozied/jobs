import 'package:flutter/material.dart';
class Create_New_Password extends StatefulWidget {
  const Create_New_Password({super.key});

  @override
  State<Create_New_Password> createState() => _Create_New_PasswordState();
}

class _Create_New_PasswordState extends State<Create_New_Password> {
  GlobalKey<FormState> formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        scrolledUnderElevation: 0,
        backgroundColor: Colors.white,
        bottomOpacity: 0,
        elevation: 0,
        actions: const[
          Padding(
            padding:  EdgeInsets.only(right: 15.0),
            child:  Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text("J",
                      style:
                      TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                  Icon(Icons.search, color: Colors.blueAccent, size: 20),
                  Text("BSQUE",
                      style:
                      TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                ]),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          //physics: NeverScrollableScrollPhysics(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("Create New Password",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
              const Text("Enter the email address you used when you joined and we will send you instructions to reset your password",
                  style: TextStyle(fontSize: 15,color: Colors.black54)),
              const SizedBox(height: 10),
              Form(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                key: formkey,
                child: Column(
                  children: [
                    SizedBox(height: MediaQuery.of(context).size.height*0.35),
                    Container(
                      padding: const EdgeInsets.only(left: 80,top: 30),

                    ),
                    Center(
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.blueAccent,
                              minimumSize: const Size(600 , 50)
                          ),
                          onPressed: formkey.currentState == null || !formkey.currentState!.validate()? null :() {
                            //to do actionsto authenticate then ==>
                            // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Check_Your_Email()));
                          },
                          child: const Text("Request password reset",style: (TextStyle(color: Colors.white)),)),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
