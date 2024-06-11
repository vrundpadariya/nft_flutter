import 'dart:developer';

import 'package:nftapp/app/views/signup/controller/checkedcontroller.dart';
import '../../../../header.dart';
import '../components/components.dart';

class Signup extends StatelessWidget {
  final checkedController signupcontroller = Get.put(checkedController());

  Signup({super.key});

  String? password;
  String? confirmpassword;

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
              height: height / 14.5,
            ),
            Row(
              children: [
                SizedBox(
                  width: width / 40,
                ),
                Text(
                  "Sign up",
                  style: robotoBold(height),
                ),
              ],
            ),
            SizedBox(
              height: height / 28.5,
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: TextFormField(
                controller: signupEmailController,
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
            SizedBox(
              height: height / 50.5,
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: TextFormField(
                onChanged: (val) {
                  password = val;
                },
                controller: signuppasswordController,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  hintText: "Enter the password",
                  labelText: "password",
                ),
              ),
            ),
            SizedBox(
              height: height / 50.5,
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: TextFormField(
                onChanged: (val) {
                  confirmpassword = val;
                },
                controller: signupconfirmpasswordController,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  hintText: "confirm your password herer ",
                  labelText: "Confirm Password",
                ),
              ),
            ),
            SizedBox(
              height: height / 30.5,
            ),
            Row(
              children: [
                Obx(
                  () => Checkbox(
                    value: signupcontroller.ischecked.value,
                    onChanged: (val) {
                      signupcontroller.checked();
                    },
                  ),
                ),
                const Text(
                  "I have read and agree to NFTANCY Terms of \nService  and Private Policy",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                )
              ],
            ),
            SizedBox(
              height: height / 20.5,
            ),
            Obx(
              () => GestureDetector(
                onTap: () {
                  Signupbutton(
                    email: signupEmailController.text,
                    password: signuppasswordController.text,
                  );

                  signupEmailController.clear();
                  signuppasswordController.clear();
                  signupconfirmpasswordController.clear();

                  log("$password");
                  log("$confirmpassword");
                },
                child: Container(
                  alignment: Alignment.center,
                  height: height * 0.08,
                  width: width * 0.60,
                  decoration: BoxDecoration(
                    color: (signupcontroller.ischecked.value)
                        ? Colors.black
                        : Colors.black38,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    "Sign up",
                    style: TextStyle(
                      fontSize: 22,
                      color: (signupcontroller.ischecked.value)
                          ? Colors.white
                          : Colors.black,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      )),
    );
  }
}
