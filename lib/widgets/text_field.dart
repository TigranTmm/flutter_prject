import 'package:flutter/material.dart';

// Тип поля.
enum InputFieldType {
  name,
  email,
  password,
  confirmPassword,
}

class CustomTextFormField extends StatefulWidget {
  final InputFieldType inputType;

  final String labelText;
  final String hintText;

  final IconData prefixIcon;

  final TextEditingController controller;

  // Нужен для проверки повторного пароля.
  final TextEditingController? passwordController;

  // Определяет кнопку клавиатуры: next или done.
  final TextInputAction textInputAction;

  // Функция, которая может выполниться после Done.
  final VoidCallback? onSubmitted;

  const CustomTextFormField({
    super.key,
    required this.inputType,
    required this.labelText,
    required this.hintText,
    required this.prefixIcon,
    required this.controller,
    this.passwordController,
    this.textInputAction = TextInputAction.next,
    this.onSubmitted,
  });

  @override
  State<CustomTextFormField> createState() =>
      _CustomTextFormFieldState();
}

class _CustomTextFormFieldState
    extends State<CustomTextFormField> {

  bool _hidePassword = true;

  // Проверка введённых данных.
  String? _validator(String? value) {
    // Все поля обязательные.
    if (value == null || value.trim().isEmpty) {
      return 'Поле не может быть пустым';
    }

    switch (widget.inputType) {

    // Проверка ФИО.
      case InputFieldType.name:
        final nameRegExp =
        RegExp(r'^[A-Za-zА-Яа-яЁё\s]+$');

        if (!nameRegExp.hasMatch(value.trim())) {
          return 'ФИО должно содержать только буквы и пробелы';
        }

        break;

    // Проверка email.
      case InputFieldType.email:
        final emailRegExp = RegExp(
          r'^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$',
        );

        if (!emailRegExp.hasMatch(value.trim())) {
          return 'Введите корректный email латиницей';
        }

        break;

    // Проверка пароля.
      case InputFieldType.password:
        final passwordRegExp = RegExp(
          r'^(?=.*[A-Za-z])(?=.*\d)(?=.*[+_-])[A-Za-z\d+_-]{6,}$',
        );

        if (!passwordRegExp.hasMatch(value)) {
          return 'Минимум 6 символов: латинская буква, цифра и +, _ или -';
        }

        break;

    // Проверка повторного пароля.
      case InputFieldType.confirmPassword:
        if (value != widget.passwordController?.text) {
          return 'Пароли не совпадают';
        }

        break;
    }

    // null означает, что ошибок нет.
    return null;
  }

  @override
  Widget build(BuildContext context) {
    // Парольными считаем сразу два типа полей.
    final bool isPassword =
        widget.inputType == InputFieldType.password ||
            widget.inputType == InputFieldType.confirmPassword;

    return TextFormField(
      controller: widget.controller,

      // Скрываем текст только у паролей.
      obscureText: isPassword && _hidePassword,

      keyboardType:
      widget.inputType == InputFieldType.email
          ? TextInputType.emailAddress
          : TextInputType.text,

      textInputAction: widget.textInputAction,

      // После нажатия Next переходим к следующему полю.
      onFieldSubmitted: (_) {
        if (widget.textInputAction == TextInputAction.next) {
          FocusScope.of(context).nextFocus();
        } else {
          FocusScope.of(context).unfocus();
          widget.onSubmitted?.call();
        }
      },

      decoration: InputDecoration(
        labelText: widget.labelText,
        hintText: widget.hintText,

        // Иконка слева.
        prefixIcon: Icon(widget.prefixIcon),

        // Для пароля справа появляется глаз.
        suffixIcon: isPassword
            ? IconButton(
          icon: Icon(
            _hidePassword
                ? Icons.visibility
                : Icons.visibility_off,
          ),
          onPressed: () {
            setState(() {
              _hidePassword = !_hidePassword;
            });
          },
        )
            : null,

        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
        ),

        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(
            color: Colors.grey,
          ),
        ),

        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(
            color: Colors.blue,
            width: 2,
          ),
        ),

        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(
            color: Colors.red,
            width: 2,
          ),
        ),
      ),

      // Подключаем нашу функцию проверки.
      validator: _validator,

      // После взаимодействия ошибка обновляется автоматически.
      autovalidateMode:
      AutovalidateMode.onUserInteraction,
    );
  }
}