import 'package:flutter/material.dart';
import 'package:jobsque/Pages/Home%20&%20Search/Home_Home.dart';
import 'package:jobsque/Pages/Home%20&%20Search/recent%20job.dart';
import 'package:jobsque/Shared functions.dart';


class Portofolio_Upload extends StatefulWidget {
  const Portofolio_Upload({super.key});

  @override
  State<Portofolio_Upload> createState() => _Portofolio_UploadState();
}

class _Portofolio_UploadState extends State<Portofolio_Upload> {
  @override
  initState() {
    // httpConnections.fetchuser();
    httpConnections.getportofolios();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        scrolledUnderElevation: 0,
        title: const Text("Portofolio",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Add portofolio here",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              Container(
                width: MediaQuery.of(context).size.width * 1,
                height: MediaQuery.of(context).size.height * 0.25,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.blue.shade50,
                  border: Border.all(style: BorderStyle.solid),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          color: Colors.blueAccent.shade200.withOpacity(0.2)),
                      child: const Icon(Icons.file_open_outlined),
                    ),
                    const SizedBox(height: 10),
                    const Text("Upload your other file"),
                    const SizedBox(height: 5),
                    const Text("Max File Size 10 MB"),
                    const SizedBox(height: 10),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor:
                                Colors.blueAccent.shade200.withOpacity(0.6),
                            maximumSize: const Size(300, 50)),
                        // onPressed: () async {
                        //     httpConnections.AddPortofolio();
                        //     //ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("portfolio is added")));
                        //   } else {
                        //     ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        //         content: Text("cannot add portfolio ")));
                        //     // User canceled the picker
                        //   }
                        // },
                        onPressed: () async {
                          // File cvFile = File('/path/to/cv_file.pdf');
                          // File imageFile = File('/path/to/image.jpg');
                          // await addPortfolio();
                          await uploadPdf();
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text("portfolio is added")));
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const Home()));
                          // httpConnections.getportofolios();
                        },
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(Icons.file_upload),
                            Text(
                              "Add File",
                              style: (TextStyle(color: Colors.black54)),
                            ),
                          ],
                        ))
                  ],
                ),
              ),
              const SizedBox(height: 20),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.5,
                width: MediaQuery.of(context).size.width * 1,
                child: FutureBuilder(
                  future: httpConnections.getportofolios(),
                  builder: (context, snapshot) {
                    return ListView.builder(
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            Container(
                              height: MediaQuery.of(context).size.height * 0.1,
                              width: MediaQuery.of(context).size.width * 1,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Colors.grey,
                                  ),
                                  borderRadius: BorderRadius.circular(20)),
                              child: ListTile(
                                contentPadding:
                                    const EdgeInsets.symmetric(horizontal: 20),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                title: Text(snapshot.data![index]["cv_file"],
                                    maxLines: 1,
                                    style: const TextStyle(
                                        fontWeight: FontWeight.w500)),
                                subtitle: Text(
                                  "${snapshot.data![index]["cv_file"]}.pdf",
                                  style: TextStyle(color: Colors.grey[600]),
                                ),
                                trailing: SizedBox(
                                  width: 80,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Icon(Icons.mode_edit_outline_rounded,
                                          color: Colors.blueAccent[600]),
                                      RotationTransition(
                                          turns:
                                              const AlwaysStoppedAnimation(45 / 360),
                                          child: InkWell(
                                            onTap: (){
                                              httpConnections.deleteportofolio(snapshot.data![index]["id"]);
                                              ScaffoldMessenger.of(context).showSnackBar(
                                                  const SnackBar(content: Text("portfolio is deleted")));
                                              setState(() {

                                              });
                                            },
                                            child: const Icon(Icons.add_circle_outline,
                                                color: Colors.red),
                                          ))
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 10)
                          ],
                        );
                      },
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
