import 'package:flutter/material.dart';
import 'package:jobsque/Pages/Home%20&%20Search/recent%20job.dart';
import 'package:jobsque/Pages/Profile/Help%20Center/Help%20Center.dart';
import 'package:jobsque/Pages/Profile/Privacy%20policy/privacy%20policy.dart';
import 'package:jobsque/Pages/Profile/Terms%20&%20conditions/Terms.dart';
import 'package:jobsque/Pages/Profile/edit%20Profile.dart';
import 'package:jobsque/Pages/Profile/edit%20login%20and%20security.dart';
import 'package:jobsque/Pages/Profile/edit%20notification.dart';
import 'package:jobsque/Pages/Profile/language.dart';
import 'package:jobsque/Pages/Profile/portofolio.dart';
import 'package:jobsque/Pages/Sign%20In/Sign%20In.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../Network/HTTP.dart' as varHTTP;

class profile extends StatefulWidget {
  const profile({super.key});

  @override
  State<profile> createState() => _profileState();
}

class _profileState extends State<profile> {
  @override
  void initState(){
    // TODO: implement initState
    httpConnections.fetchuser();
    super.initState();
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      extendBody: true,
      body: NestedScrollView(
        headerSliverBuilder: (context,scrolled)=>[
          SliverAppBar(
            scrolledUnderElevation: 0,
            centerTitle: true,
            backgroundColor: Colors.blueAccent.shade100,
            forceMaterialTransparency: false,
            title:const Text("Profile"),
            actions: [
              IconButton(
                  onPressed: () async {
                    var savedlogindata = await SharedPreferences.getInstance();
                    savedlogindata.setBool('login', false);
                    // savedlogindata.clear();
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const Sign_In(),
                        ),
                            (route) => false);
                  },
                  icon: const Icon(Icons.exit_to_app,size: 30,)),
            ],
          )
        ],
        body:Scrollbar(
          thickness: 10,
          radius:const Radius.circular(10),
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
                              const TextStyle(fontSize: 20, fontWeight: FontWeight.w500)),
                      Text(varHTTP.email),
                      const SizedBox(height: 20),
                      Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.grey.shade200),
                            height: 80,
                            child: const Padding(
                              padding: EdgeInsets.all(15.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [Text("Applied",style: TextStyle(fontSize: 17,fontWeight: FontWeight.w300)), Text("45",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold))],
                                  ),
                                  VerticalDivider(),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [Text("Reviwed",style: TextStyle(fontSize: 17,fontWeight: FontWeight.w300)), Text("23",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold))],
                                  ),
                                  VerticalDivider(),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [Text("Contacted",style: TextStyle(fontSize: 17,fontWeight: FontWeight.w300)), Text("16",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold))],
                                  ),
                                ],
                              ),
                            ),
                          ))
                    ]),
                    Positioned(
                        top: MediaQuery.of(context).size.height *0.1,
                        child:
                            const CircleAvatar(backgroundImage: AssetImage("Assets/images/1.jpg"), radius: 60)),
                  ],
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text("About",
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
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      varHTTP.about[1]["bio"]== null ? const Text(" "):Text("${varHTTP.about[1]["bio"]}",style: const TextStyle(fontSize: 20 ,fontWeight: FontWeight.w500),maxLines: 5),
                      varHTTP.about[1]["address"]== null ? const Text(" "):Text("Address : ${varHTTP.about[1]["address"]}",maxLines: 2),
                      varHTTP.about[1]["phone"]== null ? const Text(" "):Text("Phone : ${varHTTP.about[2]["phone"]}",maxLines: 1),
                    ],
                  ),
                ),
                const SizedBox(height: 7),
                Container(
                  width: MediaQuery.of(context).size.width * 1,
                  height: 30,
                  decoration: BoxDecoration(color: Colors.grey.shade200),
                  padding: const EdgeInsets.only(left: 15),
                  child: const Text("General",
                      style: TextStyle(fontSize: 20, color: Colors.black)),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.45,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const SizedBox(height: 10),
                      InkWell(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context) => const Edit_Profile()));
                        },
                        child: ListTile(
                          leading: Container(
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                              color: Colors.blue.shade200,
                              borderRadius: BorderRadius.circular(100)
                            ),
                            child: const Icon(Icons.perm_identity_rounded),
                          ),
                          title: const Text("Edit Profile"),
                          trailing: const Icon(Icons.arrow_forward_rounded),
                        ),
                      ),
                      Divider(color:Colors.grey.shade200,indent: 20,endIndent: 20,),
                      const SizedBox(height: 10),
                      InkWell(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context) => const Portofolio_Upload()));
                        },
                        child: ListTile(
                          leading: Container(
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                                color: Colors.blue.shade200,
                                borderRadius: BorderRadius.circular(100)
                            ),
                            child: const Icon(Icons.create_new_folder_outlined),
                          ),
                          title: const Text("Portofolio"),
                          trailing: const Icon(Icons.arrow_forward_rounded),
                        ),
                      ),
                      Divider(color:Colors.grey.shade200,indent: 20,endIndent: 20,),
                      const SizedBox(height: 10),
                      InkWell(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context) => const Language()));
                        },
                        child: ListTile(
                          leading: Container(
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                                color: Colors.blue.shade200,
                                borderRadius: BorderRadius.circular(100)
                            ),
                            child: const Icon(Icons.language_rounded),
                          ),
                          title: const Text("Language"),
                          trailing: const Icon(Icons.arrow_forward_rounded),
                        ),
                      ),
                      Divider(color:Colors.grey.shade200,indent: 20,endIndent: 20,),
                      const SizedBox(height: 10),
                      InkWell(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context) => const notification_properties()));
                        },
                        child: ListTile(
                          leading: Container(
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                                color: Colors.blue.shade200,
                                borderRadius: BorderRadius.circular(100)
                            ),
                            child: const Icon(Icons.notifications_outlined),
                          ),
                          title: const Text("Notification"),
                          trailing: const Icon(Icons.arrow_forward_rounded),
                        ),
                      ),
                      Divider(color:Colors.grey.shade200,indent: 20,endIndent: 20,),
                      const SizedBox(height: 10),
                      InkWell(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context) => const account_access()));
                        },
                        child: ListTile(
                          leading: Container(
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                                color: Colors.blue.shade200,
                                borderRadius: BorderRadius.circular(100)
                            ),
                            child: const Icon(Icons.lock_outline),
                          ),
                          title: const Text("Login and security"),
                          trailing: const Icon(Icons.arrow_forward_rounded),
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
                  padding: const EdgeInsets.only(left: 15),
                  child: const Text("Others",
                      style: TextStyle(fontSize: 20, color: Colors.black)),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.35,

                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const SizedBox(height: 5),
                      const ListTile(
                        title: Text("Accessability"),
                        trailing: Icon(Icons.arrow_forward_rounded),
                      ),
                      Divider(color:Colors.grey.shade200,indent: 20,endIndent: 20,),
                      const SizedBox(height: 5),
                      InkWell(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context) => const Help_Center()));
                        },
                        child: const ListTile(

                          title: Text("Help Center"),
                          trailing: Icon(Icons.arrow_forward_rounded),
                        ),
                      ),
                      Divider(color:Colors.grey.shade200,indent: 20,endIndent: 20,),
                      const SizedBox(height: 5),
                      InkWell(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context) => const Terms()));
                        },
                        child: const ListTile(
                          title: Text("Terms & Conditions"),
                          trailing: Icon(Icons.arrow_forward_rounded),
                        ),
                      ),
                      Divider(color:Colors.grey.shade200,indent: 20,endIndent: 20,),
                      const SizedBox(height: 5),
                      InkWell(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context) => const Privacy_Policy()));
                        },
                        child: const ListTile(
                          title: Text("Privacy Policy"),
                          trailing: Icon(Icons.arrow_forward_rounded),
                        ),
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
