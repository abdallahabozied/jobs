import 'package:flutter/material.dart';
import 'package:jobsque/Pages/Reset%20Password/check%20your%20email.dart';
import 'package:jobsque/Pages/Sign%20In/Sign%20In.dart';
import 'package:jobsque/Shared functions.dart';
class Reset_Password extends StatefulWidget {
  const Reset_Password({super.key});

  @override
  State<Reset_Password> createState() => _Reset_PasswordState();
}

class _Reset_PasswordState extends State<Reset_Password> {
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  final TextEditingController _emailcontroler = TextEditingController();
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
              const Text("Reset Password",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
              const Text("Enter the email address you used when you joined and we will send you instructions to reset your password",
                  style: TextStyle(fontSize: 15,color: Colors.black54)),
              const SizedBox(height: 10),
              Form(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                key: formkey,
                child: Column(
                  children: [
                    TextFormField(
                        controller: _emailcontroler,
                        autofillHints: [AutofillHints.email],
                        decoration: const InputDecoration(
                            hintText: "Enter your Email....",
                            prefixIcon: Icon(Icons.email),
                            alignLabelWithHint: true,
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(20)),
                                borderSide: BorderSide(color: Colors.blue)),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(20)),
                              borderSide: BorderSide(color: Colors.blue),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(20)),
                              borderSide: BorderSide(color: Colors.blue),
                            )
                        ),
                        cursorColor: Colors.black,
                        onChanged: (value) => setState((){}),
                        maxLines: 1,
                        keyboardType: TextInputType.emailAddress,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator:(input) => input!.isValidEmail() ? null : "Check your email",

                    ),
                    SizedBox(height: MediaQuery.of(context).size.height*0.35),
                    Container(
                      padding: const EdgeInsets.only(left: 80,top: 30),
                      child: Row(
                        children: [
                          const Text("You remembered your password ",style: TextStyle(color: Colors.black54)),
                          InkWell(onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context) => Sign_In(),));
                          },child: const Text(" Login",style: TextStyle(color: Colors.blue))),

                        ],
                      ),
                    ),
                    const SizedBox(height: 15),
                    Center(
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.blueAccent,
                              minimumSize: const Size(600 , 50)
                          ),
                          onPressed: formkey.currentState == null || !formkey.currentState!.validate()? null :() {
                            //to do actionsto authenticate then ==>
                              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Check_Your_Email()));
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
