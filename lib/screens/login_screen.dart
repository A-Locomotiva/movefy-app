// ignore_for_file: invalid_return_type_for_catch_error

import 'package:flutter/material.dart';
import 'home_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

//------------------------------------------------------------------------------
//ESTA FUNÇÃO DEVE SER PORTADO PARA O CODIGO NA PASTA SERVICES FUTURAMENTE
  Future<void> _login() async {
if (_emailController.text.trim().isNotEmpty && 
    _passwordController.text.trim().isNotEmpty) {
  
  final userCredential = await _auth.signInWithEmailAndPassword(
    email: _emailController.text.trim(),
    password: _passwordController.text.trim(),
  ).catchError((error) => null); 

  // ignore: unnecessary_null_comparison
  if (userCredential != null) {

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => FeedScreen()),
    );
  } else {

      Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => FeedScreen()),
    );
  }
}
//-----------------------------------------------------
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: _emailController,
                decoration: InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.emailAddress,
              ),
              SizedBox(height: 20),
              TextField(
                controller: _passwordController,
                decoration: InputDecoration(
                  labelText: 'Password',
                  border: OutlineInputBorder(),
                ),
                obscureText: true,
              ),
              SizedBox(height: 30),
              ElevatedButton(
                onPressed: _login,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.teal,
                  foregroundColor: Colors.white,
                  padding: EdgeInsets.symmetric(vertical: 14, horizontal: 80),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: Text('Login'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}