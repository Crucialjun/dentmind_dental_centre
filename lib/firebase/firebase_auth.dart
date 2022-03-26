import 'package:dentmind_dental_centre/firebase/firebase_storage_methods.dart';
import 'package:dentmind_dental_centre/models/client_model.dart';
import 'package:dentmind_dental_centre/utils/dialogs.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class FirebaseUserRepo extends ChangeNotifier {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Stream<User?> get authState => _firebaseAuth.authStateChanges();

  Future<bool> signupUser(
    BuildContext context,
    String email,
    String password,
    String firstName,
    String lastName,
  ) async {
    try {
      await _firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);

      Client client = Client(
          email: email,
          firstName: firstName,
          lastName: lastName,
          uid: _firebaseAuth.currentUser!.uid,
          phoneNumber: "");
      await FirebaseStorageMethods().addClient(client);
      return true;
    } on FirebaseAuthException catch (e) {
      showErrorDialog(context, e.message.toString());
      return false;
    }
  }

  Future logoutUser() async {
    await _firebaseAuth.signOut();
  }
}
