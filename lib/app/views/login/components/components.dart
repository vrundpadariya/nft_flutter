import 'dart:developer';

import 'package:cherry_toast/cherry_toast.dart';
import '../../../../header.dart';
import '../../../helper/firebase/auth_helper.dart';
import '../../../helper/firebase/cloudfirestore.dart';
import '../model/loginmodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


TextEditingController loginEmailController = TextEditingController();
TextEditingController passwordEmailController = TextEditingController();

//Todo login button function
LoginButton(
    {required String email,
    required String password,
    required BuildContext context}) async {
  LoginModel loginModel = LoginModel(email: email, password: password);

  // loginmodel loginmodel = loginmodel(email: email, password: password);
  Map<String, dynamic> res =
      await AuthHelper.authHelper.login(loginmodel: loginModel);
  if (res['error'] != null) {
    return CherryToast.error(
      title: const Text("Login Failed"),
    ).show(context);
  } else {
    Get.offAllNamed('/home');
    FireStoreHelper.fireStoreHelper.addUser();
  }
}


google() async {
  Map<String, dynamic> res = await AuthHelper.authHelper.signInWithGoogle();
  if (res['error'] != null) {
    return log('login failed');
  } else {
    Get.offAllNamed('/home');
    FireStoreHelper.fireStoreHelper.addUser();
  }
}

Stack loginStack() => Stack(
  alignment: Alignment.center,
  children: [
    Divider(
      color: (Get.isDarkMode == true) ? Colors.white : Colors.black,
    ),
    Container(
      padding: const EdgeInsets.only(left: 5, right: 5),
      color: (Get.isDarkMode == true) ? Colors.black : Colors.white,
      child: const Text("OR"),
    ),
  ],
);

Container loginContainer(
    {required String img, required BuildContext context}) =>
    Container(
      padding: const EdgeInsets.all(10),
      height: MediaQuery.sizeOf(context).height / 15,
      width: MediaQuery.sizeOf(context).height / 15,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: (Get.isDarkMode == true)
              ? Colors.white.withOpacity(0.5)
              : Colors.black.withOpacity(0.5),
        ),
      ),
      child: Image.asset(img),
    );
