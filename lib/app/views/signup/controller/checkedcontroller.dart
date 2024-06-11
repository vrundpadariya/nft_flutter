
import 'package:nftapp/header.dart';

class checkedController extends GetxController {
  final LoginFormModel formModel = LoginFormModel();
  RxBool ischecked = false.obs;



  void checked() {
    ischecked.value = !ischecked.value;
  }


}