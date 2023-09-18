import 'package:flutter/material.dart';

class Terms extends StatelessWidget {
  const Terms({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        scrolledUnderElevation: 0,
        title: Text("Terms & Conditions"),
      ),
      body: Scrollbar(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Your Privacy Policy is Important",
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                SizedBox(height: 10),
                Text(
                    " sdfifdjfijskfjskfjksjdfiscjsckmklsvcmdfvxodfvilkvjmlvmdklfnvdufvnidufhvsdjikvhnkshvkjhfsdfhiosdhiosddfiosjnckndskcnkjlfsdilvjklnvklcnsknkdjhvsihlvkjdnvsfjkvsijdhfkdsjkkkkkkkkkkkkkkkkja;lkdfnvadfm,vnioejfals,dfma;oweirjfqwpefjdkfjjpqpfqjirqireqpfje;rpfqkje;flkefldfdflkfjsdlfsjdfkjdfl "),
                Text(
                    " sdfifdjfijskfjskfjksjdfiscjsckmklsvcmdfvxodfvilkvjmlvmdklfnvdufvnidufhvsdjikvhnkshvkjhfsdfhiosdhiosddfiosjnckndskcnkjlfsdilvjklnvklcnsknkdjhvsihlvkjdnvsfjkvsijdhfkdsjkkkkkkkkkkkkkkkkja;lkdfnvadfm,vnioejfals,dfma;oweirjfqwpefjdkfjjpqpfqjirqireqpfje;rpfqkje;flkefldfdflkfjsdlfsjdfkjdfl "),
                SizedBox(height: 10),
                Text("Your Privacy Policy is Important",
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                SizedBox(height: 10),
                Text(
                    " sdfifdjfijskfjskfjksjdfiscjsckmklsvcmdfvxodfvilkvjmlvmdklfnvdufvnidufhvsdjikvhnkshvkjhfsdfhiosdhiosddfiosjnckndskcnkjlfsdilvjklnvklcnsknkdjhvsihlvkjdnvsfjkvsijdhfkdsjkkkkkkkkkkkkkkkkja;lkdfnvadfm,vnioejfals,dfma;oweirjfqwpefjdkfjjpqpfqjirqireqpfje;rpfqkje;flkefldfdflkfjsdlfsjdfkjdfl "),
                SizedBox(height: 10),
                Align(
                  alignment: Alignment.center,
                  child: Container(
                      width: 300,
                      color: Colors.grey.shade200,
                      child: Text(
                          "sdfifdjfijskfjskfjksjdfiscjsckmklsvcmdfvxodfvilkvjmlvmdklfnvdufvnidufhvsdjikvhnkshvkjhfsdfhiosdhiosddfiosjnckndskcnkjlfsdilvjklnvklcnsknkdjhvsihlvkjdnvsfjkvsijd")),
                ),
                SizedBox(height: 10),
                Text(
                    " sdfifdjfijskfjskfjksjdfiscjsckmklsvcmdfvxodfvilkvjmlvmdklfnvdufvnidufhvsdjikvhnkshvkjhfsdfhiosdhiosddfiosjnckndskcnkjlfsdilvjklnvklcnsknkdjhvsihlvkjdnvsfjkvsijdhfkdsjkkkkkkkkkkkkkkkkja;lkdfnvadfm,vnioejfals,dfma;oweirjfqwpefjdkfjjpqpfqjirqireqpfje;rpfqkje;flkefldfdflkfjsdlfsjdfkjdfl "),
                Text(
                    " sdfifdjfijskfjskfjksjdfiscjsckmklsvcmdfvxodfvilkvjmlvmdklfnvdufvnidufhvsdjikvhnkshvkjhfsdfhiosdhiosddfiosjnckndskcnkjlfsdilvjklnvklcnsknkdjhvsihlvkjdnvsfjkvsijdhfkdsjkkkkkkkkkkkkkkkkja;lkdfnvadfm,vnioejfals,dfma;oweirjfqwpefjdkfjjpqpfqjirqireqpfje;rpfqkje;flkefldfdflkfjsdlfsjdfkjdfl "),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
