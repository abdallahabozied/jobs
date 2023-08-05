import 'package:flutter/material.dart';
import 'package:jobsque/Pages/Create%20Account/interested%20work%20type.dart';
class Intersted_Work extends StatefulWidget {
  const Intersted_Work({super.key});

  @override
  State<Intersted_Work> createState() => _Intersted_WorkState();
}

class _Intersted_WorkState extends State<Intersted_Work> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          scrolledUnderElevation: 0,
        ),
        body: Container(
            alignment: Alignment.topCenter,
            padding: EdgeInsets.all(30),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text("Where are your prefered location?",
                      style: TextStyle(fontSize: 33)),
                  SizedBox(height: 10),
                  Text(
                      "Let us know, where is the location you want at this time , So we can adjust it.",
                      style:
                          TextStyle(color: Colors.black54, fontSize: 20)),
                  SizedBox(height: 10),
                  Container(
                    width: double.infinity,
                    height: 350,
                    child: GridView.builder(
                      itemCount: 20,
                      scrollDirection: Axis.vertical,
                      gridDelegate:
                      SliverGridDelegateWithFixedCrossAxisCount(
                          mainAxisExtent: 100,
                          crossAxisCount: 2,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10,
                      ),
                     itemBuilder: (context, index) {
                       return Container(
                         padding: EdgeInsets.all(5),
                         decoration: BoxDecoration(
                             borderRadius: BorderRadius.circular(20),
                             border: Border.all(color: Colors.blue)),
                         child: Column(
                           mainAxisAlignment: MainAxisAlignment.start,
                           crossAxisAlignment: CrossAxisAlignment.start,
                           children: [
                             CircleAvatar(
                               backgroundImage:AssetImage("Assets/images/1.jpg"),
                               maxRadius: 20,
                               minRadius: 20,
                             ),
                             SizedBox(height: 15),
                             Text(
                               "UI/UX Design",
                               style: TextStyle(fontSize: 20),
                             )
                           ],
                         ));

                     },
                    ),
                  ),
                  Container(
                      alignment: Alignment.topCenter,
                      width: 400,
                      height: 100,
                      child: Column(children: [
                        SizedBox(height: 30),
                        ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.blueAccent[700],
                                minimumSize: const Size(300, 50)),
                            onPressed: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context) => Intersted_Work_type()));
                            },
                            child: const Text(
                              "Next",
                              style: TextStyle(color: Colors.white),
                            )),
                      ]))
                ])));
  }
}
