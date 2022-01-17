import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:rider_app/components/components.dart';
import 'package:rider_app/constants/constants.dart';
import 'package:rider_app/main.dart';

class RegistrationScreen extends StatelessWidget {
  RegistrationScreen({Key? key}) : super(key: key);
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  final firebaseAuth = FirebaseAuth.instance;
  registerNewUser(context) async {
    await firebaseAuth
        .createUserWithEmailAndPassword(
            email: emailController.text, password: passwordController.text)
        .then((value) {
      Map userDataMap = {
        'name': nameController.text.trim(),
        'email': emailController.text.trim(),
        'phone': phoneController.text.trim(),
      };
      userRef.child(value.user!.uid).set(userDataMap);
      showToast(
          message: 'congratulations, your account has been created.',
          state: ToastStates.SUCCESS);
      navigateAndFinish(context, homeRoute);
    }).catchError((error) {
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
              // const SizedBox(
              //   height: 10.0,
              // ),
              const Image(
                image: AssetImage('assets/images/logo.png'),
                width: 390.0,
                height: 250.0,
                alignment: Alignment.center,
              ),
              const SizedBox(height: 1.0),
              const Text(
                'Register as a Rider',
                style: TextStyle(fontSize: 24.0, fontFamily: 'Brand Bold'),
                textAlign: TextAlign.center,
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Form(
                  child: Column(
                    children: [
                      const SizedBox(height: 1.0),
                      TextFormField(
                        controller: nameController,
                        keyboardType: TextInputType.emailAddress,
                        decoration: const InputDecoration(
                          labelText: 'Name',
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
                        controller: phoneController,
                        keyboardType: TextInputType.phone,
                        decoration: const InputDecoration(
                          labelText: 'Phone',
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
                          if (nameController.text.length < 4) {
                            showToast(
                                message: 'Name must be at least 4 characters.',
                                state: ToastStates.ERROR);
                          } else if (!emailController.text.contains('@')) {
                            showToast(
                                message: 'Email address is not valid.',
                                state: ToastStates.ERROR);
                          } else if (phoneController.text.isEmpty) {
                            showToast(
                                message: 'Phone number is mandatory.',
                                state: ToastStates.ERROR);
                          } else if (passwordController.text.length < 6) {
                            showToast(
                                message: 'Password must be at least 6 characters.',
                                state: ToastStates.ERROR);
                          } else {
                            registerNewUser(context);
                          }
                        },
                        child: const SizedBox(
                          height: 50.0,
                          child: Center(
                            child: Text(
                              'Create Account ',
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
              ),
              TextButton(
                onPressed: () => navigateAndFinish(context, loginScreenRoute),
                child: RichText(
                  text: TextSpan(
                    text: 'Already have an Account? ',
                    style: const TextStyle(color: Colors.black),
                    children: [
                      TextSpan(
                        text: 'Login Here',
                        style: TextStyle(color: Colors.yellow[500]),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
