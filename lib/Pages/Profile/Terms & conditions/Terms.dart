import 'package:flutter/material.dart';

class Terms extends StatelessWidget {
  const Terms({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        scrolledUnderElevation: 0,
        title: const Text("Terms & Conditions"),
      ),
      body: Scrollbar(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("Your Privacy Policy is Important",
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                const SizedBox(height: 10),
                const Text(
                    " sdfifdjfijskfjskfjksjdfiscjsckmklsvcmdfvxodfvilkvjmlvmdklfnvdufvnidufhvsdjikvhnkshvkjhfsdfhiosdhiosddfiosjnckndskcnkjlfsdilvjklnvklcnsknkdjhvsihlvkjdnvsfjkvsijdhfkdsjkkkkkkkkkkkkkkkkja;lkdfnvadfm,vnioejfals,dfma;oweirjfqwpefjdkfjjpqpfqjirqireqpfje;rpfqkje;flkefldfdflkfjsdlfsjdfkjdfl "),
                const Text(
                    " sdfifdjfijskfjskfjksjdfiscjsckmklsvcmdfvxodfvilkvjmlvmdklfnvdufvnidufhvsdjikvhnkshvkjhfsdfhiosdhiosddfiosjnckndskcnkjlfsdilvjklnvklcnsknkdjhvsihlvkjdnvsfjkvsijdhfkdsjkkkkkkkkkkkkkkkkja;lkdfnvadfm,vnioejfals,dfma;oweirjfqwpefjdkfjjpqpfqjirqireqpfje;rpfqkje;flkefldfdflkfjsdlfsjdfkjdfl "),
                const SizedBox(height: 10),
                const Text("Your Privacy Policy is Important",
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                const SizedBox(height: 10),
                const Text(
                    " sdfifdjfijskfjskfjksjdfiscjsckmklsvcmdfvxodfvilkvjmlvmdklfnvdufvnidufhvsdjikvhnkshvkjhfsdfhiosdhiosddfiosjnckndskcnkjlfsdilvjklnvklcnsknkdjhvsihlvkjdnvsfjkvsijdhfkdsjkkkkkkkkkkkkkkkkja;lkdfnvadfm,vnioejfals,dfma;oweirjfqwpefjdkfjjpqpfqjirqireqpfje;rpfqkje;flkefldfdflkfjsdlfsjdfkjdfl "),
                const SizedBox(height: 10),
                Align(
                  alignment: Alignment.center,
                  child: Container(
                      width: 300,
                      color: Colors.grey.shade200,
                      child: const Text(
                          "sdfifdjfijskfjskfjksjdfiscjsckmklsvcmdfvxodfvilkvjmlvmdklfnvdufvnidufhvsdjikvhnkshvkjhfsdfhiosdhiosddfiosjnckndskcnkjlfsdilvjklnvklcnsknkdjhvsihlvkjdnvsfjkvsijd")),
                ),
                const SizedBox(height: 10),
                const Text(
                    " sdfifdjfijskfjskfjksjdfiscjsckmklsvcmdfvxodfvilkvjmlvmdklfnvdufvnidufhvsdjikvhnkshvkjhfsdfhiosdhiosddfiosjnckndskcnkjlfsdilvjklnvklcnsknkdjhvsihlvkjdnvsfjkvsijdhfkdsjkkkkkkkkkkkkkkkkja;lkdfnvadfm,vnioejfals,dfma;oweirjfqwpefjdkfjjpqpfqjirqireqpfje;rpfqkje;flkefldfdflkfjsdlfsjdfkjdfl "),
                const Text(
                    " sdfifdjfijskfjskfjksjdfiscjsckmklsvcmdfvxodfvilkvjmlvmdklfnvdufvnidufhvsdjikvhnkshvkjhfsdfhiosdhiosddfiosjnckndskcnkjlfsdilvjklnvklcnsknkdjhvsihlvkjdnvsfjkvsijdhfkdsjkkkkkkkkkkkkkkkkja;lkdfnvadfm,vnioejfals,dfma;oweirjfqwpefjdkfjjpqpfqjirqireqpfje;rpfqkje;flkefldfdflkfjsdlfsjdfkjdfl "),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
