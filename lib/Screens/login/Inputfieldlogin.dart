import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:kids_play_mob_app/Screens/login/verification_waiting_view.dart';
import 'package:kids_play_mob_app/Screens/register/register.dart';
import 'package:kids_play_mob_app/Screens/resetpassword.dart';

class InputFieldLogin extends StatefulWidget {
  const InputFieldLogin({Key? key}) : super(key: key);

  @override
  State<InputFieldLogin> createState() => _InputFieldLoginState();
}

class _InputFieldLoginState extends State<InputFieldLogin> {
  final formkey = GlobalKey<FormState>();
  var email = "";
  var password = "";

  //Text editing controller
  final emailcontroller = TextEditingController();
  final passwordcontroller = TextEditingController();

  //For storing user credential
  final storage = const FlutterSecureStorage();

  @override
  Widget build(BuildContext context) {
    //User login function through Firebase
    // userlogin() async {
    //   try {
    //     UserCredential userCredential = await FirebaseAuth.instance
    //         .signInWithEmailAndPassword(email: email, password: password);
    //     await storage.write(key: "uid", value: userCredential.user?.uid);
    //
    //   } on FirebaseAuthException catch (e) {
    //     if (e.code == 'user-not-found') {
    //       ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
    //           backgroundColor: Colors.deepOrange,
    //           content: Text(
    //             'User not Found',
    //             style: TextStyle(color: Colors.white, fontSize: 20),
    //           )));
    //     } else if (e.code == 'wrong-password') {
    //       ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
    //           backgroundColor: Colors.deepOrange,
    //           content: Text(
    //             'Password is incorrect Please try again',
    //             style: TextStyle(color: Colors.white, fontSize: 20),
    //           )));
    //     }
    //   }
    //   /* Navigator.pushAndRemoveUntil(
    //       context,
    //       MaterialPageRoute(builder: (context) => const HomeScreen()),
    //           (route) => false);*/
    // }

    return Form(
      key: formkey,
      child: Column(
        children: [
          //Email Text Field
          Container(
            padding: const EdgeInsets.all(10),
            decoration: const BoxDecoration(
                border: Border(bottom: BorderSide(color: Colors.grey))),
            child: TextFormField(
              autofocus: false,
              controller: emailcontroller,
              keyboardType: TextInputType.emailAddress,
              textInputAction: TextInputAction.next,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please Enter Email';
                } else if (!value.contains('@')) {
                  return 'Please Enter valid Email';
                }
                return null;
              },
              decoration: const InputDecoration(
                  hintText: "Enter your Email",
                  hintStyle: TextStyle(color: Colors.black45),
                  border: InputBorder.none),
            ),
          ),
          //Password text Field
          Container(
            padding: const EdgeInsets.all(10),
            decoration: const BoxDecoration(
                border: Border(bottom: BorderSide(color: Colors.grey))),
            child: TextFormField(
              autofocus: false,
              controller: passwordcontroller,
              textInputAction: TextInputAction.done,
              obscureText: true,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please Enter Valid Password';
                }
                return null;
              },
              decoration: const InputDecoration(
                  hintText: "Enter your Password",
                  hintStyle: TextStyle(color: Colors.black45),
                  border: InputBorder.none),
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          //Forget Password Button
          GestureDetector(
            child: const Text(
              'Forgot Password',
              style: TextStyle(color: Colors.black45),
            ),
            onTap: () {
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const ResetPassword()),
                  (route) => false);
            },
          ),
          const SizedBox(
            height: 25,
          ),
          //Login Button

          InkWell(
            onTap: () {
              if (formkey.currentState!.validate()) {
                setState(() {
                  email = emailcontroller.text;
                  password = passwordcontroller.text;
                });
              }
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const VerificationWaitingView()),
                  (route) => false);
            },
            child: Container(
              height: 50,
              margin: const EdgeInsets.symmetric(horizontal: 50),
              decoration: BoxDecoration(
                  color: Colors.deepOrange,
                  borderRadius: BorderRadius.circular(10)),
              child: const Center(
                child: Text(
                  "Login",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),

          const SizedBox(
            height: 25,
          ),
          //Register Page Button
          GestureDetector(
            child: const Text(
              'Have no account? Register',
              style: TextStyle(color: Colors.black45),
            ),
            onTap: () {
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => const Register()),
                  (route) => false);
            },
          ),
        ],
      ),
    );
  }
}
