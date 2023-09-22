import 'package:flutter/material.dart';
import 'package:jobsque/Shared%20functions.dart';

class email_edit extends StatefulWidget {
  const email_edit({super.key});

  @override
  State<email_edit> createState() => _email_editState();
}

class _email_editState extends State<email_edit> {
  TextEditingController _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          elevation: 0,
          scrolledUnderElevation: 0,
          title: const Text("Email Address",
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
                    height: MediaQuery.of(context).size.height * 0.2,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text("Main E-mail Address"),
                        const SizedBox(height: 5),
                        TextFormField(
                          controller: _emailController,
                          autofillHints: const [AutofillHints.email],
                          decoration: const InputDecoration(
                              hintText: "  Email",
                              prefixIcon: Icon(Icons.email),
                              alignLabelWithHint: true,
                              border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20)),
                                  borderSide: BorderSide(color: Colors.red)),
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
                          keyboardType: TextInputType.emailAddress,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: (input) => input!.isValidEmail()
                              ? null
                              : "Enter Valid email...",
                        ),
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
