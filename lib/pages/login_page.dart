import 'package:flutter/material.dart';

import '../widgets/text_field.dart';
import 'profile_page.dart';
import 'register_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  // Ключ позволяет обратиться к состоянию Form.
  final _formKey = GlobalKey<FormState>();

  // Контроллеры хранят введённый пользователем текст.
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    // Контроллеры необходимо освобождать.
    _emailController.dispose();
    _passwordController.dispose();

    super.dispose();
  }

  void _login() {
    // validate() запускает validator у всех TextFormField.
    if (_formKey.currentState?.validate() ?? false) {

      // Снимаем фокус и закрываем клавиатуру.
      FocusScope.of(context).unfocus();

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ProfilePage(
            email: _emailController.text,
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(28),

          child: Form(
            key: _formKey,

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,

              children: [
                const Spacer(),

                const Text(
                  'Добро пожаловать!',
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 6),

                const Text(
                  'Войдите в свой аккаунт\nили создайте новый',
                  style: TextStyle(fontSize: 16),
                ),

                const SizedBox(height: 35),

                CustomTextFormField(
                  inputType: InputFieldType.email,
                  labelText: 'Email',
                  hintText: 'example@mail.com',
                  prefixIcon: Icons.email_outlined,
                  controller: _emailController,
                  textInputAction: TextInputAction.next,
                ),

                const SizedBox(height: 16),

                CustomTextFormField(
                  inputType: InputFieldType.password,
                  labelText: 'Пароль',
                  hintText: 'Введите пароль',
                  prefixIcon: Icons.security,
                  controller: _passwordController,
                  textInputAction: TextInputAction.done,
                  onSubmitted: _login,
                ),

                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {},
                    child: const Text(
                      'Забыли пароль?',
                    ),
                  ),
                ),

                const SizedBox(height: 15),

                SizedBox(
                  height: 50,
                  child: ElevatedButton(
                    onPressed: _login,
                    child: const Text(
                      'Войти',
                    ),
                  ),
                ),

                const Spacer(),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Нет аккаунта? ',
                    ),

                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                            const RegisterPage(),
                          ),
                        );
                      },
                      child: const Text(
                        'Зарегистрируйтесь',
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}