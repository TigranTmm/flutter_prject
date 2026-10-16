import 'package:flutter/material.dart';

import '../widgets/text_field.dart';

class ProfilePage extends StatefulWidget {
  final String name;
  final String email;

  const ProfilePage({
    super.key,
    this.name = 'Иванов Иван Иванович',
    this.email = 'test123@mail.ru',
  });

  @override
  State<ProfilePage> createState() =>
      _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {

  final _formKey = GlobalKey<FormState>();

  late final TextEditingController _nameController;
  late final TextEditingController _emailController;

  final _passwordController =
  TextEditingController(text: 'abc_123');

  final _confirmPasswordController =
  TextEditingController(text: 'abc_123');

  @override
  void initState() {
    super.initState();

    _nameController =
        TextEditingController(text: widget.name);

    _emailController =
        TextEditingController(text: widget.email);
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();

    super.dispose();
  }

  void _save() {
    if (_formKey.currentState?.validate() ?? false) {
      FocusScope.of(context).unfocus();

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'Данные профиля сохранены',
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Профиль',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(28),

          child: Form(
            key: _formKey,

            child: Column(
              crossAxisAlignment:
              CrossAxisAlignment.stretch,

              children: [
                Center(
                  child: CircleAvatar(
                    radius: 60,
                    backgroundImage: AssetImage(
                      'assets/images/profile.png',
                    ),
                  ),
                ),

                const SizedBox(height: 30),

                CustomTextFormField(
                  inputType: InputFieldType.name,
                  labelText: 'ФИО',
                  hintText: 'Введите ФИО',
                  prefixIcon: Icons.person_outline,
                  controller: _nameController,
                  textInputAction:
                  TextInputAction.next,
                ),

                const SizedBox(height: 16),

                CustomTextFormField(
                  inputType: InputFieldType.email,
                  labelText: 'Email',
                  hintText: 'example@mail.com',
                  prefixIcon: Icons.email_outlined,
                  controller: _emailController,
                  textInputAction:
                  TextInputAction.next,
                ),

                const SizedBox(height: 16),

                CustomTextFormField(
                  inputType:
                  InputFieldType.password,
                  labelText: 'Пароль',
                  hintText: 'Введите новый пароль',
                  prefixIcon: Icons.security,
                  controller: _passwordController,
                  textInputAction:
                  TextInputAction.next,
                ),

                const SizedBox(height: 16),

                CustomTextFormField(
                  inputType:
                  InputFieldType.confirmPassword,
                  labelText: 'Повторите пароль',
                  hintText: 'Повторите пароль',
                  prefixIcon: Icons.security,
                  controller:
                  _confirmPasswordController,
                  passwordController:
                  _passwordController,
                  textInputAction:
                  TextInputAction.done,
                  onSubmitted: _save,
                ),

                const SizedBox(height: 30),

                SizedBox(
                  height: 50,
                  child: ElevatedButton(
                    onPressed: _save,
                    child: const Text(
                      'Сохранить',
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}