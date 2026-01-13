import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:my_app/widget/auth_service_widget.dart';

class DeleteScreen extends StatefulWidget {
  const DeleteScreen({super.key});

  @override
  State<DeleteScreen> createState() => _DeleteScreenState();
}

class _DeleteScreenState extends State<DeleteScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  String deleteErr = '';
  void delete() async {
    try {
      await authService.value.delete(
        email: emailController.text,
        password: passwordController.text,
      );
      context.pop();
    } on FirebaseAuthException catch (e) {
      setState(() {
        deleteErr = e.message ?? "Unexpected error occurred";
      });
    }
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final email = emailController.text.trim();
    final password = passwordController.text.trim();

    return Scaffold(
      appBar: AppBar(title: const Text('Delete User')),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 80),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextField(
                    controller: emailController,
                    decoration: const InputDecoration(
                      labelText: 'Enter Email',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(height: 10),
                  TextField(
                    controller: passwordController,
                    decoration: const InputDecoration(
                      labelText: 'Enter Password',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(height: 10),
                  //Error Text
                  Text(deleteErr,style: TextStyle(color: Colors.red),),

                  SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        delete();
                      });
                    },
                    child: const Text('Delete'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}