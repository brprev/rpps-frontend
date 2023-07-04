import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/extensions/context_extension.dart';
import '../../../../../core/extensions/sized_box_extension.dart';
import '../../widgets/sign_in_card_widget.dart';
import 'sign_in_cubit.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  late final TextEditingController emailTextController;
  late final TextEditingController passwordTextController;
  late final GlobalKey<FormState> signInFormKey;

  @override
  void initState() {
    super.initState();
    signInFormKey = GlobalKey<FormState>();
    emailTextController = TextEditingController();
    passwordTextController = TextEditingController();
  }

  @override
  void dispose() async {
    emailTextController.dispose();
    passwordTextController.dispose();
    super.dispose();
  }

  bool _validateSignInForm() {
    return signInFormKey.currentState?.validate() ?? false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: BlocBuilder<SignInCubit, SignInPageState>(
          builder: (context, state) {
            final cubit = SignInCubit.get(context);

            final pageState = <SignInPageState, Widget>{
              SignInPageState.empty: const Icon(Icons.question_mark),
              SignInPageState.error: const Icon(Icons.close),
              SignInPageState.loading: const CircularProgressIndicator(),
              SignInPageState.loaded: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('Login', style: context.displayLarge),
                  VerticalSpace.s48,
                  SignInCardWidget(
                    signInFormKey: signInFormKey,
                    emailController: emailTextController,
                    passwordController: passwordTextController,
                    onSubmit: () {
                      final isValidForm = _validateSignInForm();
                      if (!isValidForm) return;

                      cubit.onPressedSignIn(
                        context,
                        email: emailTextController.text,
                        password: passwordTextController.text,
                      );
                    },
                  ),
                ],
              ),
            };

            return pageState[state] ?? const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}
