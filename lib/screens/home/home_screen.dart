import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:my_app/widget/auth_service_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  String resetErr = '';

  void logout() async {
    try {
      await authService.value.signOut();
      context.push('/layout');
    } on FirebaseAuthException catch (e) {
      debugPrint(e.message);
    }
  }

  void delete() async {
    try {
      await authService.value.delete(
        email: emailController.text,
        password: passwordController.text,
      );
      context.push('/layout');
    } on FirebaseAuthException catch (e) {
      debugPrint(e.message);
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
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Welcome ${authService.value.currentUser!.displayName ?? "User"}!',
        ),
      ),
      body: Center(
        child: Column(
          children: [
            Container(
              height: 80,
              width: 80,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(40),
                image: DecorationImage(
                  image: NetworkImage(
                    'https://i.pinimg.com/736x/98/1c/7c/981c7c47ab2b7dbd9197b7ffb64c50ec.jpg',
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            TextButton(onPressed: logout, child: Text('Logout')),
            TextButton(
              onPressed: () {
                  context.push('/delete');
              },
              child: Text('Delete User'),
            ),
          ],
        ),
      ),
    );
  }
}
