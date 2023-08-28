import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../Network/HTTP.dart' as varHTTP;
import 'package:path_provider/path_provider.dart';
import 'package:jobsque/Pages/Home%20&%20Search/recent%20job.dart';

Future uploadPdf() async {
  SharedPreferences savedlogin = await SharedPreferences.getInstance();
  int id = savedlogin.getInt("id")!;
  String token = savedlogin.getString("token")!;
  var dio = Dio();
  FilePickerResult? result = await FilePicker.platform.pickFiles();
  if (result != null) {
    File file = File(result.files.single.path ?? " ");
    String filename = file.path.split('/').last;
    String path = file.path;

    FormData formdata = FormData.fromMap({
      "token": token,
      "image": await MultipartFile.fromFile(path),
      "profile_id": id,
//      "cv_file": await MultipartFile.fromFile(path, filename: filename),
      "name": "1.jpg",
    });
    Response response = await dio.post(
      "https://project2.amit-learning.com/api/user/profile/portofolios/$id",
      options: Options(
          followRedirects: false,
          validateStatus: (status) {
            return status! < 500;
          }
          ),
        data: formdata
    );
    if (response.statusCode == 200) {
      print("uploaded successfully");
    }else{
      print(response.toString());
    }
  }
}

class Portofolio_Upload extends StatefulWidget {
  const Portofolio_Upload({super.key});

  @override
  State<Portofolio_Upload> createState() => _Portofolio_UploadState();
}

class _Portofolio_UploadState extends State<Portofolio_Upload> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        scrolledUnderElevation: 0,
        title: Text("Portofolio",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 25),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Add portofolio here",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
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
                      child: Icon(Icons.file_open_outlined),
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
                        onPressed: () {
                          uploadPdf();
                        },
                        child: Row(
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
              SizedBox(height: 20),
              Container(
                height: MediaQuery.of(context).size.height * 0.5,
                width: MediaQuery.of(context).size.width * 1,
                child: ListView.builder(
                  itemCount: 4,
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
                                EdgeInsets.symmetric(horizontal: 20),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            title: Text(
                              "jobs[index]",
                              style:
                                  const TextStyle(fontWeight: FontWeight.w500),
                            ),
                            subtitle: Text(
                              "CV.pdf  . portofolio.pdf",
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
                                      turns: AlwaysStoppedAnimation(45 / 360),
                                      child: Icon(Icons.add_circle_outline,
                                          color: Colors.red))
                                ],
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 10)
                      ],
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
