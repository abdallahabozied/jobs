import 'package:flutter/material.dart';
import 'package:jobsque/Pages/Messages/chat%20page.dart';

class Chats_List extends StatefulWidget {
  const Chats_List({super.key});

  @override
  State<Chats_List> createState() => _Chats_ListState();
}

class _Chats_ListState extends State<Chats_List> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          scrolledUnderElevation: 0,
          title: const Text("Messages"),
        ),
        body: SingleChildScrollView(
          child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.7,
                          height: MediaQuery.of(context).size.height * 0.08,
                          child: TextField(
                            onTap: () {},
                            decoration: const InputDecoration(
                              hintText: "  Search Messages ...",
                              prefixIcon: Icon(Icons.search),
                              alignLabelWithHint: true,
                              border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(40)),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(40),
                                ),
                                borderSide: BorderSide(color: Colors.blue),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(40)),
                                borderSide: BorderSide(color: Colors.blue),
                              ),
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            showModalBottomSheet(context: context, builder:(context) {
                             return SizedBox(
                               width: MediaQuery.of(context).size.width*1.0,
                               height: MediaQuery.of(context).size.height*.4,
                               child: Padding(
                                 padding: const EdgeInsets.all(15.0),
                                 child: Column(
                                   mainAxisAlignment: MainAxisAlignment.start,
                                   crossAxisAlignment: CrossAxisAlignment.start,
                                   children: [
                                     const Text("Message filters",style: TextStyle(
                                     fontWeight: FontWeight.w400,
                                     fontSize: 25)),
                                     const SizedBox(height: 15),
                                     Container(
                                       padding: const EdgeInsets.symmetric(horizontal: 20),
                                       width: MediaQuery.of(context).size.width*1,
                                       height: MediaQuery.of(context).size.height*.08,
                                     decoration: BoxDecoration(border: Border.all(color: Colors.grey.shade500),borderRadius: BorderRadius.circular(30),
                                     ),
                                       child: const Row(

                                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                         crossAxisAlignment: CrossAxisAlignment.center,
                                         children: [
                                           Text("Unread",style: TextStyle(
                                               fontWeight: FontWeight.w300,
                                               fontSize: 15)),
                                           Icon(Icons.chevron_right)
                                         ],
                                       ),
                                     ),
                                     const SizedBox(height: 10),
                                     Container(
                                       padding: const EdgeInsets.symmetric(horizontal: 20),
                                       width: MediaQuery.of(context).size.width*1,
                                       height: MediaQuery.of(context).size.height*.08,
                                       decoration: BoxDecoration(border: Border.all(color: Colors.grey.shade500),borderRadius: BorderRadius.circular(30),
                                       ),
                                       child: const Row(

                                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                         crossAxisAlignment: CrossAxisAlignment.center,
                                         children: [
                                           Text("Spam",style: TextStyle(
                                               fontWeight: FontWeight.w300,
                                               fontSize: 15)),
                                           Icon(Icons.chevron_right)
                                         ],
                                       ),
                                     ),
                                     const SizedBox(height: 10),
                                     Container(
                                       padding: const EdgeInsets.symmetric(horizontal: 20),
                                       width: MediaQuery.of(context).size.width*1,
                                       height: MediaQuery.of(context).size.height*.08,
                                       decoration: BoxDecoration(border: Border.all(color: Colors.grey.shade500),borderRadius: BorderRadius.circular(30),
                                       ),
                                       child: const Row(

                                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                         crossAxisAlignment: CrossAxisAlignment.center,
                                         children: [
                                           Text("Archived",style: TextStyle(
                                               fontWeight: FontWeight.w300,
                                               fontSize: 15)),
                                           Icon(Icons.chevron_right)
                                         ],
                                       ),
                                     )
                                   ],
                                 ),
                               ),
                             ) ;
                            });
                          },
                          child: Container(
                              width: 50,
                              height: 50,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                  border: Border.all(color: Colors.black)),
                              child: const Icon(
                                Icons.filter_list,
                                color: Colors.black,
                              )),
                        )
                      ],
                    ),
                    const SizedBox(height: 10),
                    Scrollbar(
                      child: SizedBox(
                        height: MediaQuery.of(context).size.height * 0.8,
                        width: MediaQuery.of(context).size.width * 1,
                        child: ListView.builder(
                          itemCount: 10,
                          itemBuilder: (context, index) {
                            return Column(
                              children: [
                                InkWell(
                                  onTap: (){
                                    Navigator.push(context, MaterialPageRoute(builder: (context) => const Chat_Page()));
                                  },
                                  child: ListTile(
                                    leading: const CircleAvatar(
                                      radius: 30,
                                    ),
                                    title: Text("Index ${index+1}",
                                        style: const TextStyle(
                                            fontWeight: FontWeight.w400,
                                            fontSize: 20)),
                                    subtitle: const Text(
                                        "Hello it's Abdallah Abozied from group 43 online",
                                        maxLines: 1,
                                        style: TextStyle(
                                            fontWeight: FontWeight.w400,
                                            fontSize: 15)),
                                    trailing: Text(
                                        "${index*2}:0${index + 1}"),
                                  ),
                                ),
                                Divider(
                                  endIndent: 20,
                                  indent: 70,
                                  color: Colors.grey.shade300,
                                )
                              ],
                            );
                          },
                        ),
                      ),
                    ),
                  ])),
        ));
  }
}
