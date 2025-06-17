import 'package:atendimento/src/modules/auth/login/login_controller.dart';
import 'package:atendimento/src/utils/routes.dart';
import 'package:core/clinicas_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_getit/flutter_getit.dart';
import 'package:signals_flutter/signals_flutter.dart';
import 'package:validatorless/validatorless.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with MessageViewMixin {
  final formKey = GlobalKey<FormState>();
  final emailEC = TextEditingController();
  final passwordEC = TextEditingController();
  final controller = Injector.get<LoginController>();

  @override
  void initState() {
    messageListenerMessages(stateMixin: controller);
    effect(() => controller.logged
        ? Navigator.of(context).pushReplacementNamed(home)
        : null);
    super.initState();
  }

  @override
  void dispose() {
    emailEC.dispose();
    passwordEC.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final sizeOf = MediaQuery.sizeOf(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          constraints: BoxConstraints(
            minHeight: sizeOf.height,
          ),
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                'assets/images/background_login.png',
              ),
              fit: BoxFit.cover,
            ),
          ),
          child: Center(
            child: Container(
              padding: const EdgeInsets.all(40),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(
                  Radius.circular(16),
                ),
              ),
              constraints: BoxConstraints(
                maxWidth: sizeOf.width * .8,
              ),
              child: Form(
                key: formKey,
                child: Column(
                  children: [
                    const Text(
                      'Login',
                      style: ClinicasTheme.titleStyle,
                    ),
                    const SizedBox(
                      height: 32,
                    ),
                    TextFormField(
                      controller: emailEC,
                      validator: Validatorless.multiple([
                        Validatorless.required('Email obrigatório'),
                        Validatorless.email('Email inválido'),
                      ]),
                      decoration: const InputDecoration(
                        label: Text('E-Mail'),
                      ),
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    Watch(
                      (_) => TextFormField(
                        obscureText: controller.obscurePassword,
                        controller: passwordEC,
                        validator: Validatorless.multiple([
                          Validatorless.required('Password obrigatório'),
                        ]),
                        decoration: InputDecoration(
                          label: const Text('Password'),
                          suffix: IconButton(
                            onPressed: () {
                              controller.passwordToggle();
                            },
                            icon: controller.obscurePassword
                                ? const Icon(Icons.visibility)
                                : const Icon(Icons.visibility_off),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 32,
                    ),
                    SizedBox(
                      width: sizeOf.width * .8,
                      height: 48,
                      child: ElevatedButton(
                        onPressed: () {
                          //$ para teste
                          controller.login(
                            emailEC.text,
                            passwordEC.text,
                          );
                          if (formKey.currentState?.validate() ?? false) {
                            controller.login(
                              emailEC.text,
                              passwordEC.text,
                            );
                          }
                        },
                        child: const Text('Entrar'),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
