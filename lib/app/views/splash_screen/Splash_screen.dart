import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Timer(const Duration(seconds: 5), () {
      Get.toNamed("/intro");
    });
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xfff4f7fb),
        body: Stack(
          alignment: Alignment.center,
          children: [
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "NFTANCY",
                  style: TextStyle(
                    letterSpacing: 05,
                    fontSize: 30,
                  ),
                ),
              ],
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Image.asset("asset/splas.png"),
            ),
          ],
        ),
      ),
    );
  }
}
