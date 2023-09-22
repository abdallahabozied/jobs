import 'package:flutter/material.dart';

class Check_Your_Email extends StatelessWidget {
  const Check_Your_Email({super.key});

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
          Image.asset("Assets/images/check_mail.png"),
          const SizedBox(
              height: 20
          ),
          const Text("Check your Email",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
          Container(
            padding: const EdgeInsets.all(8),
            alignment: Alignment.center,
            child: const Text( textAlign: TextAlign.center,"We have sent a reset pasword to your email address"),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height*0.3,
          ),
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.indigoAccent,
                  minimumSize: const Size(300, 50)),
              onPressed: () {},
              child: const Text(
                "Open email app",
                style: TextStyle(color: Colors.white),
              ))
        ],
      ),
    );
  }
}
