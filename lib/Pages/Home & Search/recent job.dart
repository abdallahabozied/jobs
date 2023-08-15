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
  Future refresh() async {
    setState(() {
      httpConnections.GetAllPostswithphotos();
    });
  }

  @override
  Widget build(BuildContext context) {
    var prov = Provider.of<Jobs>(context);
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text("Recent Jobs"),
        ),
        body: RefreshIndicator(
            onRefresh: refresh,
            child: SingleChildScrollView(
                child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [ const SizedBox(height: 1),//MediaQuery.of(context).size.height * 0.015),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 1,
                          height: MediaQuery.of(context).size.height * 0.8,

                          child: ListView.builder(itemCount: list3.length,itemBuilder: (context, index) {
                            return  Column(
                              children: [
                                ListTile(

                                  leading:Image.network("${list3[index]["thumbnailUrl"]}"),
                                  title: Text("${list3[index]["title"]}",style: const TextStyle(fontSize: 20, color: Colors.black)),
                                  subtitle: Text("${list3[index]["subtitle"]}",style: const TextStyle(fontSize: 15, color: Colors.black12)),
                                  trailing: InkWell(onTap: (){
                                    prov.Addtosaved(list3[index]);
                                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Saved")));
                                  },child: const Icon(Icons.bookmark,color: Colors.black54,)),
                                  contentPadding: const EdgeInsets.symmetric(horizontal: 10),

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
                                          TextSpan(text: "${list[index]["id"]}" ,style: const TextStyle(color: Colors.green,fontSize: 20)),
                                          const TextSpan(text: '/month' ,style: TextStyle(color: Colors.grey,fontSize: 15)),
                                        ]
                                    ))
                                  ],
                                ),
                                SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                                const Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 50),
                                  child: Divider(color: Colors.black12,),
                                )
                              ],
                            );
                          },

                          ),
                        ),],
                    )))));
  }
}
