import 'package:flutter/material.dart';
import 'package:jobsque/Model/Job.dart';
import 'package:jobsque/Model/jobpost.dart';
import 'package:jobsque/Network/HTTP.dart';
import 'package:jobsque/Pages/Job%20Detalis%20&%20Apply/Job%20Details.dart';
import 'package:provider/provider.dart';

// import 'package:jobsque/Model/jobpost.dart';
// import 'package:provider/provider.dart';
import '../../Network/HTTP.dart' as varHTTP;

class Saved extends StatefulWidget {
  const Saved({super.key});

  @override
  State<Saved> createState() => _SavedState();
}

class _SavedState extends State<Saved> {
  @override
  void initState() {
    // httpConnections.GetAllPostswithphotos();
    varHTTP.HTTPConnections().fetchuser();
    varHTTP.HTTPConnections().Getsavedjobs();
    super.initState();
  }

  @override
  bool issnapshotempty = false;

  Widget build(BuildContext context) {
    var prov = Provider.of<Jobs>(context, listen: true);
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("Saved"),
        ),
        body: FutureBuilder(
            future: varHTTP.HTTPConnections().Getsavedjobs(),
            builder: (context, snapshot) {
              if (snapshot.data != null) {
                return Scrollbar(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 20,
                        decoration: BoxDecoration(
                          color: Colors.grey,
                        ),
                        child: Center(
                          child: Text(
                            "${snapshot.data?.length} Job Saved",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),

                        // child:Center(child: Text("${snapshot.data!.length} Job Saved",style: TextStyle(color: Colors.white),),),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 1,
                        height: MediaQuery.of(context).size.height * 0.8,
                        child: ListView.builder(
                            itemCount: snapshot.data?.length,
                            itemBuilder: (context, i) {
//                  child: ListView.builder(itemCount:snapshot.data?.length ,itemBuilder: (context,i){
                              return Card(
                                  child: ListTile(
                                leading: Container(
                                    width: 50,
                                    height: 50,
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    //     child: Image.network("${snapshot.data?[i]["image"]}")),
                                    // title: Text("Jobtitle ${snapshot.data?[i]["name"]}"),
                                    // subtitle: Text("Subtitle : ${snapshot.data?[i]["location"]}"),
                                    child: Image.network(errorBuilder:
                                        (context, error, stackTrace) {
                                      return Container(
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(50)),
                                          child: Image.asset(
                                            "Assets/images/No_image.png",
                                            fit: BoxFit.fill,
                                          ));
                                    }, "${snapshot.data?[i]["image"]}")),
                                title: InkWell(
                                  onTap: () {
                                    prov.postid = snapshot.data?[i]["job_id"];
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              const Job_Detail(),
                                        ));
                                  },
                                  child: Text(
                                      "${snapshot.data?[i]["jobs"]["name"]}"),
                                ),
                                subtitle: Text(
                                    " ${snapshot.data?[i]["jobs"]["comp_name"]}..${snapshot.data?[i]["jobs"]["job_type"]}"),
                                trailing: IconButton(
                                  icon: Icon(Icons.remove),
                                  onPressed: () async {
                                    if (await varHTTP.HTTPConnections()
                                            .deleteSavedJob(
                                                snapshot.data?[i]["id"]) ==
                                        true) {
                                      // prov.Removefromsaved(value.savedjobs?[i]);
                                      // context.read<Jobs>().Removefromsaved(value.savedjobs?[i]);
                                      if (snapshot.data!.length < 1) {
                                        issnapshotempty = true;
                                      }
                                      setState(() {});

                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(SnackBar(
                                              content:
                                                  Text("Deleted from saved")));
                                    } else {
                                      print(snapshot.data?[i]["id"]);
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(SnackBar(
                                              content: Text(
                                                  "Cannot delete from saved now ,Try later")));
                                    }
                                  },
                                ),
                              ));
                            }),
                      ),
                    ],
                  ),
                );
              } else {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image(
                          image: AssetImage("Assets/images/no_saved_yet.png")),
                      Text(
                        "Nothing has been saved yet",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w500),
                      ),
                      Text("Press the star icon on the job you want to save.")
                    ],
                  ),
                );
              }
            }));
  }
}
