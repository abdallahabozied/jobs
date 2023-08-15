import 'package:flutter/material.dart';
import 'package:jobsque/Model/jobpost.dart';
import 'package:jobsque/Pages/Home%20&%20Search/Home Feeds .dart';
import 'package:jobsque/Pages/Home%20&%20Search/Home_Home.dart';
import 'package:jobsque/Pages/Reset%20Password/Create%20New%20Password.dart';
import 'package:jobsque/Pages/Reset%20Password/Reset%20Password.dart';
import 'package:provider/provider.dart';
// import 'package:jobsque/Pages/Create%20Account/get%20started.dart';
// import 'package:jobsque/Pages/Create%20Account/interested%20work%20type.dart';
// import 'package:jobsque/Pages/Create%20Account/intersted%20work.dart';
// import 'package:jobsque/Pages/Sign%20In/Sign%20In.dart';
// import 'Pages/Create Account/regestrationform.dart';
import 'Pages/onboardScreens/splash.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(create: (context) {
      return Jobs();
    },
      child:
       MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          appBarTheme: const AppBarTheme(backgroundColor: Colors.white),
          brightness: Brightness.light,
          primaryColor: Colors.blue,
          scaffoldBackgroundColor: Colors.white,
          backgroundColor: Colors.white,
          primaryColorLight: Colors.blue,
          primarySwatch:Colors.blue,
          focusColor: Colors.white,
          colorScheme: ColorScheme.light(primary: Colors.blue.shade700),
          useMaterial3: true,
        ),
        home:  const Home(),));

  }
}

