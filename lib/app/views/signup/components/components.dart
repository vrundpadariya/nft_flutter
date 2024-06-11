import 'dart:developer';

import '../../../../header.dart';
import '../../../helper/firebase/auth_helper.dart';
import '../model/signupmodel.dart';

TextEditingController signupEmailController = TextEditingController();
TextEditingController signuppasswordController = TextEditingController();
TextEditingController signupconfirmpasswordController = TextEditingController();

 TextStyle robotoBold(double height) {
return GoogleFonts.roboto(
fontSize: height / 30,
fontWeight: FontWeight.w400,
);
}

//todo: signup btn click
Signupbutton({required String email, required String password}) async {
 SignUpModel signUpModel = SignUpModel(email: email, password: password);
 Map<String, dynamic> res =
 await AuthHelper.authHelper.signUp(signUpModel: signUpModel);
 if (res['error'] != null) {
  log('signup failed');
 } else {
  log('user created');

  Get.toNamed('/login');
 }
}