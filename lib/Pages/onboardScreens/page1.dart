import 'package:flutter/material.dart';


class page1 extends StatelessWidget {
  const page1({super.key});

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
                  borderRadius: BorderRadius.circular(15),                  image:const DecorationImage(image:AssetImage('Assets/images/1.jpg'),fit:BoxFit.cover ),
                  gradient: const LinearGradient(
                    colors: [Colors.white12, Colors.transparent],
                    begin: Alignment.topLeft,
                    end: Alignment.topRight,
                  ),
                ),
              ),
              const SizedBox(height: 5),
              const Row(
                children: [
                  Text("Find a job,and ",style:TextStyle(fontSize: 35,fontWeight: FontWeight.w500)),
                  Text("start ",style:TextStyle(fontSize: 35,fontWeight: FontWeight.w500,color: Colors.indigoAccent)),
                ],
              ),
              const Row(
                children: [
                  Text("building ",style:TextStyle(fontSize: 35,fontWeight: FontWeight.w500,color: Colors.indigoAccent)),
                  Text("your career ",style:TextStyle(fontSize: 35,fontWeight: FontWeight.w500)),

                ],
              ),
              const Text("from now on",style:TextStyle(fontSize: 35,fontWeight: FontWeight.w500)),
              const SizedBox(height: 5),
              const Text("Explore over 25,924 available job roles  and \n upgrade your operator now",style:TextStyle(fontSize: 15,fontWeight: FontWeight.normal,color: Colors.black54)),
              const SizedBox(height: 15),

            ],
          ),
        ),
    );
  }
}

