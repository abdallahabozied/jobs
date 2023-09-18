import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:jobsque/Model/jobpost.dart';
import 'package:jobsque/Pages/Home%20&%20Search/Home_Home.dart';
import 'package:jobsque/Pages/Messages/chat%20page.dart';
import 'package:jobsque/Pages/Messages/chats%20list.dart';
import 'package:jobsque/Pages/Profile/language.dart';
import 'package:jobsque/Pages/Profile/portofolio.dart';
import 'package:jobsque/Pages/Profile/profile.dart';
import 'package:provider/provider.dart';

import 'Pages/onboardScreens/splash.dart';

Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  //await FirebaseAuth.instance.useAuthEmulator('10.0.2.2', 9099);

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
         debugShowCheckedModeBanner: false,
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
        home:  const Splash()));

  }
}

