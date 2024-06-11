import 'package:nftapp/header.dart';
import 'dart:developer';
import '../../../helper/firebase/auth_helper.dart';
import '../controller/loginController.dart';

class login_page extends StatelessWidget {
  final LoginFormController Controller = Get.put(LoginFormController());

  login_page({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
          body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: height / 10.5,
            ),
            Row(
              children: [
                SizedBox(
                  width: width / 30.5,
                ),
                Text(
                  "Login into your account",
                  style: TextStyle(
                    fontSize: height / 32,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: height / 18.5,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                height: 70,
                width: double.infinity,
                child: TextFormField(
                  controller: loginEmailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    hintText: "Email",
                    labelText: "Email",
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Obx(
                () => SizedBox(
                  height: 70,
                  width: double.infinity,
                  child: TextFormField(
                    obscureText: Controller.isPasswordVisible.value,
                    controller: passwordEmailController,
                    keyboardType: TextInputType.visiblePassword,
                    decoration: InputDecoration(
                      suffixIcon: IconButton(
                        onPressed: () {
                          Controller.togglePasswordVisibility();
                          log("${Controller.isPasswordVisible.value}");
                        },
                        icon: const Icon(Icons.remove_red_eye),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      hintText: "password",
                      labelText: "password",
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(
                  width: 05,
                ),
                Text(
                  "Forget Password ?",
                  style: TextStyle(
                    fontSize: height / 50,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: height / 16.5,
            ),
            GestureDetector(
              onTap: () {
                LoginButton(
                    email: loginEmailController.text,
                    password: passwordEmailController.text,
                    context: context);
              },
              child: Container(
                alignment: Alignment.center,
                height: height / 13.5,
                width: width / 1.2,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  color: Colors.black,
                ),
                child: Text(
                  "Login",
                  style: TextStyle(fontSize: height / 40, color: Colors.white),
                ),
              ),
            ),
            SizedBox(
              height: height / 20.5,
            ),
            Text(
              "Or Login with",
              style: TextStyle(
                fontSize: height / 50,
              ),
            ),
            SizedBox(
              height: height / 18.5,
            ),
            SizedBox(
              height: height / 8.5,
              width: width / 1.2,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: width / 25.5,
                  ),
                  SocialMediaButton.google(
                    size: height / 18.5,
                    onTap: () {
                      google();
                    },
                  ),
                  SizedBox(
                    width: width / 25.5,
                  ),
                  SocialMediaButton.facebook(
                    size: height / 18.5,
                    onTap: () {
                      signInWithFacebook();
                    },
                  ),
                  SizedBox(
                    width: width / 25.5,
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.apple_rounded),
                    iconSize: height / 18.5,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: height / 18.5,
            ),
            Text(
              "Don't have an account? ",
              style: TextStyle(
                fontSize: height / 50,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Don't have an account? ",
                  style: TextStyle(
                    fontSize: height / 50,
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Get.toNamed("/signup");
                  },
                  child: Text(
                    "Sign up",
                    style: TextStyle(
                      fontSize: height / 50,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      )),
    );
  }
}
