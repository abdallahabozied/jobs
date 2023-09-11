import 'package:flutter/material.dart';
import 'package:jobsque/Model/jobpost.dart';
import 'package:jobsque/Network/HTTP.dart';
import 'package:jobsque/Pages/Home%20&%20Search/recent%20job.dart';
import 'package:jobsque/Pages/Job%20Detalis%20&%20Apply/Job%20Details.dart';
import 'package:provider/provider.dart';
import '../../Network/HTTP.dart' as varHTTP;
class Sugessted_job extends StatefulWidget {
  const Sugessted_job({super.key});

  @override
  State<Sugessted_job> createState() => _Sugessted_jobState();
}
void initState() {
  // TODO: implement initState
  httpConnections.GetAllPostswithphotos();
}
class _Sugessted_jobState extends State<Sugessted_job> {
  @override
  Widget build(BuildContext context) {
    var prov = Provider.of<Jobs>(context);
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text("Suggested jobs"),
        ),
        body: FutureBuilder(
            future: HTTPConnections().GetAllPostswithphotos(),
            builder: (context, snapshot) {
              return snapshot.data!=null
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
                                      leading: Image.network(errorBuilder:
                                          (context, error, stackTrace) {
                                        return Container(
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                BorderRadius.circular(50)),
                                            child: Image.asset(
                                              "Assets/images/No_image.png",
                                              fit: BoxFit.fill,
                                            ));
                                      },
                                          "${snapshot.data![index]["image"]}"),
                                      title: InkWell(
                                        onTap: () {
                                          prov.postid = snapshot.data?[index]["id"];
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                const Job_Detail(),
                                              ));
                                        },
                                        child: Text(
                                            "${snapshot.data![index]["name"]}",
                                            style: const TextStyle(
                                                fontSize: 20,
                                                color: Colors.black)),
                                      ),
                                      subtitle: Text(
                                          "${snapshot.data![index]["job_type"]}",
                                          style: const TextStyle(
                                              fontSize: 15,
                                              color: Colors.black12)),
                                      trailing: InkWell(
                                          onTap: () {
                                            HTTPConnections().Addtosaved(
                                                varHTTP.id, snapshot.data?[index]["id"]);
                                            context
                                                .read<Jobs>()
                                                .Addtosaved(snapshot.data?[index]);
                                            print(prov);
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(const SnackBar(
                                                content: Text("Saved")));
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
                                                  text: "${snapshot.data![index]["salary"]}",
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
                  : Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CircularProgressIndicator(),
                    Text("Loading recent jobs.")
                  ],
                ),
              );
            }));
  }
}
