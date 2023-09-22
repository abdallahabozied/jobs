import 'package:flutter/material.dart';

class page3 extends StatelessWidget {
  const page3({super.key});

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
                image:const DecorationImage(image:AssetImage('Assets/images/3.jpg'),fit:BoxFit.cover ),
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
                TextSpan(text: "Get the best ",style:TextStyle(fontSize: 35,fontWeight: FontWeight.w500,color: Colors.black)),
                TextSpan(text: "choice for \n the job ",style:TextStyle(fontSize: 35,fontWeight: FontWeight.w500,color: Colors.indigoAccent)),
                TextSpan(text:"you've always \n dreamed of",style:TextStyle(fontSize: 35,fontWeight: FontWeight.w500,color: Colors.black)),
              ],
            ),
            ),
            const SizedBox(height: 5),
            const Text("The better the skills you have, the greater the \n good job opportunities for you.",style:TextStyle(fontSize: 15,fontWeight: FontWeight.normal,color: Colors.black54)),
    ]
    ),
      ),
    );
  }
}

