import 'package:flutter/material.dart';

class page2 extends StatelessWidget {
  const page2({super.key});

  @override
  Widget build(BuildContext context) {


    return Scaffold(

      body:Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.4,
              width: MediaQuery.of(context).size.width * 1.0,
              decoration:  BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                image:const DecorationImage(image:AssetImage('Assets/images/2.jpg'),fit:BoxFit.cover ),
                gradient: const LinearGradient(
                  colors: [Colors.white12, Colors.transparent],
                  begin: Alignment.topLeft,
                  end: Alignment.topRight,
                ),
              ),
            ),
            const SizedBox(height: 5),
            RichText(
              text: const TextSpan(
              children: [
                TextSpan(text: "Hundreds of jobs are \nwaiting for you to ",style:TextStyle(fontSize: 35,fontWeight: FontWeight.w500,color: Colors.black)),
                TextSpan(text: "join \n together ",style:TextStyle(fontSize: 35,fontWeight: FontWeight.w500,color: Colors.indigoAccent)),
              ],
            ),
            ),
            const SizedBox(height: 5),
            const Text("Immediately join us and start applying for the \n job you are interested in.",style:TextStyle(fontSize: 15,fontWeight: FontWeight.normal,color: Colors.black54)),
          ],
        ),
      ),
    );
  }
}

