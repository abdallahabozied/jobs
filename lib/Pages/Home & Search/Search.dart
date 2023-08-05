import 'package:flutter/material.dart';
import 'package:jobsque/Pages/Home%20&%20Search/Search%20Filters.dart';
import 'package:jobsque/Pages/Home%20&%20Search/Search%20Null.dart';

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  TextEditingController searchcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        scrolledUnderElevation: 0,
        title: SizedBox(
          height: 55,
          child: TextField(
            controller: searchcontroller,
            onSubmitted: (value){
              setState(() {
                searchcontroller.text = value;
              });

            },
            decoration: InputDecoration(
              hintText: "  Type something... ",
              prefixIcon: Icon(Icons.search),
              alignLabelWithHint: true,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(40)),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(40),),
                borderSide: BorderSide(color: Colors.blue),
              ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(40)),
                  borderSide: BorderSide(color: Colors.blue),
                ),
            ),
            cursorColor: Colors.blue,
          ),
        ),
      ),
      body: searchcontroller.text.isEmpty ? Search_Null() : Search_Filters(),
    );
  }
}
