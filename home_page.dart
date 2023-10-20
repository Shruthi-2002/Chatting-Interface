


import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("HomePage"),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(child: Text("Welcome Home buddy!",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 19),)),
            SizedBox(height: 30,),
            GestureDetector(
              onTap: (){
                FirebaseAuth.instance.signOut();
                Navigator.pushNamed(context, "/login");

              },
              child: Container(
                height: 45,
                width: 100,
                decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(10)
                ),
                child: Center(child: Text("Sign out",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 18),),),
              ),)


          ],
        )
    );
  }
}




import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart'; // Import Firebase Auth
import "package:diee/features/app/splash_screen/splash_screen.dart";
import 'package:diee/features/user_auth/presentation/pages/home_page.dart';
import 'package:diee/features/user_auth/presentation/pages/login_page.dart';
import 'package:diee/features/user_auth/presentation/pages/sign_up_page.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (kIsWeb) {
    await Firebase.initializeApp(
      options: FirebaseOptions(
        apiKey: "AIzaSyCsHDQtI9DItQgSqwy45_y2xG9tDGxuER8",
        appId: "1:540215271818:web:8b22d4aee01acdce862873",
        messagingSenderId: "540215271818",
        projectId: "flutter-firebase-9c136",
        // Your web Firebase config options
      ),
    );
  } else {
    await Firebase.initializeApp();
  }
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Firebase',
      routes: {
        '/': (context) => SplashScreen(
          // Here, you can decide whether to show the LoginPage or HomePage based on user authentication
          child: LoginPage(),
        ),
        '/login': (context) => LoginPage(),
        '/signUp': (context) => SignUpPage(),
        '/home': (context) => HomePage(),
      },
    );
  }
}