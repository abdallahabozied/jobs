import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:jobsque/Pages/Home%20&%20Search/recent%20job.dart';
import 'package:jobsque/Pages/Profile/profile.dart';
import 'package:country_picker/country_picker.dart';




class Edit_Profile extends StatefulWidget {
  const Edit_Profile({super.key});

  @override
  State<Edit_Profile> createState() => _Edit_ProfileState();
}

class _Edit_ProfileState extends State<Edit_Profile> {

  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  final TextEditingController _namecontroler = TextEditingController();
  final TextEditingController _biocontroler = TextEditingController();
  final TextEditingController _addresscontroler = TextEditingController();
  final TextEditingController _phonecontroler = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        scrolledUnderElevation: 0,
        title: Text("Edit Profile"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: MediaQuery.of(context).size.width * 1.0,
                height: MediaQuery.of(context).size.height * 0.2,
                child:Center(
                  child: Column(
                    children: [
                      CircleAvatar(
                        radius: 40,
                        backgroundImage: AssetImage("Assets/images/1.jpg"),
                      ),
                      SizedBox(height: 5),
                      TextButton(onPressed: (){
                      }, child: Text("Change Photo",style: TextStyle(fontSize: 20,color: Colors.blueAccent[400]),))
                    ],

                  ),
                ) ,
              ),
              Form(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                key: formkey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("  Name"),
                    TextFormField(
                      controller: _namecontroler,
                      decoration: const InputDecoration(
                          hintText: "  Name",
                          alignLabelWithHint: true,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(10)),
                              borderSide: BorderSide(color: Colors.red)),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            borderSide: BorderSide(color: Colors.blue),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
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
                    const SizedBox(height: 15),
                    Text("  Bio"),
                    TextFormField(
                      controller: _biocontroler,
                      autofillHints: [AutofillHints.email],
                      decoration: const InputDecoration(
                          hintText: "  Bio",
                          alignLabelWithHint: true,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(10)),
                              borderSide: BorderSide(color: Colors.red)),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            borderSide: BorderSide(color: Colors.blue),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            borderSide: BorderSide(color: Colors.blue),
                          )
                      ),
                      cursorColor: Colors.black,
                      onChanged: (value) => setState((){}),
                      maxLines: 1,
                      keyboardType: TextInputType.emailAddress,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (value){
                        if(value!.length <= 3 ||value.length >= 30){
                          return "Enter valid bio please";
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 15),
                    Text("  Address"),
                    TextFormField(
                        controller: _addresscontroler,
                        decoration: const InputDecoration(
                            errorStyle: TextStyle(color: Colors.red),
                            hintText: "  Address",
                            alignLabelWithHint: true,
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(10)),
                                borderSide: BorderSide(color: Colors.blue)),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(10)),
                              borderSide: BorderSide(color: Colors.blue),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(10)),
                              borderSide: BorderSide(color: Colors.blue),
                            )
                        ),
                        cursorColor: Colors.black,
                        maxLines: 1,
                        keyboardType: TextInputType.text,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (value) {
                          if(value!.length <= 8){
                            return  "Enter valid Address";
                          }
                          return null;
                        }
                    ),
                    const SizedBox(height: 15),
                    Text("  No.Handphone"),
                    IntlPhoneField(
                      initialCountryCode: "+20",
                      initialValue: "+20",
                      controller: _phonecontroler,
                        disableLengthCheck: true,
                        decoration: const InputDecoration(
                            errorStyle: TextStyle(color: Colors.red),
                            hintText: "  No.Handphone",
                            alignLabelWithHint: true,
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(10)),
                                borderSide: BorderSide(color: Colors.blue)),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(10)),
                              borderSide: BorderSide(color: Colors.blue),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(10)),
                              borderSide: BorderSide(color: Colors.blue),
                            )
                        ),
                        cursorColor: Colors.black,
                        keyboardType: TextInputType.phone,
                        autovalidateMode: AutovalidateMode.onUserInteraction,

                    ),
                    const SizedBox(height: 20),
                    Container(
                      padding: const EdgeInsets.only(left: 80,top: 30),
                    ),
                    const SizedBox(height: 15),
                    Center(
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.blueAccent,
                              minimumSize: const Size(600 , 50)
                          ),onPressed: (){
                       httpConnections.EditProfile(_biocontroler.text, _addresscontroler.text, _phonecontroler.text);
                         ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Profile data updated")));
                         Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => profile()));
                      },

                          child: const Text("Save",style: (TextStyle(color: Colors.black54)),)),
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
