import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/injection_container.dart';
import '../bloc/signup/signup_bloc.dart';



class SignupPage extends StatelessWidget {
  const SignupPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<SignupBloc>(),
      child:  SignupView(),
    );
  }
}

class SignupView extends StatefulWidget {
  const SignupView({super.key});
  @override
  State<SignupView> createState() => _SignupViewState();
}

class _SignupViewState extends State<SignupView> {

  final _fromKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  void _handleSignup() {
    if (_fromKey.currentState!.validate()) {
      context.read<SignupBloc>().add(
        SignupButtonPressed(name: _nameController.text.trim(),
            email: _emailController.text.trim(),
            password: _passwordController.text)
      );
    }
  }



  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
