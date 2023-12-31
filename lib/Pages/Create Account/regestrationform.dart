import 'package:flutter/material.dart';
import 'package:jobsque/Network/HTTP.dart';
import 'package:jobsque/Pages/Create%20Account/intersted%20work.dart';
import 'package:jobsque/Pages/Home%20&%20Search/Home_Home.dart';
import 'package:jobsque/Pages/Sign%20In/Sign%20In.dart';
import 'package:jobsque/Shared functions.dart';

class Regestration_Form extends StatefulWidget {
  const Regestration_Form({super.key});

  @override
  State<Regestration_Form> createState() => _regestration_formState();
}


class _regestration_formState extends State<Regestration_Form> {
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  final TextEditingController _usernamecontroler = TextEditingController();
 final TextEditingController _emailcontroler = TextEditingController();
 final TextEditingController _passwordcontroler = TextEditingController();
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
            const Text("Create Account",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
            const Text("Please create an account to find your dream job",
                style: TextStyle(fontSize: 15,color: Colors.black54)),
            const SizedBox(height: 10),
            Form(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              key: formkey,
              child: Column(
                children: [
                  TextFormField(
                    controller: _usernamecontroler,
                    decoration: const InputDecoration(
                        hintText: "  Username",
                        prefixIcon: Icon(Icons.person),
                        alignLabelWithHint: true,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            borderSide: BorderSide(color: Colors.red)),
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
                    keyboardType: TextInputType.name,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (value){
                      if(value!.length <= 3 ||value.length >= 30){
                       return "Username must be between 3 ~ 20 characters";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 8),
                  TextFormField(
                    controller: _emailcontroler,
                    autofillHints: const [AutofillHints.email],
                    decoration: const InputDecoration(
                        hintText: "  Email",
                        prefixIcon: Icon(Icons.email),
                        alignLabelWithHint: true,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            borderSide: BorderSide(color: Colors.red)),
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
                    validator:(input) => input!.isValidEmail() ? null : "Enter Valid email...",
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
                    keyboardType: TextInputType.text,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (value) {
                      if(value!.length <= 8){
                       return  "Password must be at least 8 characters";
                      }
                    return null;
                    }
                  ),
                  const SizedBox(height: 8),
                  Container(
                    padding: const EdgeInsets.only(left: 80,top: 30),
                    child: Row(
                      children: [
                            const Text("Already have an account?",style: TextStyle(color: Colors.black54)),
                            InkWell(onTap: (){
                              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const Sign_In()));
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
                      ),onPressed: (){
                       HTTPConnections().signup(_usernamecontroler.text.toString(),_emailcontroler.text.toString(),_passwordcontroler.text.toString());
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const Intersted_Work()));
                       },
                        // onPressed: formkey.currentState == null || !formkey.currentState!.validate()? null :() async {
                        //   try {
                        //     await FirebaseAuth.instance
                        //         .createUserWithEmailAndPassword(
                        //         email: _emailcontroler.text,
                        //         password: _passwordcontroler.text);
                        //     Navigator.of(context)
                        //         .pushReplacement(MaterialPageRoute(builder: (BuildContext) {
                        //       return const Intersted_Work();
                        //     }));
                        //    } on FirebaseAuthException catch (e) {
                        //     if (e.code == 'weak-password') {
                        //       ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        //                  content: Text("The password provided is too weak.")));
                        //
                        //     } else if (e.code == 'email-already-in-use') {
                        //       ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        //                  content: Text("The account already exists for that email.")));
                        //     }
                        //   } catch (e) {
                        //     print(e);
                        //   }
                        //
                        // },

                         child: const Text("Create Account",style: (TextStyle(color: Colors.black54)),)),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            Stack(
              children: [
                const Divider(thickness: 0.5,color: Colors.grey),
                Center(
                  child: Container(
                    alignment: Alignment.center,
                    width: 180,
                        decoration: const BoxDecoration(
                        shape: BoxShape.rectangle,
                    color: Colors.white
                  ),child: const Text("Or Sign up With Account",style: TextStyle(color: Colors.grey),)
                  ),
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
                    border: Border.all(color: Colors.grey)
                  ),
                  width: 160,
                  height: 50,
                  child: MaterialButton(

                    shape: const RoundedRectangleBorder()
                  ,onPressed: ()async{
                    await signInWithGoogle();
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Email registered Successfully , Now you can Sign in")));
                    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (BuildContext) =>const Sign_In()));
                  }, child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.g_mobiledata_rounded,size: 30,),
                      Text("Google")
                    ],
                  )),
                ),
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.grey)
                  ),
                  width: 160,
                  height: 50,
                  child: MaterialButton(

                      shape: const RoundedRectangleBorder()

                      ,onPressed: (){



                  }, child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.facebook_rounded,color: Colors.blue,),
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
