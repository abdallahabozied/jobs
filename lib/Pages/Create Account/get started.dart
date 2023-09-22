import 'package:flutter/material.dart';
import 'package:jobsque/Pages/Home%20&%20Search/Home_Home.dart';

class Get_Started extends StatelessWidget {
  const Get_Started({super.key});

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
          const Text("Your Account has been set up!",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
          Container(
            padding: const EdgeInsets.all(8),
            alignment: Alignment.center,
            child: const Text( textAlign: TextAlign.center,"We have customized feeds according to your \n prefrences"),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height*0.3,
          ),
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.indigoAccent,
                  minimumSize: const Size(300, 50)),
              onPressed: () {
                Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => const Home(),), (route) => false);
              },
              child: const Text(
                "Get Started",
                style: TextStyle(color: Colors.white),
              ))
        ],
      ),
    );
  }
}
