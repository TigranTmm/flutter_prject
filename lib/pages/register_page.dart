import 'package:flutter/material.dart';

import '../widgets/text_field.dart';
import 'profile_page.dart';
import '../routes.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() =>
      _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {

  final _formKey = GlobalKey<FormState>();

  final _nameController =
  TextEditingController();

  final _emailController =
  TextEditingController();

  final _passwordController =
  TextEditingController();

  final _confirmPasswordController =
  TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();

    super.dispose();
  }

  void _register() {
    if (_formKey.currentState?.validate() ??
        false) {

      FocusScope.of(context).unfocus();

      // Возвращаемся на экран входа.
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),

      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(28),

          child: Form(
            key: _formKey,

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,

              children: [
                const Text(
                  'Регистрация',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 35),

                CustomTextFormField(
                  inputType: InputFieldType.name,
                  labelText: 'ФИО',
                  hintText: 'Иванов Иван Иванович',
                  prefixIcon: Icons.person_outline,
                  controller: _nameController,
                  textInputAction: TextInputAction.next,
                ),

                const SizedBox(height: 16),

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
                  hintText: 'Не менее 6 символов',
                  prefixIcon: Icons.security,
                  controller: _passwordController,
                  textInputAction: TextInputAction.next,
                ),

                const SizedBox(height: 16),

                CustomTextFormField(
                  inputType:
                  InputFieldType.confirmPassword,
                  labelText: 'Повторите пароль',
                  hintText: 'Введите пароль ещё раз',
                  prefixIcon: Icons.security,
                  controller:
                  _confirmPasswordController,
                  passwordController:
                  _passwordController,
                  textInputAction:
                  TextInputAction.done,
                  onSubmitted: _register,
                ),

                const SizedBox(height: 30),

                SizedBox(
                  height: 50,
                  child: ElevatedButton(
                    onPressed: _register,
                    child: const Text(
                      'Зарегистрироваться',
                    ),
                  ),
                ),

                const SizedBox(height: 25),

                Row(
                  mainAxisAlignment:
                  MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Уже есть аккаунт? ',
                    ),

                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text(
                        'Войдите',
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