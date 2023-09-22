import 'package:flutter/material.dart';
import 'package:jobsque/Pages/Home%20&%20Search/recent%20job.dart';
import '../../Network/HTTP.dart' as varHTTP;
import 'package:shimmer/shimmer.dart';

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
    // var prov = Provider.of<Jobs>(context, listen: true);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Applied"),
      ),
      body: FutureBuilder(
        future: httpConnections.GetAppliedjobs(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 20,
                  decoration: const BoxDecoration(
                    color: Colors.grey,
                  ),
                  child: Center(
                    child: Text(
                      "${snapshot.data?.length} Applied Jobs",
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                Scrollbar(
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width * 1,
                    height: MediaQuery.of(context).size.height * 0.8,
                    child: ListView.builder(
                        itemCount: snapshot.data?.length,
                        itemBuilder: (context, i) {
                          return Card(
                              child: FutureBuilder(
                                  future: httpConnections
                                      .fetchjob(snapshot.data?[i]["jobs_id"]),
                                  builder: (context, snapshot2) {
                                    return ListTile(
                                      leading: SizedBox(
                                          width: 30,
                                          height: 30,
                                          child: Image.network(errorBuilder:
                                              (context, error, stackTrace) {
                                            return Container(
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            50)),
                                                child: Image.asset(
                                                  "Assets/images/No_image.png",
                                                  fit: BoxFit.fill,
                                                ));
                                          }, "${snapshot2.data?["image"]}")),
                                      title: Text(
                                          "Job_name : ${snapshot2.data?["name"]}"),
                                      subtitle: Text(
                                          "Job_type ${snapshot2.data?["job_time_type"]}"),
                                      trailing: InkWell(
                                          onTap: () {
                                            httpConnections.Addtosaved(
                                                varHTTP.id,
                                                snapshot2.data![i]["id"]);
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(const SnackBar(
                                                    content: Text("Saved")));
                                          },
                                          child: const Icon(
                                            Icons.bookmark,
                                            color: Colors.black54,
                                          )),
                                    );
                                  }));
                        }),
                  ),
                ),
              ],
            );
          } else
            return Center(
              child: Shimmer.fromColors(
               baseColor: Colors.black.withOpacity(1),
                highlightColor: Colors.black54,
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: ListView.builder(itemCount: 5,itemBuilder: (context, index) {
                    return const Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          children: [
                            Skelton(height: 120, width: 120),
                            SizedBox(width: 16),
                            Expanded(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Skelton(
                                      width: 80,
                                    ),
                                    SizedBox(height: 8),
                                    Skelton(),
                                    SizedBox(height: 8),
                                    Skelton(),
                                    SizedBox(
                                      height: 8,
                                    ),
                                    Row(
                                      children: [
                                        Expanded(child: Skelton()),
                                        SizedBox(width: 16),
                                        Expanded(child: Skelton())
                                      ],
                                    )
                                  ],
                                ))
                          ],
                        ),
                        SizedBox(height: 16)
                      ],
                    );
                  },),
                ),
              ),
            );
        },
      ),
    );
  }
}

class Skelton extends StatelessWidget {
  const Skelton({super.key, this.height, this.width});

  final double? height;

  final double? width;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.04),
          borderRadius: const BorderRadius.all(Radius.circular(16))),
    );
  }
}
