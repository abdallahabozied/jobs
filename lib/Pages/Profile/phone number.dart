import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class Edit_Phone_Number extends StatefulWidget {
  const Edit_Phone_Number({super.key});

  @override
  State<Edit_Phone_Number> createState() => _Edit_Phone_NumberState();
}

class _Edit_Phone_NumberState extends State<Edit_Phone_Number> {
  final TextEditingController _phoneController = TextEditingController();
  bool use_phone_to_reset = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          elevation: 0,
          scrolledUnderElevation: 0,
          title: const Text("Phone Number",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        ),
        body: Padding(
          padding: const EdgeInsets.all(15),
          child:Form(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 1.0,
                       // height: MediaQuery.of(context).size.height * 0.2,
                        child: Column(
                          children: [
                            const Text("  No.Handphone"),
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
                            const SizedBox(height: 5),
                            SwitchListTile(title:const Text(("Use the phone number to reset your password")) ,value: use_phone_to_reset, onChanged:(value){
                              setState(() {
                                use_phone_to_reset = value;
                              });
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
