import 'package:flutter/material.dart';

class Job_Detail extends StatefulWidget {
  const Job_Detail({super.key});

  @override
  State<Job_Detail> createState() => _Job_DetailState();
}

class _Job_DetailState extends State<Job_Detail> with TickerProviderStateMixin {
  late TabController _tabController;

  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        scrolledUnderElevation: 0,
        centerTitle: true,
        title: Text("Job Detail"),
        actions: [Icon(Icons.bookmark_outlined)],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("Assets/images/1.jpg"),
                      fit: BoxFit.fill),
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(20)),
              //  child:,
            ),
            Title(color: Colors.black, child: Text("Senior UI Designer",style: TextStyle(fontSize: 25,fontWeight: FontWeight.w400),)),
            Text("Twitter . jakarta,Indonesia"),
            SizedBox(
              width: 220,
              child: Row(
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
                      "Onsite",
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
                      "Senior",
                      style: TextStyle(fontSize: 10,color: Colors.blue[700]),
                    ),
                  ),

                ],
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.01,
            ),
            Container(
              decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(20)),
              child: TabBar(
                splashBorderRadius: BorderRadius.circular(20),
                indicatorColor: Colors.blue[700],
                controller: _tabController,
                tabs: [
                  Tab(
                    text: 'Discription',
                  ),
                  Tab(
                    text: 'Company',
                  ),
                  Tab(
                    text: 'People',
                  )
                ],
                labelColor: Colors.black,
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.01,
            ),
            Stack(
              children: [
                Container(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height * 0.49,
                  child: TabBarView(controller: _tabController, children: [
                    SingleChildScrollView(
                        physics: BouncingScrollPhysics(),
                        child: RichText(
                            text: TextSpan(children: [
                          TextSpan(
                              text: "Job Description \n",
                              style:
                                  TextStyle(fontSize: 30, color: Colors.black)),
                          TextSpan(
                              text:
                                  '''Your role as UI Designer is to use sdfsddddddddddddddddddddddddddddddddddddddvxcvzsdfalsdfigmdfvn,xnv,sdndlfjaio@TahaTesser and @Piinks I think the issue when having multiple scrolling views is at least a bit related to this issue and it needs a solution too
                          It can be simply demonstrated with the official Material 3 demo app, that in desktop and big tablet size, has two list views that scroll the AppBar.
                          Scroll one under, fine, two fine, scroll one of them away so it is no longer under, while the other ones is still under, and the scroll under tint disappears when it is no longer under, but it should still be tinted since one area is still under it. Move the area still under it a bit and the tint reappears, since it is still under
                      This is just with two areas, with more it gets even more wonky, I have one with 5 so then it is really strange."
                      ''',
                              style: TextStyle(color: Colors.black)),
                          TextSpan(
                              text:
                                  '''Your role as UI Designer is to use sdfsddddddddddddddddddddddddddddddddddddddvxcvzsdfalsdfigmdfvn,xnv,sdndlfjaio@TahaTesser and @Piinks I think the issue when having multiple scrolling views is at least a bit related to this issue and it needs a solution too
                          It can be simply demonstrated with the official Material 3 demo app, that in desktop and big tablet size, has two list views that scroll the AppBar.
                          Scroll one under, fine, two fine, scroll one of them away so it is no longer under, while the other ones is still under, and the scroll under tint disappears when it is no longer under, but it should still be tinted since one area is still under it. Move the area still under it a bit and the tint reappears, since it is still under
                      This is just with two areas, with more it gets even more wonky, I have one with 5 so then it is really strange \n \n''',
                              style: TextStyle(color: Colors.black)),
                          TextSpan(
                              text: "Skill Required \n",
                              style:
                                  TextStyle(fontSize: 30, color: Colors.black)),
                          TextSpan(
                              text:
                                  " * A strong visiosdflskdjfvlcxm.m.vm.xc,v \n",
                              style: TextStyle(color: Colors.black)),
                          TextSpan(
                              text:
                                  " * A strong visiosdflskdjfvlcxm.m.vm.xc,v \n",
                              style: TextStyle(color: Colors.black)),
                          TextSpan(
                              text:
                                  " * A strong visiosdflskdjfvlcxm.m.vm.xc,v \n",
                              style: TextStyle(color: Colors.black)),
                          TextSpan(
                              text:
                                  " * A strong visiosdflskdjfvlcxm.m.vm.xc,v \n",
                              style: TextStyle(color: Colors.black)),
                        ]))),
                    SingleChildScrollView(
                        physics: BouncingScrollPhysics(),
                        child: Column(

                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Contact US",style: TextStyle(fontSize: 20)),
                            SizedBox(height: 10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(

                                  padding: EdgeInsets.symmetric(horizontal: 8,vertical: 3),
                                  decoration: BoxDecoration(
                                    border: Border.all(color: Colors.grey.shade300),
                                    borderRadius: BorderRadius.circular(10)
                                  ),
                                  width: 170,
                                  height: 50,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      InkWell(child: Text("Email",style: TextStyle(color: Colors.grey),)),
                                      Text("Twitter@mail.com",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 15))
                                    ],
                                  ),
                                ),
                                Container(

                                  padding: EdgeInsets.symmetric(horizontal: 8,vertical: 3),
                                  decoration: BoxDecoration(
                                      border: Border.all(color: Colors.grey.shade300),
                                      borderRadius: BorderRadius.circular(10)
                                  ),
                                  width: 170,
                                  height: 50,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      InkWell(child: Text("Website",style: TextStyle(color: Colors.grey),)),
                                      Text("https://twitter.com",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 15))
                                    ],
                                  ),
                                )

                              ],

                            ),
                            SizedBox(height: 10),
                            RichText(
                                text: TextSpan(children: [
                              TextSpan(
                                  text: "About Company \n \n",
                                  style:
                                      TextStyle(fontSize: 20, color: Colors.black)),
                              TextSpan(
                                  text:
                                      '''Your role as UI Designer is to use sdfsddddddddddddddddddddddddddddddddddddddvxcvzsdfalsdfigmdfvn,xnv,sdndlfjaio@TahaTesser and @Piinks I think the issue when having multiple scrolling views is at least a bit related to this issue and it needs a solution too
                              It can be simply demonstrated with the official Material 3 demo app, that in desktop and big tablet size, has two list views that scroll the AppBar.
                              Scroll one under, fine, two fine, scroll one of them away so it is no longer under, while the other ones is still under, and the scroll under tint disappears when it is no longer under, but it should still be tinted since one area is still under it. Move the area still under it a bit and the tint reappears, since it is still under
                      This is just with two areas, with more it gets even more wonky, I have one with 5 so then it is really strange."
                      ''',
                                  style: TextStyle(color: Colors.black)),
                              TextSpan(
                                  text:
                                      '''Your role as UI Designer is to use sdfsddddddddddddddddddddddddddddddddddddddvxcvzsdfalsdfigmdfvn,xnv,sdndlfjaio@TahaTesser and @Piinks I think the issue when having multiple scrolling views is at least a bit related to this issue and it needs a solution too
                              It can be simply demonstrated with the official Material 3 demo app, that in desktop and big tablet size, has two list views that scroll the AppBar.
                              Scroll one under, fine, two fine, scroll one of them away so it is no longer under, while the other ones is still under, and the scroll under tint disappears when it is no longer under, but it should still be tinted since one area is still under it. Move the area still under it a bit and the tint reappears, since it is still under
                      This is just with two areas, with more it gets even more wonky, I have one with 5 so then it is really strange \n \n''',
                                  style: TextStyle(color: Colors.black)),

                            ])),
                          ],
                        )),
                    Center(child: Text("People")),
                  ]),
                ),
                Container(
                  height: 100,
                ),
                Positioned(
                  left: MediaQuery.of(context).size.width * 00.125,
                  bottom: MediaQuery.of(context).size.height * 0.0001,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          elevation: 30,
                          shadowColor: Colors.black,
                          backgroundColor: Colors.blueAccent[700],
                          minimumSize: const Size(300, 50)),
                      onPressed: () {
                        // Navigator.push(context, MaterialPageRoute(builder: (context) => Intersted_Work_type()));
                      },
                      child: const Text(
                        "Apply Now",
                        style: TextStyle(color: Colors.white),
                      )),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
