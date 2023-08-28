import 'package:flutter/material.dart';
import 'package:jobsque/Pages/Profile/Change%20Password.dart';
import 'package:jobsque/Pages/Profile/email%20address%20edit.dart';
import 'package:jobsque/Pages/Profile/phone%20number.dart';
import '../../Network/HTTP.dart' as varHTTP;

class account_access extends StatefulWidget {
  const account_access({super.key});

  @override
  State<account_access> createState() => _account_accessState();
}

class _account_accessState extends State<account_access> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        scrolledUnderElevation: 0,
        title: Text("Login and Security",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold)),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 10),
          Container(
            width: MediaQuery.of(context).size.width * 1,
            height: 30,
            decoration: BoxDecoration(color: Colors.grey.shade200),
            padding: EdgeInsets.only(left: 15),
            child: Text("Account access",
                style: TextStyle(fontSize: 20, color: Colors.black)),
          ),
          SizedBox(height: 10),
          InkWell(
            onTap: (){
               Navigator.push(context, MaterialPageRoute(builder: (context) => email_edit()));
            },
            child: ListTile(
              title: Text("Email Address"),
              trailing: SizedBox(
                width: 150,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(varHTTP.email,style: TextStyle(color: Colors.black38,fontSize: 15),),
                    Icon(Icons.arrow_forward_rounded),
                  ],
                ),
              ),
            ),
          ),
          Divider(color:Colors.grey.shade200,indent: 20,endIndent: 20,),
          InkWell(
            onTap: (){
               Navigator.push(context, MaterialPageRoute(builder: (context) => Edit_Phone_Number()));
            },
            child: ListTile(
              title: Text("Phone Number"),
              trailing: Icon(Icons.arrow_forward_rounded),
            ),
          ),
          Divider(color:Colors.grey.shade200,indent: 20,endIndent: 20,),
          InkWell(
            onTap: (){
               Navigator.push(context, MaterialPageRoute(builder: (context) => Change_Password()));
            },
            child: ListTile(
              title: Text("Change Password"),
              trailing: Icon(Icons.arrow_forward_rounded),
            ),
          ),
          Divider(color:Colors.grey.shade200,indent: 20,endIndent: 20,),
          InkWell(
            onTap: (){
              // Navigator.push(context, MaterialPageRoute(builder: (context) => notification_properties()));
            },
            child: ListTile(
              title: Text("Two Step verification"),
              trailing: SizedBox(
                width: 120,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Non Active",style: TextStyle(color: Colors.black38,fontSize: 15),),
                    Icon(Icons.arrow_forward_rounded),
                  ],
                ),
              ),
            ),
          ),
          Divider(color:Colors.grey.shade200,indent: 20,endIndent: 20,),
          InkWell(
            onTap: (){
              // Navigator.push(context, MaterialPageRoute(builder: (context) => notification_properties()));
            },
            child: ListTile(
              title: Text("Face ID"),
              trailing: Icon(Icons.arrow_forward_rounded),
            ),
          ),
          Divider(color:Colors.grey.shade200,indent: 20,endIndent: 20,),

        ],
      ),
    );
  }
}
