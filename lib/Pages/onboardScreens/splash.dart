import 'package:flutter/material.dart';
import 'package:jobsque/Pages/Home%20&%20Search/Home_Home.dart';
import 'package:jobsque/Pages/onboardScreens/page0.dart';
import 'package:shared_preferences/shared_preferences.dart';

SharedPreferences? logindata;
bool? isloggedin = false;
class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {

    Future.delayed(const Duration(seconds:2),(){
      CheckSignIn();
    });
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
   // var prov = Provider.of<Jobs>(context);


    return Scaffold(
      body: Center(
        child: Stack(
          alignment: Alignment.center,
          children: [
            Container(
                width: 280,
                height: 280,
                decoration: const BoxDecoration(
                    color: Colors.black26,
                    shape: BoxShape.circle
                )),
            Container(
                width: 600,
                height: 600,
                decoration: const BoxDecoration(
                    color: Colors.black12,
                    shape: BoxShape.circle
                )),
            Container(
              width: 800,
              height: 800,
              decoration: const BoxDecoration(
                  color: Colors.white38,
                  shape: BoxShape.circle
              )),
            Container(
                width: 1000,
                height: 1000,
                decoration: const BoxDecoration(
                    color: Colors.transparent,
                    shape: BoxShape.circle
                )),
            const Row(
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
  void CheckSignIn() async{
    var  logindata = await SharedPreferences.getInstance();
    var   user =(logindata.getBool('login'));
    // print("the new user is"+ " $user");
    if(user==true){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const Home()));
    }else {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const Page0()));
    }

  }
}