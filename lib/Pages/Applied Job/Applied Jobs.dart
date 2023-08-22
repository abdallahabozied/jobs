import 'package:flutter/material.dart';
import 'package:jobsque/Model/Job.dart';
import 'package:jobsque/Model/jobpost.dart';
import 'package:jobsque/Network/HTTP.dart';
import 'package:jobsque/Pages/Home%20&%20Search/recent%20job.dart';
import 'package:provider/provider.dart';
import '../../Network/HTTP.dart' as varHTTP;

class Applied extends StatefulWidget {
  const Applied({super.key});

  @override
  State<Applied> createState() => _AppliedState();
}

class _AppliedState extends State<Applied> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    httpConnections.GetAppliedjobs();
  }
  @override
  Widget build(BuildContext context) {
    var prov = Provider.of<Jobs>(context, listen: true);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Applied"),
      ),

      body: FutureBuilder(
        future: httpConnections.GetAppliedjobs(),
        builder: (context,snapshot){
          if(snapshot.hasData) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(height: 20,
                  decoration: BoxDecoration(
                    color: Colors.grey,
                  ),
                  child: Center(child: Text(
                    "${snapshot.data?.length} Applied Jobs",
                    style: TextStyle(color: Colors.white),),),
                ),
                Container(
                  width: MediaQuery
                      .of(context)
                      .size
                      .width * 1,
                  height: MediaQuery
                      .of(context)
                      .size
                      .height * 0.8,
                  child: ListView.builder(itemCount: snapshot.data?.length,
                      itemBuilder: (context, i) {
                        return Card(
                            child: FutureBuilder(
                                future: httpConnections.fetchjob(
                                    snapshot.data?[i]["jobs_id"]),
                                builder: (context, snapshot2){
                                    return ListTile(
                                      leading: Container(width: 30,
                                          height: 30,
                                          child: Image.network(
                                              "${snapshot2.data?["image"]}")),
                                      title: Text(
                                          "Job_name : ${snapshot2.data?["name"]}"),
                                      subtitle: Text(
                                          "Job_type ${snapshot2.data?["job_time_type"]}"),
                                      trailing: InkWell(
                                          onTap: () {
                                            httpConnections.Addtosaved(
                                                varHTTP.id, snapshot2.data![i]["id"]);
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(
                                                const SnackBar(
                                                    content: Text(
                                                        "Saved")));
                                          },
                                          child: const Icon(
                                            Icons.bookmark,
                                            color: Colors.black54,
                                          )),

                                    );
                                }
                            )
                        );
                      }),
                ),
              ],
            );
          }else return Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircularProgressIndicator(),
                Text("Applied jobs is loading")
              ],
            ),
          );
        },
      ),
    );
  }
}
