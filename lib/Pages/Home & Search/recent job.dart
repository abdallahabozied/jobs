import 'package:flutter/material.dart';
import 'package:jobsque/Model/jobpost.dart';
import 'package:jobsque/Network/HTTP.dart';
import 'package:provider/provider.dart';

HTTPConnections httpConnections = HTTPConnections();

class Recent_Jobs_All extends StatefulWidget {
  const Recent_Jobs_All({super.key});

  @override
  State<Recent_Jobs_All> createState() => _Recent_Jobs_AllState();
}

class _Recent_Jobs_AllState extends State<Recent_Jobs_All> {
  @override
  void initState() {
    // TODO: implement initState
    httpConnections.GetAllPostswithphotos();
  }

  @override
  Widget build(BuildContext context) {
    var prov = Provider.of<Jobs>(context);
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text("Recent Jobs"),
        ),
        body: FutureBuilder(
            future: HTTPConnections().GetAllPostswithphotos(),
            builder: (context, snapshot) {
              return snapshot.data!.isNotEmpty
                  ? SingleChildScrollView(
                      child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const SizedBox(height: 1),
                              //MediaQuery.of(context).size.height * 0.015),
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 1,
                                height:
                                    MediaQuery.of(context).size.height * 0.8,
                                child: ListView.builder(
                                  itemCount: snapshot.data!.length,
                                  itemBuilder: (context, index) {
                                    return Column(
                                      children: [
                                        ListTile(
                                          leading: Image.network(
                                              "${snapshot.data![index]["image"]}"),
                                          title: Text(
                                              "${snapshot.data![index]["name"]}",
                                              style: const TextStyle(
                                                  fontSize: 20,
                                                  color: Colors.black)),
                                          subtitle: Text(
                                              "${snapshot.data![index]["job_type"]}",
                                              style: const TextStyle(
                                                  fontSize: 15,
                                                  color: Colors.black12)),
                                          trailing: InkWell(
                                              onTap: () {
                                                prov.Addtosaved(snapshot.data![index]);
                                                ScaffoldMessenger.of(context)
                                                    .showSnackBar(
                                                        const SnackBar(
                                                            content:
                                                                Text("Saved")));
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
                                                  text: "${snapshot.data![index]["id"]}",
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
                            ],
                          )))
                  : Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircularProgressIndicator(),
                        Text("Recent jobs is loading")
                      ],
                    );
            }));
  }
}
