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
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 10),
            Container(
              width: MediaQuery.of(context).size.width*1.0,
              height: MediaQuery.of(context).size.height*0.27,
              child: CircleAvatar(

                backgroundImage: AssetImage("Assets/images/check_mail.png"),
              ),
            ),
            SizedBox(
                height: 20
            ),
            Text("Check your Email",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
            Container(
              padding: EdgeInsets.all(8),
              alignment: Alignment.center,
              child: Text( textAlign: TextAlign.center,"We have sent a reset pasword to your email address"),
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
      ),
    );
  }
}
