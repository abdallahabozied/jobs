import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:jobsque/Network/HTTP.dart' as varhttp;
import 'package:jobsque/Pages/Profile/Two%20step%20vertfication/verify%20code.dart';

class Two_step_3 extends StatefulWidget {
  const Two_step_3({super.key});

  @override
  State<Two_step_3> createState() => _Two_step_3State();
}

class _Two_step_3State extends State<Two_step_3> {
  final TextEditingController _phoneController = TextEditingController();
  bool use_phone_to_reset = false;
  final TextEditingController _currentpasswordcontroler = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          elevation: 0,
          scrolledUnderElevation: 0,
          title: const Text("Two-step verification",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        ),
        body: Padding(
          padding: const EdgeInsets.all(15),
          child: Form(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 1.0,
                    // height: MediaQuery.of(context).size.height * 0.2,
                    child: Column(
                      children: [
                        const Text("  Add phone Number"),
                        const SizedBox(height: 3),
                        const Text(
                            "  we will send a verification code to this number"),
                        const SizedBox(height: 5),
                        IntlPhoneField(
                          initialCountryCode: "+20",
                          initialValue: "+20",
                          controller: _phoneController,
                          disableLengthCheck: true,
                          decoration: const InputDecoration(
                              errorStyle: TextStyle(color: Colors.red),
                              hintText: "  No.Handphone",
                              alignLabelWithHint: true,
                              border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                  borderSide: BorderSide(color: Colors.blue)),
                              enabledBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                                borderSide: BorderSide(color: Colors.blue),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                                borderSide: BorderSide(color: Colors.blue),
                              )),
                          cursorColor: Colors.black,
                          keyboardType: TextInputType.phone,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                        ),
                        const SizedBox(height: 5),
                        const Text("  Enter your password"),
                        const SizedBox(height: 5),
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
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            validator: (value) {
                              if (value != varhttp.password) {
                                return "password is incorrect";
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
                        onPressed: () {
                        varhttp.phone=_phoneController.text;
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const Verify_code()));
                        },
                        child: const Text(
                          "Send code",
                          style: (TextStyle(color: Colors.black54)),
                        )),
                  ),
                ]),
          ),
        ));
  }
}
