import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/logpage_bloc.dart';
import '../log_page.dart';

class InputForm extends StatefulWidget {
  final LogpageBloc logpageBloc;
  const InputForm({super.key, required this.logpageBloc});

  @override
  State<InputForm> createState() => _InputFormState();
}

class _InputFormState extends State<InputForm> {
  final TextEditingController _loginController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _loginController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 400,
      child: Column(
        children: [
          // username textfield
          DataTextField(
            controller: _loginController,
            hintText: 'Почта',
            obscureText: false,
          ),
          const SizedBox(height: 10),

          // password textfield
          DataTextField(
            controller: _passwordController,
            hintText: 'Пароль',
            obscureText: true,
          ),

          const SizedBox(height: 25),

          // sign in button

          SizedBox(
            height: 40,
            child: BlocBuilder<LogpageBloc, LogpageState>(
              bloc: widget.logpageBloc,
              builder: (context, state) {
                if (state is LoginLoading) {
                  return const ElevatedButton(
                    onPressed: null,
                    child: SizedBox(
                      height: 20,
                      width: 20,
                      child: CircularProgressIndicator(
                        strokeWidth: 3,
                      ),
                    ),
                  );
                }

                return ElevatedButton(
                  child: const Text(
                    'Войти',
                    style: TextStyle(
                      // color: backgroundColor,
                      fontWeight: FontWeight.bold,
                      // fontSize: fontSize20,
                    ),
                  ),
                  onPressed: () {
                    widget.logpageBloc
                        .add(SignInUser(email: _loginController.text, password: _passwordController.text));
                  },
                );
              },
            ),
          ),

          // not a member? register now
        ],
      ),
    );
  }
}
