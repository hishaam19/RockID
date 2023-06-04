import 'package:flutter/material.dart';
import 'package:rockid/components/my_button.dart';
import 'package:rockid/components/my_textfield.dart';
import '../components/square_tile.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  //text editing controllers
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  void signUserIn() {}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 50),

          const Icon(
            Icons.lock,
            size: 100),

          const SizedBox(height: 50),

          const Text(
            'Welcome back you\'ve been missed',
            style: TextStyle(
              color: Colors.grey,
              fontSize: 16
            ),
          ),

          const SizedBox(height: 50),

          //username textfield
          MyTextField(
            controller: usernameController,
            hintText: 'Username',
            obscureText: false,
          ),

          //password textfield
          MyTextField(
            controller: passwordController,
            hintText: 'Password',
            obscureText: true,
          ),

          const SizedBox(height: 10,),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  'Forgot Password?',
                  style: TextStyle(color: Colors.grey[600]),),
              ],
            ),
          ),

          const SizedBox(height: 25),

          MyButton(
            onTap: signUserIn,
          ),

          const SizedBox(height: 50),

          Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Divider(
                        thickness: 0.5,
                        color: Colors.grey[400],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Text(
                        'Or continue with',
                        style: TextStyle(color: Colors.grey[700]),
                      ),
                    ),
                    Expanded(
                      child: Divider(
                        thickness: 0.5,
                        color: Colors.grey[400],
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 50),

              
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  // google button
                  SquareTile(imagePath: 'lib/images/google_logo.png'),

                  SizedBox(width: 25),

                  // facebook button
                  SquareTile(imagePath: 'lib/images/facebook_logo.png')
                ],
              ),

          const SizedBox(height: 50),

          Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Not a member?',
                    style: TextStyle(color: Colors.grey[700]),
                  ),
                  const SizedBox(width: 4),
                  const Text(
                    'Register now',
                    style: TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
          ),
      ],)
      )
    );
  }
}