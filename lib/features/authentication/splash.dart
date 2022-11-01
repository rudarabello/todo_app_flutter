import 'package:todo_app_flutter/features/authentication/splash_controller.dart';
import 'package:todo_app_flutter/features/authentication/splash_states.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  final controller = SplashController();

  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 8)).then((value) {
      controller.isAuthenticated().then((value) {
        if (value is SplashStateAuthenticated) {
          Navigator.of(context).pushReplacementNamed('home');
        } else {
          Navigator.of(context).pushReplacementNamed('login');
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final innerHeight = size.height * 0.10;

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: innerHeight),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Text(
                'Todo Do App',
                textAlign: TextAlign.center,
                style: Theme.of(context)
                    .textTheme
                    .headline4
                    ?.apply(fontSizeFactor: 0.8),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
