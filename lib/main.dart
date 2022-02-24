import 'package:bebeautyapp/introduction_screen/introduction_screen.dart';
import 'package:bebeautyapp/repo/function/sign_in.dart';
import 'package:bebeautyapp/repo/function/sign_up.dart';
import 'package:bebeautyapp/ui/authenication/login/login_screen.dart';
import 'package:bebeautyapp/ui/authenication/register/register_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<SignIn_Function>(
            create: (context) => SignIn_Function()),
        ChangeNotifierProvider<SignUp_Function>(
            create: (context) => SignUp_Function()),
      ],
      child: MaterialApp(
        home: IntroductionScreen(),
        debugShowCheckedModeBanner: false,
        routes: {
          RegisterScreen.id: (context) => RegisterScreen(),
          LoginScreen.id: (context) => LoginScreen(),
        },
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
