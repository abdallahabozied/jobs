import 'package:flutter/material.dart';
import 'package:jobsque/Pages/Home%20&%20Search/recent%20job.dart';
import 'package:jobsque/Pages/Profile/edit%20Profile.dart';
import 'package:jobsque/Pages/Profile/edit%20login%20and%20security.dart';
import 'package:jobsque/Pages/Profile/edit%20notification.dart';
import 'package:jobsque/Pages/Profile/portofolio.dart';
import 'package:jobsque/Pages/Sign%20In/Sign%20In.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../Network/HTTP.dart' as varHTTP;

class profile extends StatefulWidget {
  const profile({super.key});

  @override
  State<profile> createState() => _profileState();
}

class _profileState extends State<profile> {
  @override
  void initState() {
    // TODO: implement initState
    httpConnections.fetchuser();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (context,scrolled)=>[
          SliverAppBar(
            scrolledUnderElevation: 0,
            centerTitle: true,
            backgroundColor: Colors.blueAccent.shade100,
            forceMaterialTransparency: false,
            title:Text("Profile"),
            actions: [
              IconButton(
                  onPressed: () async {
                    var savedlogindata = await SharedPreferences.getInstance();
                    savedlogindata.setBool('login', false);
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Sign_In(),
                        ),
                            (route) => false);
                  },
                  icon: Icon(Icons.exit_to_app,size: 30,)),
            ],
          )
        ],
        body:Scrollbar(
          thickness: 10,
          radius:Radius.circular(10),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  alignment: Alignment.center,
                  children: [
                    Column(children: [
                      Container(
                        decoration: BoxDecoration(color: Colors.blueAccent.shade100),
                        height: MediaQuery.of(context).size.height * 0.2,
                      ),
                      SizedBox(height: MediaQuery.of(context).size.height * 0.05),
                      Text(varHTTP.name,
                          style:
                              TextStyle(fontSize: 20, fontWeight: FontWeight.w500)),
                      Text(varHTTP.email),
                      SizedBox(height: 20),
                      Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.grey.shade200),
                            height: 80,
                            child: Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  Container(
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [Text("Applied",style: TextStyle(fontSize: 17,fontWeight: FontWeight.w300)), Text("45",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold))],
                                    ),
                                  ),
                                  VerticalDivider(),
                                  Container(
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [Text("Reviwed",style: TextStyle(fontSize: 17,fontWeight: FontWeight.w300)), Text("23",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold))],
                                    ),
                                  ),
                                  VerticalDivider(),
                                  Container(
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [Text("Contacted",style: TextStyle(fontSize: 17,fontWeight: FontWeight.w300)), Text("16",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold))],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ))
                    ]),
                    Positioned(
                        top: MediaQuery.of(context).size.height *0.1,
                        child:
                            CircleAvatar(backgroundImage: AssetImage("Assets/images/1.jpg"), radius: 60)),
                  ],
                ),
                SizedBox(height: 20),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("About",
                          style: TextStyle(fontSize: 20, color: Colors.black)),
                      InkWell(
                          onTap: () {},
                          child: Text("Edit",
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.blue[700])))
                    ],
                  ),
                ),
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Text(maxLines: 5,
                      "ssssssssssssssssssss \n sssssssssssssddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd"
                      "sddddddddddddddddsssssssss \n ssssssssssssssssssss \n"),
                ),
                SizedBox(height: 7),
                Container(
                  width: MediaQuery.of(context).size.width * 1,
                  height: 30,
                  decoration: BoxDecoration(color: Colors.grey.shade200),
                  padding: EdgeInsets.only(left: 15),
                  child: Text("General",
                      style: TextStyle(fontSize: 20, color: Colors.black)),
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.45,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(height: 10),
                      InkWell(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context) => Edit_Profile()));
                        },
                        child: ListTile(
                          leading: Container(
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                              color: Colors.blue.shade200,
                              borderRadius: BorderRadius.circular(100)
                            ),
                            child: Icon(Icons.perm_identity_rounded),
                          ),
                          title: Text("Edit Profile"),
                          trailing: Icon(Icons.arrow_forward_rounded),
                        ),
                      ),
                      Divider(color:Colors.grey.shade200,indent: 20,endIndent: 20,),
                      SizedBox(height: 10),
                      InkWell(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context) => Portofolio_Upload()));
                        },
                        child: ListTile(
                          leading: Container(
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                                color: Colors.blue.shade200,
                                borderRadius: BorderRadius.circular(100)
                            ),
                            child: Icon(Icons.create_new_folder_outlined),
                          ),
                          title: Text("Portofolio"),
                          trailing: Icon(Icons.arrow_forward_rounded),
                        ),
                      ),
                      Divider(color:Colors.grey.shade200,indent: 20,endIndent: 20,),
                      SizedBox(height: 10),
                      ListTile(
                        leading: Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                              color: Colors.blue.shade200,
                              borderRadius: BorderRadius.circular(100)
                          ),
                          child: Icon(Icons.language_rounded),
                        ),
                        title: Text("Language"),
                        trailing: Icon(Icons.arrow_forward_rounded),
                      ),
                      Divider(color:Colors.grey.shade200,indent: 20,endIndent: 20,),
                      SizedBox(height: 10),
                      InkWell(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context) => notification_properties()));
                        },
                        child: ListTile(
                          leading: Container(
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                                color: Colors.blue.shade200,
                                borderRadius: BorderRadius.circular(100)
                            ),
                            child: Icon(Icons.notifications_outlined),
                          ),
                          title: Text("Notification"),
                          trailing: Icon(Icons.arrow_forward_rounded),
                        ),
                      ),
                      Divider(color:Colors.grey.shade200,indent: 20,endIndent: 20,),
                      SizedBox(height: 10),
                      InkWell(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context) => account_access()));
                        },
                        child: ListTile(
                          leading: Container(
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                                color: Colors.blue.shade200,
                                borderRadius: BorderRadius.circular(100)
                            ),
                            child: Icon(Icons.lock_outline),
                          ),
                          title: Text("Login and security"),
                          trailing: Icon(Icons.arrow_forward_rounded),
                        ),
                      ),
                      Divider(color:Colors.grey.shade200,indent: 20,endIndent: 20,)
                    ],
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 1,
                  height: 30,
                  decoration: BoxDecoration(color: Colors.grey.shade200),
                  padding: EdgeInsets.only(left: 15),
                  child: Text("Others",
                      style: TextStyle(fontSize: 20, color: Colors.black)),
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.35,

                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(height: 5),
                      ListTile(
                        title: Text("Accessability"),
                        trailing: Icon(Icons.arrow_forward_rounded),
                      ),
                      Divider(color:Colors.grey.shade200,indent: 20,endIndent: 20,),
                      SizedBox(height: 5),
                      ListTile(

                        title: Text("Help Center"),
                        trailing: Icon(Icons.arrow_forward_rounded),
                      ),
                      Divider(color:Colors.grey.shade200,indent: 20,endIndent: 20,),
                      SizedBox(height: 5),
                      ListTile(

                        title: Text("Terms & Conditions"),
                        trailing: Icon(Icons.arrow_forward_rounded),
                      ),
                      Divider(color:Colors.grey.shade200,indent: 20,endIndent: 20,),
                      SizedBox(height: 5),
                      ListTile(

                        title: Text("Privacy Policy"),
                        trailing: Icon(Icons.arrow_forward_rounded),
                      ),
                      Divider(color:Colors.grey.shade200,indent: 20,endIndent: 20,),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
