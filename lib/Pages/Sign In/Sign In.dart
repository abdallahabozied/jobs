import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
// import 'package:jobsque/Model/jobpost.dart';
import 'package:jobsque/Model/profileModel.dart';
import 'package:jobsque/Network/HTTP.dart' as varHttp;
import 'package:jobsque/Pages/Create%20Account/regestrationform.dart';
import 'package:jobsque/Pages/Home%20&%20Search/Home_Home.dart';
import 'package:jobsque/Pages/Reset%20Password/Reset%20Password.dart';
import 'package:jobsque/Shared functions.dart';
// import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../onboardScreens/splash.dart';


class Sign_In extends StatefulWidget {
  const Sign_In({super.key});

  @override
  State<Sign_In> createState() => _Sign_InState();
}

class _Sign_InState extends State<Sign_In> {
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  bool? remember_me = false;
  final TextEditingController _emailcontroler = TextEditingController();
  final TextEditingController _passwordcontroler = TextEditingController();
  late final Profile userprofiledata;
  @override
  void initState() {

    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    // var prov = Provider.of<Jobs>(context);
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        scrolledUnderElevation: 0,
        backgroundColor: Colors.white,
        bottomOpacity: 0,
        elevation: 0,
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 15.0),
            child: Row(
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
              const Text("Login",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
              const Text("Please login to find your dream job",
                  style: TextStyle(fontSize: 15, color: Colors.black54)),
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
                          hintText: "  Email",
                          prefixIcon: Icon(Icons.email),
                          alignLabelWithHint: true,
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20)),
                              borderSide: BorderSide(color: Colors.blue)),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            borderSide: BorderSide(color: Colors.blue),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            borderSide: BorderSide(color: Colors.blue),
                          )),
                      cursorColor: Colors.black,
                      onChanged: (value) => setState(() {}),
                      maxLines: 1,
                      keyboardType: TextInputType.emailAddress,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (input) =>
                          input!.isValidEmail() ? null : "Check your email",
                    ),
                    const SizedBox(height: 8),
                    TextFormField(
                        obscureText: true,
                        controller: _passwordcontroler,
                        decoration: const InputDecoration(
                            errorStyle: TextStyle(color: Colors.red),
                            hintText: "  Password",
                            prefixIcon: Icon(Icons.lock),
                            alignLabelWithHint: true,
                            border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20)),
                                borderSide: BorderSide(color: Colors.blue)),
                            enabledBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20)),
                              borderSide: BorderSide(color: Colors.blue),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20)),
                              borderSide: BorderSide(color: Colors.blue),
                            )),
                        cursorColor: Colors.black,
                        onChanged: (value) => setState(() {}),
                        maxLines: 1,
                        keyboardType: TextInputType.text,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (value) {
                          if (value!.length <= 8) {
                            return "Password must be at least 8 characters";
                          }
                          return null;
                        }),
                    const SizedBox(height: 3),
                    Row(
                      children: [
                        Checkbox(
                            autofocus: true,
                            splashRadius: 20,
                            activeColor: Colors.blue[700],
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5)),
                            checkColor: Colors.blue[400],

                            value: remember_me,
                            onChanged: (islogin) async{
                              var logindata = await SharedPreferences.getInstance();
                              logindata.setString("email",_emailcontroler.text);
                              setState(() {
                                remember_me= islogin;
                                logindata.setBool("login", remember_me!);

                              });
                            }),
                        const Text("Remember me",
                            style: TextStyle(color: Colors.black54)),
                        SizedBox(
                            width: MediaQuery.of(context).size.width * 0.25),
                        InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const Reset_Password(),
                                  ));
                            },
                            child: const Text(" Forgot Password?",
                                style: TextStyle(color: Colors.blue))),
                      ],
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.07),
                    Container(
                      padding: const EdgeInsets.only(left: 80, top: 30),
                      child: Row(
                        children: [
                          const Text("Don't have an account?",
                              style: TextStyle(color: Colors.black54)),
                          InkWell(
                              onTap: () {
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => const Regestration_Form(),
                                    ));
                              },
                              child: const Text(" Register",
                                  style: TextStyle(color: Colors.blue))),
                        ],
                      ),
                    ),
                    const SizedBox(height: 15),
                    Center(
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.blueAccent,
                              minimumSize: const Size(600, 50)),
                          onPressed: formkey.currentState == null ||
                                  !formkey.currentState!.validate()
                              ? null
                              : () async {
                                  if (await varHttp.HTTPConnections().login(
                                          _emailcontroler.text.toString(),
                                          _passwordcontroler.text.toString()) ==
                                      true) {
                                   // var savedlogindata = await SharedPreferences.getInstance();
                                    logindata?.setBool('login', true);
                                   //  AddstringtoSharedPrefrence("username", userprofiledata.name);
                                   // AddstringtoSharedPrefrence("email",userprofiledata.email);
//                                    savedlogindata.setString("email",);
                                    Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => const Home()));
                                  } else {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                        const SnackBar(
                                            content: Text(
                                                "Check your credintials or internet connection")));
                                  }
                                },
                          // : () async {
                          //     try {
                          //       await FirebaseAuth.instance
                          //           .signInWithEmailAndPassword(
                          //               email: _emailcontroler.text,
                          //               password: _passwordcontroler.text);
                          //       Navigator.pushReplacement(
                          //           context,
                          //           MaterialPageRoute(
                          //               builder: (context) => Home()));
                          //     } on FirebaseAuthException catch (e) {
                          //       if (e.code == 'user-not-found') {
                          //         ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          //                   content: Text("No user found for that email.")));
                          //
                          //       } else if (e.code == 'wrong-password') {
                          //         ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          //             content: Text("Wrong password provided for that user.")));
                          //       }
                          //     }
                          //   },
                          child: const Text(
                            "Login",
                            style: (TextStyle(color: Colors.black54)),
                          )),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              Stack(
                children: [
                  const Divider(thickness: 0.5, color: Colors.grey),
                  Center(
                    child: Container(
                        alignment: Alignment.center,
                        width: 180,
                        decoration: const BoxDecoration(
                            shape: BoxShape.rectangle, color: Colors.white),
                        child: const Text(
                          "Or Login With Account",
                          style: TextStyle(color: Colors.grey),
                        )),
                  ),
                ],
              ),
              const SizedBox(height: 5),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.grey)),
                    width: 160,
                    height: 50,
                    child: MaterialButton(
                        shape: const RoundedRectangleBorder(),
                        onPressed: () async{
                          await signInWithGoogle();
                          varHttp.name=FirebaseAuth.instance.currentUser!.displayName!;
                          varHttp.email=FirebaseAuth.instance.currentUser!.email!;
                          Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (BuildContext) =>const Home()));
                        },
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.g_mobiledata_rounded,
                              size: 30,
                            ),
                            Text("Google")
                          ],
                        )),
                  ),
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.grey)),
                    width: 160,
                    height: 50,
                    child: MaterialButton(
                        shape: const RoundedRectangleBorder(),
                        onPressed: () {},
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.facebook_rounded,
                              color: Colors.blue,
                            ),
                            Text(" Facebook")
                          ],
                        )),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

}
