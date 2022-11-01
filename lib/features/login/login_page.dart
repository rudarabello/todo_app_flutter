import 'package:todo_app_flutter/features/login/login_controller.dart';
import 'package:todo_app_flutter/features/login/login_states.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  static const routeName = '/login';
  LoginPage({Key? key}) : super(key: key);
  final controller = LoginController();
  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: kToolbarHeight),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Spacer(),
                  const SizedBox(width: 8),
                  Text('',
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.headline5),
                  const Spacer(),
                ],
              ),
              const SizedBox(height: 100),
              const SizedBox(height: 16),
              TextFormField(
                validator: (value) {
                  if (value?.isEmpty ?? true) {
                    return 'Email obrigatório';
                  }
                  return null;
                },
                controller: emailController,
                decoration: const InputDecoration(
                  hintText: 'Email',
                ),
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: passwordController,
                decoration: InputDecoration(
                  hintText: 'Senha',
                  suffixIcon: IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.visibility_off),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Text('Recuperar senha',
                        style: Theme.of(context).textTheme.subtitle1),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () async {
                    final navigator = Navigator.of(context);
                    if (_formKey.currentState?.validate() ?? false) {
                      final result = await controller.login(
                        emailController.text,
                        passwordController.text,
                      );
                      if (result is LoginStateError) {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: const Text('Ops, algo deu errado'),
                              content: Center(
                                child: Text(result.error),
                              ),
                            );
                          },
                        );
                      }
                      if (result is LoginStateSuccess) {
                        navigator.pushReplacementNamed('home');
                      }
                    }
                  },
                  child: const Text('Entrar'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SocialButton extends StatelessWidget {
  final String text;
  final String imagePath;
  final VoidCallback onPressed;

  const SocialButton({
    Key? key,
    required this.imagePath,
    required this.text,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            imagePath,
            color: const Color(0xFFFFC82C),
            height: 32,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              text,
              style: const TextStyle(
                color: Color(0xFFFFC82C),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
