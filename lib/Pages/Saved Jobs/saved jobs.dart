import 'package:flutter/material.dart';
import 'package:jobsque/Model/Job.dart';
import 'package:jobsque/Model/jobpost.dart';
import 'package:jobsque/Network/HTTP.dart';
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
    //httpConnections.GetAllPostswithphotos();
    varHTTP.HTTPConnections().fetchuser();
    varHTTP.HTTPConnections().Getsavedjobs();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var prov = Provider.of<Jobs>(context, listen: true);
    if (prov.savedjobs.isEmpty) {
      return Center(
        child: Text("no saved jobs"),
      );
    } else {
      return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text("Saved"),
          ),
          body: Consumer<Jobs>(builder: (context, value, child) {
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
                        "${value.savedjobs.length} Job Saved",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),

                    // child:Center(child: Text("${snapshot.data!.length} Job Saved",style: TextStyle(color: Colors.white),),),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 1,
                    height: MediaQuery.of(context).size.height * 0.8,
                    child: ListView.builder(
                        itemCount: value.savedjobs.length,
                        itemBuilder: (context, i) {
//                  child: ListView.builder(itemCount:snapshot.data?.length ,itemBuilder: (context,i){
                          return Card(
                              child: ListTile(
                            leading: Container(
                                width: 50,
                                height: 50,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20)),
                                //     child: Image.network("${snapshot.data?[i]["image"]}")),
                                // title: Text("Jobtitle ${snapshot.data?[i]["name"]}"),
                                // subtitle: Text("Subtitle : ${snapshot.data?[i]["location"]}"),
                                child: Image.network(
                                    "${value.savedjobs[i]["image"]}")),
                            title: Text("Jobtitle ${value.savedjobs[i]["name"]}"),
                            subtitle: Text(
                                "job_type : ${value.savedjobs[i]["location"]}"),
                            trailing: IconButton(
                              icon: Icon(Icons.remove),
                              onPressed: () {
                                context
                                    .read<Jobs>()
                                    .Removefromsaved(value.savedjobs?[i]);
                                prov.Removefromsaved(value.savedjobs?[i]);
                                varHTTP.HTTPConnections()
                                    .deleteSavedJob(value.savedjobs?[i]["id"]);
                              },
                            ),
                          ));
                        }),
                  ),
                ],
              ),
            );
          }));
    }
  }
}
