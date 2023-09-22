import 'package:flutter/material.dart';
import 'package:jobsque/Model/jobpost.dart';
import 'package:jobsque/Network/HTTP.dart';
import 'package:jobsque/Pages/Job%20Detalis%20&%20Apply/apply%20job.dart';
import 'package:provider/provider.dart';

class Job_Detail extends StatefulWidget {
   const Job_Detail({super.key});

  @override
  State<Job_Detail> createState() => _Job_DetailState();
}

class _Job_DetailState extends State<Job_Detail> with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }
  Future refresh() async{
    setState((){
    });
  }
  @override
  Widget build(BuildContext context) {
    var prov = Provider.of<Jobs>(context);
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        scrolledUnderElevation: 0,
        centerTitle: true,
        title: const Text("Job Detail"),
        actions: const [Icon(Icons.bookmark_outlined)],
      ),
      body: FutureBuilder(
        future: HTTPConnections().fetchjob(prov.postid),
        builder: (context,snapshot) {
          if(snapshot.hasData){return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                      borderRadius:
                      BorderRadius.circular(20)),
                  child: Image.network(errorBuilder:
                      (context, error, stackTrace) {
                    return Container(
                        decoration: BoxDecoration(
                            borderRadius:
                            BorderRadius.circular(20)),
                        child: Image.asset("Assets/images/No_image.png",fit: BoxFit.fill,));
                  }, "${snapshot.data?["image"]}",fit: BoxFit.fill,),
                ),
                Title(color: Colors.black, child: Text("${snapshot.data?["name"]}",style: const TextStyle(fontSize: 25,fontWeight: FontWeight.w400),)),
                Text("${snapshot.data?["job_type"]}",style: const TextStyle(color: Colors.black54,fontSize: 20),),
                SizedBox(
                  width: 220,
                  child: Row(
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
                          "Onsite",
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
                          "Senior",
                          style: TextStyle(fontSize: 10,color: Colors.blue[700]),
                        ),
                      ),

                    ],
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.01,
                ),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.grey.shade100,
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(20)),
                  child: TabBar(
                    splashBorderRadius: BorderRadius.circular(20),
                    indicatorColor: Colors.blue[700],
                    controller: _tabController,
                    tabs: const [
                      Tab(
                        text: 'Discription',
                      ),
                      Tab(
                        text: 'Company',
                      ),
                      Tab(
                        text: 'People',
                      )
                    ],
                    labelColor: Colors.black,
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.01,
                ),
                Stack(
                  children: [
                    SizedBox(
                      width: double.infinity,
                      height: MediaQuery.of(context).size.height * 0.49,
                      child: TabBarView(controller: _tabController, children: [
                        SingleChildScrollView(
                            physics: const BouncingScrollPhysics(),
                            child: RichText(
                                text: TextSpan(children: [
                                  const TextSpan(
                                      text: "Job Description \n",
                                      style:
                                      TextStyle(fontSize: 30, color: Colors.black)),
                                  TextSpan(
                                      text:("${snapshot.data?["job_description"]}."),
                                      style: const TextStyle(color: Colors.black)),
                                  TextSpan(
                                      text:
                                      ("${snapshot.data?["job_type"]} \n \n"),
                                      style: const TextStyle(color: Colors.black)),
                                  const TextSpan(
                                      text: "Skill Required \n",
                                      style:
                                      TextStyle(fontSize: 30, color: Colors.black)),
                                  TextSpan(
                                      text:
                                      ("${snapshot.data?["job_skill"]} \n"),
                                      style: const TextStyle(color: Colors.black)),

                                ]))),
                        SingleChildScrollView(
                            physics: const BouncingScrollPhysics(),
                            child: Column(

                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text("Contact US",style: TextStyle(fontSize: 20)),
                                const SizedBox(height: 10),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(

                                      padding: const EdgeInsets.symmetric(horizontal: 8,vertical: 3),
                                      decoration: BoxDecoration(
                                          border: Border.all(color: Colors.grey.shade300),
                                          borderRadius: BorderRadius.circular(10)
                                      ),
                                      width: 170,
                                      height: 50,
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          const InkWell(child: Text("Email",style: TextStyle(color: Colors.grey),)),
                                          Text("${snapshot.data?["comp_email"]}",style: const TextStyle(fontWeight: FontWeight.w500,fontSize: 13))
                                        ],
                                      ),
                                    ),
                                    Container(

                                      padding: const EdgeInsets.symmetric(horizontal: 8,vertical: 3),
                                      decoration: BoxDecoration(
                                          border: Border.all(color: Colors.grey.shade300),
                                          borderRadius: BorderRadius.circular(10)
                                      ),
                                      width: 190,
                                      height: 50,
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          const InkWell(child: Text("Website",style: TextStyle(color: Colors.grey),)),
                                          Text("${snapshot.data?["comp_website"]}",style: const TextStyle(fontWeight: FontWeight.w500,fontSize: 12))
                                        ],
                                      ),
                                    )

                                  ],

                                ),
                                const SizedBox(height: 10),
                                RichText(
                                    text: TextSpan(children: [
                                      const TextSpan(
                                          text: "About Company \n \n",
                                          style:
                                          TextStyle(fontSize: 20, color: Colors.black)),
                                      TextSpan(
                                          text:
                                          ("${snapshot.data?["about_comp"]} \n"),
                                          style: const TextStyle(color: Colors.black)),
                                      TextSpan(
                                          text:
                                          ("${snapshot.data?["location"]} \n"),
                                          style: const TextStyle(color: Colors.black)),

                                    ])),
                              ],
                            )),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 1,
                          height: MediaQuery.of(context).size.height * 0.6,

                          child: ListView.builder(itemCount: 30,itemBuilder: (context, index) {
                            return  Column(
                              children: [
                                ListTile(
                                  leading: CircleAvatar(radius: 22,backgroundImage:NetworkImage("${snapshot.data?["image"]}")),
                                  title: Text("${snapshot.data?["id"]}",style:const TextStyle(fontWeight: FontWeight.w500,color: Colors.black)),
                                  subtitle: Text("${snapshot.data?["name"]}",style: TextStyle(fontWeight: FontWeight.w400,color: Colors.grey[600])),
                                  trailing:Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      const Text("Work During",style: TextStyle(color: Colors.grey)),
                                      Text("${snapshot.data?["id"]+1}",style: TextStyle(color: Colors.blue[700]))
                                    ],
                                  ),
                                  contentPadding: const EdgeInsets.symmetric(horizontal: 10),

                                ),
                                //SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                                const Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 50),
                                  child: Divider(color: Colors.black12,),
                                )
                              ],
                            );
                          },

                          ),
                        ),
                      ]),
                    ),
                    Container(
                      height: 100,
                    ),
                    Positioned(
                      left: MediaQuery.of(context).size.width * 00.125,
                      bottom: MediaQuery.of(context).size.height * 0.0001,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              elevation: 30,
                              shadowColor: Colors.black,
                              backgroundColor: Colors.blueAccent[700],
                              minimumSize: const Size(300, 50)),
                          onPressed: () {

                            Navigator.push(context, MaterialPageRoute(builder: (context) => const Apply_Job()));
                          },
                          child: const Text(
                            "Apply Now",
                            style: TextStyle(color: Colors.white),
                          )),

                    ),
                  ],
                )
              ],
            ),
          );}
          else{
             return const Center(
              child: CircularProgressIndicator(),
            );
          }

        }
      ),
    );
  }
}
