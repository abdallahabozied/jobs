import 'package:flutter/material.dart';
import 'package:jobsque/Pages/Home%20&%20Search/Home_Home.dart';

class Success_Apply extends StatelessWidget {
  const Success_Apply({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        scrolledUnderElevation: 0,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 10),
          SizedBox(
            width: MediaQuery.of(context).size.width*1.0,
            height: MediaQuery.of(context).size.height*0.27,
            child: const CircleAvatar(

              backgroundImage: AssetImage("Assets/images/1.jpg"),
            ),
          ),
          const SizedBox(
              height: 20
          ),
          const Text("Your Data has been \n  successfully sent",style: TextStyle(fontSize: 25,fontWeight: FontWeight.w400),),
          Container(
            padding: const EdgeInsets.all(8),
            alignment: Alignment.center,
            child: const Text( textAlign: TextAlign.center,"You will get message from our team ,about\nthe announcement of employee acceptance"),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height*0.25,
          ),
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                  elevation: 30,
                  shadowColor: Colors.black,
                  backgroundColor: Colors.blueAccent[700],
                  minimumSize: const Size(300, 50)),
              onPressed:(){
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const Home(),));
              } ,
              child:  const Text("Back to home",
                style: TextStyle(color: Colors.white),
              )),
        ],
      ),
    );
  }
}
