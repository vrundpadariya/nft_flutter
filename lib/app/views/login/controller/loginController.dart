  import 'package:nftapp/header.dart';

  class LoginFormController extends GetxController {
    final LoginFormModel formModel = LoginFormModel();
    RxBool isPasswordVisible = false.obs;



    void togglePasswordVisibility() {
      isPasswordVisible.value = !isPasswordVisible.value;
    }

    void updateEmail(String value) {
      formModel.email = value;
      update();
    }

    void updatePassword(String value) {
      formModel.password = value;
      update();
    }

    bool isFormValid() {
      return formModel.email.isNotEmpty && formModel.password.isNotEmpty;
    }
  }