import 'package:flutter/material.dart';
class Search_Null extends StatefulWidget {
  const Search_Null({super.key});

  @override
  State<Search_Null> createState() => _Search_NullState();
}

class _Search_NullState extends State<Search_Null> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: MediaQuery.of(context).size.height * 0.02),
            Container(
                decoration: BoxDecoration(
                    color: Colors.grey.shade200
                ),
                width: MediaQuery.of(context).size.width*1,
                height: MediaQuery.of(context).size.width*0.09,
                child: Row(
                  children: [Padding(padding: EdgeInsets.only(left: 20),
                    child: Text("Recent Searches",style: TextStyle(color: Colors.grey , fontWeight: FontWeight.bold)),)],
                )
            ),
            Container(height: MediaQuery.of(context).size.height * 0.35,
              child: ListView.builder(itemCount: 10,itemBuilder: (context, index) {
                return Column(
                  children: [
                    Container(
                      height:MediaQuery.of(context).size.height * 0.06,
                      child: ListTile(
                        leading: Icon(Icons.access_time_rounded,),
                        title: Text("Title ${index+1}",style: TextStyle(fontSize: 20),),
                        trailing:RotationTransition(
                            turns: AlwaysStoppedAnimation(45/360),
                            child: Icon(Icons.add_circle_outline,color: Colors.red)),
                      ),
                    ),
                  ],
                );
              },),

            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.02),
            Container(
              decoration: BoxDecoration(
                  color: Colors.grey.shade200
              ),
              width: MediaQuery.of(context).size.width*1,
              height: MediaQuery.of(context).size.width*0.09,
              child: Row(
                children: [Padding(padding: EdgeInsets.only(left: 20),
                  child: Text("Popular Searches",style: TextStyle(color: Colors.grey , fontWeight: FontWeight.bold)),)],
              ),
            ),
            Container(height: MediaQuery.of(context).size.height * 0.35,
              child: ListView.builder(itemCount: 5,itemBuilder: (context, index) {
                return Column(
                  children: [
                    Container(
                      height:MediaQuery.of(context).size.height * 0.06,
                      child: ListTile(
                        leading: Icon(Icons.access_time_rounded,),
                        title: Text("Title ${index+1}",style: TextStyle(fontSize: 20),),
                        trailing: Icon(Icons.arrow_circle_right_outlined,color: Colors.blueAccent),
                      ),
                    ),
                  ],
                );
              },),

            ),


          ],
        ),
      ),
    );
  }
}
