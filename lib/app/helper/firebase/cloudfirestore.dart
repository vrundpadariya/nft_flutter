import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'auth_helper.dart';
class FireStoreHelper {
  //singleTurn
  FireStoreHelper._();
  static final FireStoreHelper fireStoreHelper = FireStoreHelper._();
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  //AddUser

  Future<void> addUser() async {
    log("Execute");
    await firestore
        .collection("users")
        .doc(AuthHelper.auth.currentUser?.uid)
        .set({
      'name': (AuthHelper.auth.currentUser?.displayName == null)
          ? "${AuthHelper.auth.currentUser?.email?.split("@")[0].capitalizeFirst}"
          : "${AuthHelper.auth.currentUser?.displayName}",
      'email': "${AuthHelper.auth.currentUser?.email}",
      'uid': "${AuthHelper.auth.currentUser?.uid}",
      'dp': (AuthHelper.auth.currentUser?.photoURL == null)
          ? "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQkeq1f2XfFTldc0qPJF9aYl8Vce6Dz-dMP-pphcdbQDPb7R2IJere2P2NaX7f8AwEnSlg&usqp=CAU"
          : AuthHelper.auth.currentUser?.photoURL,
    });
    log("User Added");
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> userFetch() {
    return firestore
        .collection('users')
        .where('uid', isNotEqualTo: AuthHelper.auth.currentUser?.uid)
        .snapshots();
  }


}