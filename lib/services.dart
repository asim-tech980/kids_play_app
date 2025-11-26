import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Services {
  /// ------------------------------ SIGN UP ------------------------------
  static Future<void> signUpUser(String email, String password) async {
    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      User? user = userCredential.user;

      if (user != null) {
        await FirebaseFirestore.instance.collection('users').doc(user.uid).set({
          'email': email,
          'isVerified': false,
        });
      }
    } on FirebaseAuthException catch (e) {
      print(e.message ?? "Authentication error");
    } catch (e) {
      print("General error: $e");
    }
  }

  /// ------------------------------ LOGIN ------------------------------
  static Future<void> loginUser(String email, String password,
      Function navigateToHome, Function navigateToVerification) async {
    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      User? user = userCredential.user;

      if (user != null) {
        if (await checkVerifiedDatabase(navigateToHome)) {
          print("Navigated to home");
        } else {
          navigateToVerification();
        }
      }
    } on FirebaseAuthException catch (e) {
      print("${e.message ?? "Login error"}");
    } catch (e) {
      print("${"Error:"} $e");
    }
  }

  /// ------------------- CHECK VERIFICATION FROM CLOUD FIRESTORE -------------------
  static Future<bool> checkVerifiedDatabase(Function refreshUI) async {
    try {
      User? user = FirebaseAuth.instance.currentUser;

      if (user != null) {
        DocumentSnapshot userDoc = await FirebaseFirestore.instance
            .collection('users')
            .doc(user.uid)
            .get();

        if (userDoc.exists) {
          bool? isVerified = userDoc['isVerified'];

          if (isVerified == true) {
            refreshUI(); // Navigate or update UI
            return true; // User is verified
          } else {
            print("Email not verified in database.");
            return false; // User exists but not verified
          }
        } else {
          print("User document not found in Firestore.");
          return false; // No user document found
        }
      } else {
        print("No logged in user.");
        return false; // No user
      }
    } catch (e) {
      print("Error: $e");
      return false; // Error occurred
    }
  }
}
