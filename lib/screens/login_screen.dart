import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:rider_app/components/components.dart';
import 'package:rider_app/constants/constants.dart';
import 'package:rider_app/main.dart';
import 'package:rider_app/widgets/show_dialog.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final firebaseAuth = FirebaseAuth.instance;
  loginUser(context) async {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) {
          return const ProgressDialog(
              message: 'Authenticating, Please wait...');
        });
    await firebaseAuth
        .signInWithEmailAndPassword(
            email: emailController.text, password: passwordController.text)
        .then((value) {
      userRef.child(value.user!.uid).once().then((data) {
        if (data.snapshot.value != null) {
          showToast(
              message: 'you are logged-in now', state: ToastStates.SUCCESS);
          navigateAndFinish(context, homeRoute);
        } else {
          firebaseAuth.signOut();
          showToast(
              message:
                  'No record exists for this user. Please create new account.',
              state: ToastStates.ERROR);
          Navigator.of(context).pop();
        }
      });
    }).catchError((error) {
      Navigator.of(context).pop();
      showToast(message: error.toString(), state: ToastStates.ERROR);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              const SizedBox(
                height: 35.0,
              ),
              const Image(
                image: AssetImage('assets/images/logo.png'),
                width: 390.0,
                height: 250.0,
                alignment: Alignment.center,
              ),
              const SizedBox(height: 1.0),
              const Text(
                'Login as a Rider',
                style: TextStyle(fontSize: 24.0, fontFamily: 'Brand Bold'),
                textAlign: TextAlign.center,
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    const SizedBox(height: 1.0),
                    TextFormField(
                      controller: emailController,
                      keyboardType: TextInputType.emailAddress,
                      decoration: const InputDecoration(
                        labelText: 'Email',
                        labelStyle: TextStyle(
                          fontSize: 14.0,
                        ),
                        hintStyle: TextStyle(
                          color: Colors.grey,
                          fontSize: 10.0,
                        ),
                      ),
                      style: const TextStyle(fontSize: 14.0),
                    ),
                    const SizedBox(height: 1.0),
                    TextFormField(
                      controller: passwordController,
                      obscureText: true,
                      decoration: const InputDecoration(
                        labelText: 'Password',
                        labelStyle: TextStyle(
                          fontSize: 14.0,
                        ),
                        hintStyle: TextStyle(
                          color: Colors.grey,
                          fontSize: 10.0,
                        ),
                      ),
                      style: const TextStyle(fontSize: 14.0),
                    ),
                    const SizedBox(height: 10.0),
                    MaterialButton(
                      onPressed: () {
                        if (!emailController.text.contains('@')) {
                          showToast(
                              message: 'Email address is not valid.',
                              state: ToastStates.ERROR);
                        } else if (passwordController.text.length < 6) {
                          showToast(
                              message:
                                  'Password must be at least 6 characters.',
                              state: ToastStates.ERROR);
                        } else {
                          loginUser(context);
                        }
                      },
                      child: const SizedBox(
                        height: 50.0,
                        child: Center(
                          child: Text(
                            'Login',
                            style: TextStyle(
                              fontSize: 18.0,
                              fontFamily: 'Brand Bold',
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                      color: Colors.yellow,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24.0),
                      ),
                    )
                  ],
                ),
              ),
              TextButton(
                onPressed: () =>
                    navigateAndFinish(context, registerScreenRoute),
                child: RichText(
                  text: TextSpan(
                    text: 'Do not have an Account? ',
                    style: const TextStyle(color: Colors.black),
                    children: [
                      TextSpan(
                        text: 'Register',
                        style: TextStyle(color: Colors.yellow[500]),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
