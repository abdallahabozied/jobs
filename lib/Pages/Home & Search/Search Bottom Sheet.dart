import 'package:flutter/material.dart';
import 'package:jobsque/Shared functions.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';
class Search_Bottom_Sheet extends StatefulWidget {
  const Search_Bottom_Sheet({super.key});

  @override
  State<Search_Bottom_Sheet> createState() => _Search_Bottom_SheetState();
}

class _Search_Bottom_SheetState extends State<Search_Bottom_Sheet> {
  final TextEditingController _jobtitlecontroler = TextEditingController();
  final TextEditingController _locationcontroler = TextEditingController();
  final TextEditingController _salarycontroler = TextEditingController();
  static List<Job_Type?> _job_types = [
    Job_Type(id: 1, name: "FullTime"),
    Job_Type(id: 2, name: "Remote"),
    Job_Type(id: 3, name: "Contract"),
    Job_Type(id: 4, name: "PartTime"),
    Job_Type(id: 5, name: "onsite"),
    Job_Type(id: 6, name: "Internship"),
  ];

  final _items = _job_types.map((_job_types) => MultiSelectItem<Job_Type>(_job_types!, _job_types.name!))
      .toList();
  List<Animal?> _selected_jobs = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        scrolledUnderElevation: 0,
        centerTitle: true,
        title: Text("Set Filter"),
        actions: [MaterialButton(
          onPressed: (){
            setState(() {
              _salarycontroler.text ="";
              _locationcontroler.text="";
              _jobtitlecontroler.text="";

            });
          },
          child: Text("Reset",style: TextStyle(fontSize: 15,color: Colors.blue),),
        ),
    ]
    ),
      body:SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            Text("Job Title"),
            TextFormField(
              controller: _jobtitlecontroler,
              decoration: const InputDecoration(
                  hintText: "  Job Title",
                  prefixIcon: Icon(Icons.shopping_bag),
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
                return null;
              },
            ),
            SizedBox(height: MediaQuery.of(context).size.height*0.02),
            Text("Location"),
            TextFormField(
              controller: _locationcontroler,
              decoration: const InputDecoration(
                  hintText: "  Location",
                  prefixIcon: Icon(Icons.location_on),
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
                return null;
              },
            ),
            SizedBox(height: MediaQuery.of(context).size.height*0.02),
            Text("Salary"),
            TextFormField(
              controller: _salarycontroler,
              decoration: const InputDecoration(
                  hintText: "  Salary",
                  prefixIcon: Icon(Icons.location_on),
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
                return null;
              },
            ),
            SizedBox(height: MediaQuery.of(context).size.height*0.02),
            Text("Job Type"),
            Container(
              width: MediaQuery.of(context).size.width*0.8,
              child: MultiSelectChipField(
                items: _items,
                decoration: BoxDecoration(
                  border: Border.all(

                      width: 0.5, style: BorderStyle.none),
                ),
                onTap: (item) {
                  _selected_jobs == false ||
                      _selected_jobs.isEmpty
                      ? Container(
                      padding: EdgeInsets.all(10),
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "None selected",
                        style:
                        TextStyle(color: Colors.black54),
                      ))
                      : Container();
                },
                headerColor: Colors.black54,
                showHeader: false,
                scroll: false,
                selectedChipColor: Colors.blue.withOpacity(0.2),
                initialValue: _selected_jobs,
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height*0.02),
            Center(
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blueAccent[700],
                      minimumSize: const Size(300, 50)),
                  onPressed: () {
                  },
                  child: const Text(
                    "Show results",
                    style: TextStyle(color: Colors.white),
                  )),
            )
          ],
        ),
      ) ,
    );
  }
}
