import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:jobsque/Pages/Home%20&%20Search/Search.dart';
import 'package:jobsque/Pages/Job%20Detalis%20&%20Apply/Job%20Details.dart';

class Home_Screen extends StatefulWidget {
  const Home_Screen({super.key});

  @override
  State<Home_Screen> createState() => _Home_ScreenState();
}

class _Home_ScreenState extends State<Home_Screen> {
  Color indexcolor =Colors.black12;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: MediaQuery.of(context).size.height * 0.05),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text("Hi Abdallah Abozaied", style: TextStyle(fontSize: 20)),
                      Text("Create better future for yourself here", style: TextStyle(fontSize: 15,color: Colors.black54))
                    ],
                  ),
                  InkWell(
                    onTap: () {},
                    child: Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            border: Border.all(color: Colors.black)),
                        child: Icon(
                          Icons.notifications_outlined,
                          color: Colors.black,
                        )),
                  )
                ],
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.02),
              TextField(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => Search(),));
                },
                decoration: InputDecoration(
                  hintText: "  Search ",
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
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Suggested Job", style: TextStyle(fontSize: 20)),
                  InkWell(
                      child: Text(
                    "View all",
                    style: TextStyle(fontSize: 15, color: Colors.blue[700]),
                  )),
                ],
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.02),
              Container(
                width: MediaQuery.of(context).size.width * 1,
                height: MediaQuery.of(context).size.height * 0.27,
                child: ListView.builder(
                  itemCount: 5,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: EdgeInsets.symmetric(horizontal: 8),
                      decoration: BoxDecoration(
                        color: Colors.grey.shade100,
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(color: Colors.black)),
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      width: MediaQuery.of(context).size.width * 0.75,
                      height: MediaQuery.of(context).size.height * 0.25,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          ListTile(
                            leading: CircleAvatar(radius: 22,backgroundImage:AssetImage("Assets/images/1.jpg") ,),
                            title: InkWell(onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context) => Job_Detail(),));
                            },child: Text("Product Designer ${index}")),
                            subtitle: Text("Zoom . United states"),
                            trailing: InkWell(onTap: (){
                              setState(() {
                                indexcolor = Colors.blue;
                              });},onDoubleTap: (){
                              setState(() {
                                indexcolor = Colors.black12;
                              });

                            },child: Icon(Icons.bookmark,color: indexcolor,)),
                           contentPadding: EdgeInsets.symmetric(horizontal: 10),
                          ),
                          SizedBox(height: MediaQuery.of(context).size.height * 0.015),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              MaterialButton(
                                padding: EdgeInsets.symmetric(horizontal: 25),
                                minWidth: 10,
                                height: 30,
                                disabledColor: Colors.blueAccent.shade100,
                                color: Colors.blue.shade50,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(50),
                                ),
                                onPressed: null,
                                child: Text(
                                  "Fulltime",
                                  style: TextStyle(fontSize: 10,color: Colors.blue[700]),
                                ),
                              ),
                              MaterialButton(
                                padding: EdgeInsets.symmetric(horizontal: 25),
                                minWidth:30,
                                height: 30,
                                disabledColor: Colors.blueAccent.shade100,
                                color: Colors.blue.shade50,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(50),
                                ),
                                onPressed: null,
                                child: Text(
                                  "Fulltime",
                                  style: TextStyle(fontSize: 10,color: Colors.blue[700]),
                                ),
                              ),
                              MaterialButton(
                                padding: EdgeInsets.symmetric(horizontal: 25),

                                minWidth: 10,
                                height: 30,
                                disabledColor: Colors.blueAccent.shade100,
                                color: Colors.blue.shade50,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(50),
                                ),
                                onPressed: null,
                                child: Text(
                                  "Fulltime",
                                  style: TextStyle(fontSize: 10,color: Colors.blue[700]),
                                ),
                              ),

                            ],
                          ),
                          SizedBox(height: 3),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              RichText(text:TextSpan(
                                  children: [
                                    TextSpan(text: '\$12K-15K' ,style: TextStyle(color: Colors.black,fontSize: 20)),
                                    TextSpan(text: '/month' ,style: TextStyle(color: Colors.grey,fontSize: 10)),
                                  ]
                              )),
                              MaterialButton(
                                shape : RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15)
                                )
                                ,
                                color: Colors.blue[700],
                                onPressed: () {},
                                child: Text("Apply Now",style: TextStyle(color: Colors.white),),
                              )
                            ],
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Recent Job", style: TextStyle(fontSize: 20)),
                  InkWell(
                      child: Text(
                        "View all",
                        style: TextStyle(fontSize: 15, color: Colors.blue[700]),
                      )),
                ],
              ),
              SizedBox(height: 1),//MediaQuery.of(context).size.height * 0.015),
                Container(
                  width: MediaQuery.of(context).size.width * 1,
                  height: MediaQuery.of(context).size.height * 0.6,

                  child: ListView.builder(itemCount: 30,itemBuilder: (context, index) {
                  return  Column(
                    children: [
                      ListTile(
                          leading: CircleAvatar(radius: 22,backgroundImage:AssetImage("Assets/images/1.jpg") ,),
                          title: Text("Product Designer ${index+1}"),
                          subtitle: Text("Zoom . United states"),
                          trailing: InkWell(onTap: (){
                            setState(() {
                              indexcolor = Colors.blue;
                            });},onDoubleTap: (){
                            setState(() {
                              indexcolor = Colors.black12;
                            });
                          },child: Icon(Icons.bookmark,color: indexcolor,)),
                          contentPadding: EdgeInsets.symmetric(horizontal: 10),

                        ),
                      Row(

                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          MaterialButton(
                            minWidth: 10,
                            height: 20,
                            disabledColor: Colors.blueAccent.shade100,
                            color: Colors.blue.shade50,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50),
                            ),
                            onPressed: null,
                            child: Text(
                              "Fulltime",
                              style: TextStyle(fontSize: 10,color: Colors.blue[700]),
                            ),
                          ),
                          MaterialButton(
                            minWidth: 10,
                            height: 20,
                            disabledColor: Colors.blueAccent.shade100,
                            color: Colors.blue.shade50,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50),
                            ),
                            onPressed: null,
                            child: Text(
                              "Fulltime",
                              style: TextStyle(fontSize: 10,color: Colors.blue[700]),
                            ),
                          ),
                          MaterialButton(
                            minWidth: 10,
                            height: 20,
                            disabledColor: Colors.blueAccent.shade100,
                            color: Colors.blue.shade50,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50),
                            ),
                            onPressed: null,
                            child: Text(
                              "Fulltime",
                              style: TextStyle(fontSize: 10,color: Colors.blue[700]),
                            ),
                          ),
                          RichText(text:TextSpan(
                            children: [
                              TextSpan(text: '\$15K' ,style: TextStyle(color: Colors.green,fontSize: 20)),
                              TextSpan(text: '/month' ,style: TextStyle(color: Colors.grey,fontSize: 15)),
                            ]
                          ))
                        ],
                      ),
                      SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 50),
                        child: Divider(color: Colors.black12,),
                      )
                    ],
                  );
                  },

                  ),
                ),

        ]
        ),

      ),
    ));
  }
}
