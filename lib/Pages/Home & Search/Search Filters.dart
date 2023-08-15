import 'package:flutter/material.dart';
import 'package:jobsque/Pages/Home%20&%20Search/Search%20Bottom%20Sheet.dart';
class Search_Filters extends StatefulWidget {
  const Search_Filters({super.key});

  @override
  State<Search_Filters> createState() => _Search_FiltersState();
}

class _Search_FiltersState extends State<Search_Filters> {
 String? _dropdownvalue = "Not selected";
 String? _dropdownvalue1 = "Not selected";
 String? _dropdownvalue2 = "Not selected";

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IconButton(onPressed: (){
              showModalBottomSheet(
                isScrollControlled: true,
                shape: RoundedRectangleBorder(side: const BorderSide(width: 2,color: Colors.blue),borderRadius: BorderRadius.circular(30)),
                backgroundColor: Colors.white,
                context: context,
                builder: (context) {
                return Padding(
                  padding:const EdgeInsets.all(8.0),
                  child: SizedBox(
                  height: MediaQuery.of(context).size.height*0.9
                  ,child: const Search_Bottom_Sheet()),
                );

              },);
              }, icon: const Icon(Icons.filter_alt)),
              DropdownButton(
                  onChanged:(value){
                    setState(() {
                      _dropdownvalue= value;
                    });
                  },
                  value: _dropdownvalue,isExpanded: false,borderRadius: BorderRadius.circular(20),items: const [
                DropdownMenuItem(value: "Not selected", child: Text("Not selected")),
                DropdownMenuItem(value: "Remote1", child: Text("Remote1")),
                DropdownMenuItem(value: "Fulltime1", child: Text("Fulltime1")),
              ]),
              DropdownButton(
                  onChanged:(value){
                    setState(() {
                      _dropdownvalue1= value;
                    });
                  },
                  value: _dropdownvalue1,isExpanded: false,borderRadius: BorderRadius.circular(20),items: const [
                DropdownMenuItem(value: "Not selected", child: Text("Not selected")),
                DropdownMenuItem(value: "Remote2", child: Text("Remote2")),
                DropdownMenuItem(value: "Fulltime2", child: Text("Fulltime2")),
              ]),
              DropdownButton(
                  onChanged:(value){
                    setState(() {
                      _dropdownvalue2= value;
                    });
                  },
                  value: _dropdownvalue2,isExpanded: false,borderRadius: BorderRadius.circular(20),items: const [
                DropdownMenuItem(value: "Not selected", child: Text("Not selected")),
                DropdownMenuItem(value: "Remote3", child: Text("Remote3")),
                DropdownMenuItem(value: "Fulltime3", child: Text("Fulltime3")),
              ]),


            ],
          )
        ],
      ),
    );
  }
}
