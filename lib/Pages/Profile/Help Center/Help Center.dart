import 'dart:ui';

import 'package:flutter/material.dart';

class Help_Center extends StatefulWidget {
  const Help_Center({super.key});

  @override
  State<Help_Center> createState() => _Help_CenterState();
}

class _Help_CenterState extends State<Help_Center> {

  TextEditingController _searchcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        scrolledUnderElevation: 0,
        title: Text("Help Center",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
      ),
      body: SingleChildScrollView(

        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height:10),
              TextField(
                controller: _searchcontroller,
                onSubmitted: (value){
                  setState(() {
                    _searchcontroller.text = value;
                  });

                },
                decoration: const InputDecoration(
                  hintText: "  What can we help ",
                  prefixIcon: Icon(Icons.search),
                  alignLabelWithHint: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(40)),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(40),),
                    borderSide: BorderSide(color: Colors.blue),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(40)),
                    borderSide: BorderSide(color: Colors.blue),
                  ),
                ),
                cursorColor: Colors.blue,
              ),
              SizedBox(height:10),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(color: Colors.black)
                ),
                child: ExpansionTile(
                    childrenPadding: EdgeInsets.all(10),
                    title: Text("Lorem ipsum dolor sit amet"),
                    children: [
                      Text("sdfifdjfijskfjskfjksjdfiscjsckmklsvcmdfvxodfvilkvjmlvmdklfnvdufvnidufhvsdjikvhnkshvkjhfsdfhiosdhiosddfiosjnckndskcnkjlfsdilvjklnvklcnsknkdjhvsihlvkjdnvsfjkvsijdhfkdsjkkkkkkkkkkkkkkkkja;lkdfnvadfm,vnioejfals,dfma;oweirjfq'wpefjdkfjjpqpfqjirqireqpfj'e;rpfqkje;flkefldfdflkfjsdlfsjdfkjdfl")
                    ],

                collapsedShape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15))
                    ),
              ),
              SizedBox(height:10),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(color: Colors.black)
                ),
                child: ExpansionTile(
                    childrenPadding: EdgeInsets.all(10),
                    title: Text("Lorem ipsum dolor sit amet"),
                    children: [
                      Text("sdfifdjfijskfjskfjksjdfiscjsckmklsvcmdfvxodfvilkvjmlvmdklfnvdufvnidufhvsdjikvhnkshvkjhfsdfhiosdhiosddfiosjnckndskcnkjlfsdilvjklnvklcnsknkdjhvsihlvkjdnvsfjkvsijdhfkdsjkkkkkkkkkkkkkkkkja;lkdfnvadfm,vnioejfals,dfma;oweirjfq'wpefjdkfjjpqpfqjirqireqpfj'e;rpfqkje;flkefldfdflkfjsdlfsjdfkjdfl")
                    ],

                    collapsedShape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15))
                ),
              ),
              SizedBox(height:10),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(color: Colors.black)
                ),
                child: ExpansionTile(
                    childrenPadding: EdgeInsets.all(10),
                    title: Text("Lorem ipsum dolor sit amet"),
                    children: [
                      Text("sdfifdjfijskfjskfjksjdfiscjsckmklsvcmdfvxodfvilkvjmlvmdklfnvdufvnidufhvsdjikvhnkshvkjhfsdfhiosdhiosddfiosjnckndskcnkjlfsdilvjklnvklcnsknkdjhvsihlvkjdnvsfjkvsijdhfkdsjkkkkkkkkkkkkkkkkja;lkdfnvadfm,vnioejfals,dfma;oweirjfq'wpefjdkfjjpqpfqjirqireqpfj'e;rpfqkje;flkefldfdflkfjsdlfsjdfkjdfl")
                    ],

                    collapsedShape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15))
                ),
              ),
              SizedBox(height:10),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(color: Colors.black)
                ),
                child: ExpansionTile(
                    childrenPadding: EdgeInsets.all(10),
                    title: Text("Lorem ipsum dolor sit amet"),
                    children: [
                      Text("sdfifdjfijskfjskfjksjdfiscjsckmklsvcmdfvxodfvilkvjmlvmdklfnvdufvnidufhvsdjikvhnkshvkjhfsdfhiosdhiosddfiosjnckndskcnkjlfsdilvjklnvklcnsknkdjhvsihlvkjdnvsfjkvsijdhfkdsjkkkkkkkkkkkkkkkkja;lkdfnvadfm,vnioejfals,dfma;oweirjfq'wpefjdkfjjpqpfqjirqireqpfj'e;rpfqkje;flkefldfdflkfjsdlfsjdfkjdfl")
                    ],

                    collapsedShape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15))
                ),
              ),
              SizedBox(height:10),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(color: Colors.black)
                ),
                child: ExpansionTile(
                    childrenPadding: EdgeInsets.all(10),
                    title: Text("Lorem ipsum dolor sit amet"),
                    children: [
                      Text("sdfifdjfijskfjskfjksjdfiscjsckmklsvcmdfvxodfvilkvjmlvmdklfnvdufvnidufhvsdjikvhnkshvkjhfsdfhiosdhiosddfiosjnckndskcnkjlfsdilvjklnvklcnsknkdjhvsihlvkjdnvsfjkvsijdhfkdsjkkkkkkkkkkkkkkkkja;lkdfnvadfm,vnioejfals,dfma;oweirjfq'wpefjdkfjjpqpfqjirqireqpfj'e;rpfqkje;flkefldfdflkfjsdlfsjdfkjdfl")
                    ],

                    collapsedShape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15))
                ),
              ),
              SizedBox(height:10),


            ],
          ),
        ),
      ),


    );
  }
}
