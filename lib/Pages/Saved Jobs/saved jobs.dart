import 'package:flutter/material.dart';
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
  Widget build(BuildContext context) {

   // var prov = Provider.of<Jobs>(context, listen: true);
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
        title: Text("Saved"),
      ),
      body: FutureBuilder(
        future: varHTTP.HTTPConnections().Getsavedjobs(),
        builder: (context,snapshot) {
          if (snapshot.hasData) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(height: 20,
                  decoration: BoxDecoration(
                    color: Colors.grey,
                  ),
                  child:Center(child: Text("${snapshot.data!.length} Job Saved",style: TextStyle(color: Colors.white),),),
                ),
                Container(
                  width: MediaQuery.of(context).size.width*1,
                  height: MediaQuery.of(context).size.height*0.8,
                  child: ListView.builder(itemCount:snapshot.data?.length ,itemBuilder: (context,i){
                    return Card(
                        child: ListTile(
                          leading:Image.network("${snapshot.data?[i]["image"]}"),
                          title: Text("Jobtitle ${snapshot.data?[i]["name"]}"),
                          subtitle: Text("Subtitle : ${snapshot.data?[i]["location"]}"),
                          trailing: IconButton(
                            icon: Icon(Icons.remove),
                            onPressed: (){
                              varHTTP.HTTPConnections().deleteSavedJob(snapshot.data?[i]["id"]);
                              //context.read<Jobs>().Removefromsaved(list[i]);
                              // prov.Removefromsaved(value.jobs[i]);
                            },
                          ),
                        )
                    );
                  }),
                ),
              ],
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        }
      ),
    );
  }

}
