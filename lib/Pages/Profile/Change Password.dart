import 'package:flutter/material.dart';
import 'package:jobsque/Pages/Home%20&%20Search/Home_Home.dart';
import '../../Network/HTTP.dart' as varHTTP;

class Change_Password extends StatefulWidget {
  const Change_Password({super.key});

  @override
  State<Change_Password> createState() => _Change_PasswordState();
}

class _Change_PasswordState extends State<Change_Password> {
  TextEditingController _currentpasswordcontroler = TextEditingController();
  TextEditingController _newpasswordcontroler = TextEditingController();
  TextEditingController _confirmpasswordcontroler = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          elevation: 0,
          scrolledUnderElevation: 0,
          title: Text("Change Password",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        ),
        body: Padding(
          padding: EdgeInsets.all(15),
          child: Form(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * 1.0,
                    height: MediaQuery.of(context).size.height * 0.5,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Current Password"),
                        const SizedBox(height: 3),
                        TextFormField(
                            obscureText: true,
                            controller: _currentpasswordcontroler,
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
                              if (value!=varHTTP.password) {
                                return "Current password is incorrect";
                              }
                              return null;
                            }),
                        const SizedBox(height: 5),

                        Text("New Password"),
                        const SizedBox(height: 3),
                        TextFormField(
                            obscureText: true,
                            controller: _newpasswordcontroler,
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
                              if (value==_currentpasswordcontroler.text) {
                                return "New password Cannot be as same as the old password";
                              }else if(value!.length <=8 ){
                                return "New password must be more the 8 characters";
                              }
                              return null;
                            }),
                        const SizedBox(height: 5),
                        Text("Confirm New Password"),
                        const SizedBox(height: 3),
                        TextFormField(
                            obscureText: true,
                            controller: _confirmpasswordcontroler,
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
                              if (value!=_newpasswordcontroler.text) {
                                return "two passwords must be identical";
                              }
                              return null;
                            }),

                      ],
                    ),
                  ),
                  Center(
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blueAccent,
                            minimumSize: const Size(600, 50)),
                        onPressed: () async{
                          if(await varHTTP.HTTPConnections().updatePassword(_newpasswordcontroler.text) == true){
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("password updated Sccccessfully")));
                         Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Home()));
                          }
                          else{
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Failed to update password ")));
                          }

                        },
                        child: const Text(
                          "Save",
                          style: (TextStyle(color: Colors.black54)),
                        )),
                  ),
                ]),
          ),
        ));
  }
}
