import 'package:flutter/material.dart';
import 'package:jobsque/Pages/onboardScreens/page1.dart';
import 'package:jobsque/Pages/onboardScreens/page2.dart';
import 'package:jobsque/Pages/onboardScreens/page3.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../Create Account/regestrationform.dart';

class Page0 extends StatelessWidget {
  const Page0({super.key});

  @override
  Widget build(BuildContext context) {
    final _controller = PageController();
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 100,
        actions: [
          MaterialButton(
              splashColor: Colors.white12,
              highlightColor: Colors.white12,
              onPressed: () {
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Regestration_Form(),));
              },
              child: const Text(
                "Skip",
                style: TextStyle(color: Colors.grey, fontSize: 15),
              ))
        ],
        leading: const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text("J",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
              Icon(Icons.search, color: Colors.blueAccent, size: 20),
              Text("BSQUE",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
            ]),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width * 1.0,
              height: MediaQuery.of(context).size.height * 0.75,
              child: PageView(
                controller: _controller,
                children: const [page1(), page2(), page3()],
              ),
            ),
            SmoothPageIndicator(
              controller: _controller,
              count: 3,
              effect: ColorTransitionEffect(
                  dotHeight: 7,
                  dotWidth: 7,
                  activeDotColor: Colors.indigoAccent.withOpacity(0.8),
                  dotColor: Colors.indigoAccent.withOpacity(0.4)),
            ),
            const SizedBox(height: 5),
            Center(
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.indigoAccent,
                      minimumSize: const Size(300, 50)),
                  onPressed: () {
                    _controller.nextPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.linear);
                  },
                  child: const Text(
                    "Next",
                    style: TextStyle(color: Colors.white),
                  )),
            )
          ],
        ),
      ),
    );
  }
}
