import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nftapp/app/views/login/views/login.dart';
import 'package:nftapp/app/views/splash_screen/Splash_screen.dart';

import 'app/views/home/views/home.dart';
import 'app/views/intro_screen/views/intro.dart';
import 'app/views/signup/views/signup.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      getPages: [
        GetPage(
          name: "/home",
          page: () => const SplashScreen(),
        ),
        GetPage(
          name: "/intro",
          page: () => const Intro(),
        ),
        GetPage(
          name: "/login",
          page: () => login_page(),
        ),
        GetPage(
          name: "/signup",
          page: () => Signup(),
        ),
        GetPage(
          name: "/",
          page: () => HomePage(),
        ),
      ],
    ),
  );
}
//not necessary
//https://nft-app-5e17e.firebaseapp.com/__/auth/handler
