import 'package:flutter/material.dart';
import 'package:jobsque/Model/jobpost.dart';
import 'package:jobsque/Network/HTTP.dart';
import 'package:jobsque/Pages/Home%20&%20Search/Home_Home.dart';
import 'package:jobsque/Pages/Job%20Detalis%20&%20Apply/success%20apply.dart';
import 'package:jobsque/Shared%20functions.dart';
import 'package:provider/provider.dart';

class Apply_Job extends StatefulWidget {
  const Apply_Job({super.key});

  @override
  State<Apply_Job> createState() => _Apply_JobState();
}

List<String> options = ["option1 ", "option 2", "option 3", "option 4"];
List<String> jobs = [
  "Senior UX Designer ",
  "Senior UX Designer",
  "Graphic Designer",
  "Front-End Developer"
];

class _Apply_JobState extends State<Apply_Job> {
  String currentoption = options[0];

  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  final TextEditingController _usernamecontroler = TextEditingController();
  final TextEditingController _emailcontroler = TextEditingController();
  final TextEditingController _phonecontroler = TextEditingController();
  int index = 0;
  bool iscompleted = false;

  @override
  Widget build(BuildContext context) {
    var prov = Provider.of<Jobs>(context);
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          scrolledUnderElevation: 0,
          centerTitle: true,
          title: const Text("Apply Job"),
        ),
        body: Stepper(
          elevation: 0,
          onStepContinue: () {
        final islaststep = index == getSteps().length - 1;
        if (islaststep) {
          setState(() => iscompleted = true);
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => const Success_Apply(),
              ));
        } else {
          setState(() {
            index += 1;
          });
        }
          },
          onStepCancel: index == 0 ? null : () => setState(() => index -= 1),
          onStepTapped: (step) => setState(() => index = step),
          controlsBuilder: (context, details) {
        final islaststep = index == getSteps().length - 1;
        return Row(
          children: [
            Expanded(
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blueAccent[700],
                      minimumSize: const Size(140, 50)),
                  onPressed: islaststep? (){
                    prov.Addtoapplied(list3[prov.appliedjobid-1]);
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const Home(),));
                  } : details.onStepContinue,
                  child: Text(
                    islaststep ? "Submit" : "Next",
                    style: const TextStyle(color: Colors.white),
                  )),
            ),
            const SizedBox(width: 10),
            if (index != 0)
              Expanded(
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.grey[400],
                        minimumSize: const Size(140, 50)),
                    onPressed: details.onStepCancel,
                    child: const Text(
                      "Back",
                      style: TextStyle(color: Colors.white),
                    )),
              )
          ],
        );
          },
          currentStep: index,
          type: StepperType.horizontal,
          steps: [
        Step(
          state: index > 0 ? StepState.complete : StepState.indexed,
          isActive: index >= 0,
          label: const Text("BioData"),
          title: const Divider(),
          content: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("Biodata",
                  style: TextStyle(
                      fontSize: 30,
                      color: Colors.black,
                      fontWeight: FontWeight.w600)),
              Text("Fill in your bio data Correctly",
                  style: TextStyle(
                      color: Colors.grey[400],
                      fontWeight: FontWeight.w400)),
              const SizedBox(height: 15),
              Form(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                key: formkey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("Full Name",
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.black,
                            fontWeight: FontWeight.w400)),
                    TextFormField(
                      controller: _usernamecontroler,
                      decoration: const InputDecoration(
                          hintText: "  Full Name",
                          prefixIcon: Icon(Icons.person),
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
                      keyboardType: TextInputType.name,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (value) {
                        if (value!.length <= 3 || value.length >= 30) {
                          return "Username must be between 3 ~ 20 characters";
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 10),
                    const Text("Email",
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.black,
                            fontWeight: FontWeight.w400)),
                    TextFormField(
                      controller: _emailcontroler,
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
                    const SizedBox(height: 10),
                    const Text("No.Handphone",
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.black,
                            fontWeight: FontWeight.w400)),
                    TextFormField(
                      controller: _phonecontroler,
                      autofillHints: const [AutofillHints.email],
                      decoration: const InputDecoration(
                          hintText: "  Phone",
                          prefixIcon: Icon(Icons.phone_android),
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
                      keyboardType: TextInputType.phone,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (input) => input!.length == 11
                          ? null
                          : "Enter Valid Number...",
                    ),
                    SizedBox(
                        height: MediaQuery.of(context).size.height * 0.03)
                  ],
                ),
              ),
            ],
          ),
        ),
        Step(
            state: index > 1 ? StepState.complete : StepState.indexed,
            isActive: index >= 1,
            label: const Text("Type of work"),
            title: const Divider(),
            content: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("Type of work",
                    style: TextStyle(
                        fontSize: 30,
                        color: Colors.black,
                        fontWeight: FontWeight.w600)),
                Text("Fill in your bio data Correctly",
                    style: TextStyle(
                        color: Colors.grey[400],
                        fontWeight: FontWeight.w400)),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.5,
                  child: ListView.builder(
                    itemCount: 4,
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.grey,
                                ),
                                borderRadius: BorderRadius.circular(20)),
                            child: ListTile(
                              contentPadding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              trailing: Radio(
                                  value: options[index],
                                  groupValue: currentoption,
                                  onChanged: (value) {
                                    setState(() {
                                      currentoption = value.toString();
                                    });
                                  }),
                              selectedTileColor: Colors.blue[700],
                              title: Text(
                                jobs[index],
                                style:
                                    const TextStyle(fontWeight: FontWeight.w500),
                              ),
                              subtitle: Text(
                                "CV.pdf  . portofolio.pdf",
                                style: TextStyle(color: Colors.grey[600]),
                              ),
                            ),
                          ),
                          const SizedBox(height: 10)
                        ],
                      );
                    },
                  ),
                )
              ],
            )),
        Step(
            state: index > 2 ? StepState.complete : StepState.indexed,
            isActive: index >= 2,
            label: const Text("Upload Portofolio"),
            title: const Divider(),
            content: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("Upload Portofolio",
                    style: TextStyle(
                        fontSize: 30,
                        color: Colors.black,
                        fontWeight: FontWeight.w600)),
                Text("Fill in your bio data Correctly",
                    style: TextStyle(
                        color: Colors.grey[400],
                        fontWeight: FontWeight.w400)),
                const SizedBox(height: 10),
                const Text("Upload CV",
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        fontWeight: FontWeight.w400)),
                const SizedBox(height: 10),
                Container(
                    height: MediaQuery.of(context).size.height * 0.1,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: Colors.blue.shade700)),
                    child: ListTile(
                      contentPadding: const EdgeInsets.symmetric(horizontal: 10),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      trailing: SizedBox(
                        width: 50,
                        child: Row(
                          children: [
                            Icon(Icons.mode_edit_outline_rounded,
                                color: Colors.blue[700]),
                            const SizedBox(width: 2),
                            const RotationTransition(
                                turns: AlwaysStoppedAnimation(45 / 360),
                                child: Icon(Icons.add_circle_outline,
                                    color: Colors.red)),
                          ],
                        ),
                      ),
                      leading: const Icon(Icons.picture_as_pdf_rounded,
                          color: Colors.red),
                      title: const Text(
                        "Rafif Dain.CV",
                        style: TextStyle(fontWeight: FontWeight.w500),
                      ),
                      subtitle: Text(
                        "CV.pdf 300KB",
                        style: TextStyle(color: Colors.grey[600]),
                      ),
                    )),
                const SizedBox(height: 20),
                const Text("Other File",
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        fontWeight: FontWeight.w400)),
                Container(
                    height: MediaQuery.of(context).size.height * 0.23,
                    width: MediaQuery.of(context).size.width * 1,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: Colors.blue.shade700)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InkWell(
                            child: Icon(
                          Icons.upload_file_sharp,
                          color: Colors.blue[700],
                        )),
                        const SizedBox(height: 10),
                        const Text("Upload your other file",
                            style: TextStyle(
                                fontSize: 20,
                                color: Colors.black,
                                fontWeight: FontWeight.w600)),
                        const SizedBox(height: 5),
                        Text("Max.file size 10 MB",
                            style: TextStyle(
                                color: Colors.grey[400],
                                fontWeight: FontWeight.w400)),
                        const SizedBox(height: 10),
                        MaterialButton(
                          minWidth: 30,
                          height: 30,
                          disabledColor: Colors.blueAccent.shade100,
                          color: Colors.blue.shade50,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50),
                          ),
                          onPressed: null,
                          child: SizedBox(
                            width: 150,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.file_upload_outlined,
                                    color: Colors.blue[700]),
                                const SizedBox(width: 5),
                                Text(
                                  "Add File",
                                  style: TextStyle(
                                      fontSize: 10,
                                      color: Colors.blue[700]),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    )),
                const SizedBox(height: 20),
              ],
            )),
          ],
        ));
  }
}
