import 'package:flutter/material.dart';
import 'package:jobsque/Model/jobpost.dart';
import 'package:jobsque/Pages/Home%20&%20Search/Search.dart';
import 'package:jobsque/Pages/Home%20&%20Search/recent%20job.dart';
import 'package:jobsque/Pages/Job%20Detalis%20&%20Apply/Job%20Details.dart';
import 'package:jobsque/Pages/Job%20Detalis%20&%20Apply/apply%20job.dart';
import 'package:provider/provider.dart';
import '../../Network/HTTP.dart' as varHTTP;
import 'package:shared_preferences/shared_preferences.dart';

SharedPreferences? logindata;
class Home_Screen extends StatefulWidget {
  const Home_Screen({super.key});

  @override
  State<Home_Screen> createState() => _Home_ScreenState();
}

class _Home_ScreenState extends State<Home_Screen> {

  @override
  void initState() {
    //httpConnections.GetAllPostswithphotos();
    httpConnections.fetchuser();
    varHTTP.HTTPConnections().GetAllPostswithphotos();
    super.initState();
  }

  @override
   Widget build(BuildContext context) {
    var prov = Provider.of<Jobs>(context);
    return Scaffold(
        body: FutureBuilder(
          future: httpConnections.GetAllPostswithphotos(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              print(snapshot);
              return SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                              SizedBox(
                                  height: MediaQuery.of(context).size.height *
                                      0.05),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [

                                      Text(varHTTP.name,
                                          style: TextStyle(fontSize: 20)),
                                      Text("Create better future for yourself here ",
                                          style: TextStyle(
                                              fontSize: 15,
                                              color: Colors.black54))
                                    ],
                                  ),
                                  InkWell(
                                    onTap: (){},
                                    child: Container(
                                        width: 40,
                                        height: 40,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(50),
                                            border: Border.all(
                                                color: Colors.black)),
                                        child: const Icon(
                                          Icons.notifications_outlined,
                                          color: Colors.black,
                                        )),
                                  )
                                ],
                              ),
                              SizedBox(
                                  height: MediaQuery.of(context).size.height *
                                      0.02),
                              TextField(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => const Search(),
                                      ));
                                },
                                decoration: const InputDecoration(
                                  hintText: "  Search ",
                                  prefixIcon: Icon(Icons.search),
                                  alignLabelWithHint: true,
                                  border: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(40)),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(40),
                                    ),
                                    borderSide: BorderSide(color: Colors.blue),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(40)),
                                    borderSide: BorderSide(color: Colors.blue),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.02,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text("Suggested Job",
                                      style: TextStyle(fontSize: 20)),
                                  InkWell(
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    const Recent_Jobs_All()));
                                      },
                                      child: Text(
                                        "View all",
                                        style: TextStyle(
                                            fontSize: 15,
                                            color: Colors.blue[700]),
                                      )),
                                ],
                              ),
                              SizedBox(
                                  height: MediaQuery.of(context).size.height *
                                      0.02),

                              SizedBox(
                                width: MediaQuery.of(context).size.width * 1,
                                height:
                                    MediaQuery.of(context).size.height * 0.27,
                                child: ListView.builder(
                                  itemCount: snapshot.data?.length,
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder: (context, index) {
                                    return Container(
                                      margin: const EdgeInsets.symmetric(
                                          horizontal: 8),
                                      decoration: BoxDecoration(
                                          color: Colors.grey.shade100,
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          border:
                                              Border.all(color: Colors.black)),
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10),
                                      width: MediaQuery.of(context).size.width *
                                          0.75,
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.25,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          ListTile(
                                            leading: Container(
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            22)),
                                                child: Container(width: 50,height: 50,decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.circular(20)
                                                ),
                                                  child: Image.network(
                                                    "${snapshot.data?[index]["image"]}"),
                                                )),
                                            title: InkWell(
                                                onTap: () {
                                                  prov.postid = index;
                                                  Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                        builder: (context) =>
                                                            const Job_Detail(),
                                                      ));
                                                },
                                                child: Text(
                                                  snapshot.data?[index]["name"],
//                                             "${list3[index]["title"]}",
                                                  maxLines: 2,
                                                )),
                                            subtitle: Text(
                                                snapshot.data?[index]["job_type"],
//                                           "${list3[index]["subtitle"]}",
                                                maxLines: 1),
                                            trailing: InkWell(
                                                onTap: () {
                                                  // context
                                                  //     .read<Jobs>()
                                                  //     .Addtosaved(snapshot
                                                  //         .data?[index]);
                                                  varHTTP.HTTPConnections().Addtosaved(varHTTP.id,snapshot.data?[index]["data"]("id"));
                                                  ScaffoldMessenger.of(context)
                                                      .showSnackBar(
                                                          const SnackBar(
                                                              content: Text(
                                                                  "Saved")));
                                                },




                                                onDoubleTap: () {
                                                  context
                                                      .read<Jobs>()
                                                      .Removefromsaved(snapshot
                                                          .data?[index]);
                                                  ScaffoldMessenger.of(context)
                                                      .showSnackBar(
                                                          const SnackBar(
                                                              content: Text(
                                                                  "Removed")));
                                                },
                                                child: const Icon(
                                                  Icons.bookmark,
                                                    color: Colors.black54,
                                                )),
                                            contentPadding:
                                                const EdgeInsets.symmetric(
                                                    horizontal: 10),
                                          ),
                                          SizedBox(
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.015),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              MaterialButton(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 25),
                                                minWidth: 10,
                                                height: 30,
                                                disabledColor:
                                                    Colors.blueAccent.shade100,
                                                color: Colors.blue.shade50,
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(50),
                                                ),
                                                onPressed: null,
                                                child: Text(
                                                  "Fulltime",
                                                  style: TextStyle(
                                                      fontSize: 10,
                                                      color: Colors.blue[700]),
                                                ),
                                              ),
                                              MaterialButton(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 25),
                                                minWidth: 30,
                                                height: 30,
                                                disabledColor:
                                                    Colors.blueAccent.shade100,
                                                color: Colors.blue.shade50,
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(50),
                                                ),
                                                onPressed: null,
                                                child: Text(
                                                  "Part Time",
                                                  style: TextStyle(
                                                      fontSize: 10,
                                                      color: Colors.blue[700]),
                                                ),
                                              ),
                                              MaterialButton(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 25),
                                                minWidth: 10,
                                                height: 30,
                                                disabledColor:
                                                    Colors.blueAccent.shade100,
                                                color: Colors.blue.shade50,
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(50),
                                                ),
                                                onPressed: null,
                                                child: Text(
                                                  "Fulltime",
                                                  style: TextStyle(
                                                      fontSize: 10,
                                                      color: Colors.blue[700]),
                                                ),
                                              ),
                                            ],
                                          ),
                                          const SizedBox(height: 3),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              RichText(
                                                  text: TextSpan(children: [
                                                TextSpan(
                                                    text:
                                                        "${snapshot.data?[index]["id"] + 1 * 1000}",
//                                                   text: "${list3[index]["id"] + 1 * 1000}",
                                                    style: const TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 20)),
                                                const TextSpan(
                                                    text: '/month',
                                                    style: TextStyle(
                                                        color: Colors.grey,
                                                        fontSize: 10)),
                                              ])),
                                              MaterialButton(
                                                shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20)),
                                                color:
                                                    Colors.blueAccent.shade400,
                                                onPressed: () {
                                                  prov.appliedjobid = snapshot
                                                      .data?[index]["id"];
                                                  //prov.appliedjobid = list3[index]["id"];
                                                  Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                        builder: (context) =>
                                                            const Apply_Job(),
                                                      ));
                                                },
                                                child: const Text(
                                                  "Apply Now",
                                                  style: TextStyle(
                                                      color: Colors.white),
                                                ),
                                              )
                                            ],
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                ),
                              ),
                              const SizedBox(height: 10),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text("Recent Job",
                                      style: TextStyle(fontSize: 20)),
                                  InkWell(
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    const Recent_Jobs_All()));
                                      },
                                      child: Text(
                                        "View all",
                                        style: TextStyle(
                                            fontSize: 15,
                                            color: Colors.blue[700]),
                                      )),
                                ],
                              ),
                              const SizedBox(height: 1),
                              //MediaQuery.of(context).size.height * 0.015),

                              SizedBox(
                                width: MediaQuery.of(context).size.width * 1,
                                height:
                                    MediaQuery.of(context).size.height * 0.8,
                                child: ListView.builder(
                                  itemCount: snapshot.data?.length,
                                  itemBuilder: (context, index) {
                                    return Column(
                                      children: [
                                        ListTile(
                                          leading: Container(width: 50,height: 50,decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(20)
                                          ),
                                            child: Image.network(snapshot
                                                .data?[index]["image"]),
                                          ),
                                          // "${list3[index]["thumbnailUrl"]}"),
                                          title: InkWell(
                                            onTap: () {
                                              // prov.postid = index;
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (context) =>
                                                        const Job_Detail(),
                                                  ));
                                            },
                                            child: Text(
                                                "${snapshot.data?[index]["name"]}",
                                                maxLines: 2,
                                                style: const TextStyle(
                                                    fontSize: 20,
                                                    color: Colors.black)),
                                          ),
                                          subtitle: Text(
                                              "${snapshot.data?[index]["job_type"]}",
                                              maxLines: 1,
                                              style: const TextStyle(
                                                  fontSize: 15,
                                                  color: Colors.black12)),
                                          trailing: InkWell(
                                              onTap: () {
                                                print("job id is ====== > ");
                                                print(snapshot.data?[index]["id"]);
                                                print("user id is ====== > ");
                                                print(varHTTP.id);
                                                varHTTP.HTTPConnections().Addtosaved(varHTTP.id,snapshot.data?[index]["id"]);
                                                ScaffoldMessenger.of(context)
                                                    .showSnackBar(
                                                        const SnackBar(
                                                            content:
                                                                Text("Saved")));
                                              },
                                              onSecondaryTap: () {
                                                // context
                                                //     .read<Jobs>()
                                                //     .Removefromsaved(
                                                //         snapshot.data?[index]);
                                                varHTTP.HTTPConnections().deleteSavedJob(index);
                                                ScaffoldMessenger.of(context)
                                                    .showSnackBar(
                                                        const SnackBar(
                                                            content: Text(
                                                                "Removed")));
                                              },
                                              child: const Icon(
                                                Icons.bookmark,
                                                color: Colors.black54,
                                              )),
                                          contentPadding:
                                              const EdgeInsets.symmetric(
                                                  horizontal: 10),
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                            MaterialButton(
                                              minWidth: 10,
                                              height: 20,
                                              disabledColor:
                                                  Colors.blueAccent.shade100,
                                              color: Colors.blue.shade50,
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(50),
                                              ),
                                              onPressed: null,
                                              child: Text(
                                                "Fulltime",
                                                style: TextStyle(
                                                    fontSize: 10,
                                                    color: Colors.blue[700]),
                                              ),
                                            ),
                                            MaterialButton(
                                              minWidth: 10,
                                              height: 20,
                                              disabledColor:
                                                  Colors.blueAccent.shade100,
                                              color: Colors.blue.shade50,
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(50),
                                              ),
                                              onPressed: null,
                                              child: Text(
                                                "Fulltime",
                                                style: TextStyle(
                                                    fontSize: 10,
                                                    color: Colors.blue[700]),
                                              ),
                                            ),
                                            MaterialButton(
                                              minWidth: 10,
                                              height: 20,
                                              disabledColor:
                                                  Colors.blueAccent.shade100,
                                              color: Colors.blue.shade50,
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(50),
                                              ),
                                              onPressed: null,
                                              child: Text(
                                                "Fulltime",
                                                style: TextStyle(
                                                    fontSize: 10,
                                                    color: Colors.blue[700]),
                                              ),
                                            ),
                                            RichText(
                                                text: TextSpan(children: [
                                              TextSpan(
                                                  text:
                                                      "${snapshot.data?[index]["id"]}",
                                                  //  text: "${list[index]["id"]}",
                                                  style: const TextStyle(
                                                      color: Colors.green,
                                                      fontSize: 20)),
                                              const TextSpan(
                                                  text: '/month',
                                                  style: TextStyle(
                                                      color: Colors.grey,
                                                      fontSize: 15)),
                                            ]))
                                          ],
                                        ),
                                        SizedBox(
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.02),
                                        const Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 50),
                                          child: Divider(
                                            color: Colors.black12,
                                          ),
                                        )
                                      ],
                                    );
                                  },
                                ),
                              ),
                            ]),
                ),
              );
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ));
  }
}
