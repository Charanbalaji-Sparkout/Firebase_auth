import 'package:go_router/go_router.dart';
import 'package:my_app/screens/delete/delete_screen.dart';
import 'package:my_app/screens/home/home_screen.dart';
import 'package:my_app/screens/login/login_screen.dart';
import 'package:my_app/screens/register/register_screen.dart';
import 'package:my_app/screens/reset/reset_screen.dart';
import 'package:my_app/widget/auth_layout_widget.dart';

final GoRouter router = GoRouter(
  initialLocation: '/layout',
  routes: [
    GoRoute(path: '/', builder: (context, state) => const LoginScreen()),
    GoRoute(path: '/layout',builder: (context, state) => AuthLayoutWidget(),),
    GoRoute(path: '/home', builder: (context, state) => HomeScreen()),
    GoRoute(
      path: '/register',
      builder: (context, state) => const RegisterScreen(),
    ),
    GoRoute(path: '/reset', builder: (context, state) => const ResetScreen()),
    GoRoute(path: '/delete',builder: (context, state) => DeleteScreen(),)
  ],
);
