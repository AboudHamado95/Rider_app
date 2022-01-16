import 'package:flutter/material.dart';
import 'package:rider_app/constants/constants.dart';

class RegistrationScreen extends StatelessWidget {
  const RegistrationScreen({Key? key}) : super(key: key);

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
                child: Column(
                  children: [
                    const SizedBox(height: 1.0),
                    TextFormField(
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
                    const SizedBox(height: 1.0),
                    TextFormField(
                      keyboardType: TextInputType.phone,
                      obscureText: true,
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
                    const SizedBox(height: 10.0),
                    MaterialButton(
                      onPressed: () {},
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
              TextButton(
                onPressed: () => Navigator.pushNamedAndRemoveUntil(
                    context, loginScreenRoute, (route) => false),
                child: const Text(
                  'Already have an Account? Login Here',
                  style: TextStyle(color: Colors.black),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
