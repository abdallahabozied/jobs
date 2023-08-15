import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:jobsque/Pages/Home%20&%20Search/Home_Home.dart';
import 'package:jobsque/Pages/onboardScreens/page0.dart';


class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {

  @override
  void initState() {
    bool? islogin;
    var  user=FirebaseAuth.instance.currentUser;
    if(user == null){
      islogin=false;
    }else{
      islogin=true;
    }
    Future.delayed(const Duration(seconds:2),(){
      if (islogin== true){
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const Home(),));
      }else{
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const Page0(),));
      }
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Stack(
          alignment: Alignment.center,
          children: [
            Container(
                width: 280,
                height: 280,
                decoration: BoxDecoration(
                    color: Colors.black26,
                    shape: BoxShape.circle
                )),
            Container(
                width: 600,
                height: 600,
                decoration: BoxDecoration(
                    color: Colors.black12,
                    shape: BoxShape.circle
                )),
            Container(
              width: 800,
              height: 800,
              decoration: BoxDecoration(
                  color: Colors.white38,
                  shape: BoxShape.circle
              )),
            Container(
                width: 1000,
                height: 1000,
                decoration: BoxDecoration(
                    color: Colors.transparent,
                    shape: BoxShape.circle
                )),
            Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("J",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 50)),
                  Icon(Icons.search , color: Colors.blueAccent,size: 50,),
                  Text("BSQUE",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 50)),
                ]
            ),]
        ),
      )
    );
  }
}