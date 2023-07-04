import 'package:flutter/material.dart';

import '../../../../core/extensions/sized_box_extension.dart';
import '../../../../core/helpers/validators.dart';
import '../../../../core/theme/constants/app_sizes.dart';
import '../../../../core/widgets/atoms/button_widget.dart';

class SignInCardWidget extends StatelessWidget {
  const SignInCardWidget({
    super.key,
    required this.signInFormKey,
    required this.emailController,
    required this.passwordController,
    required this.onSubmit,
  });

  final GlobalKey<FormState> signInFormKey;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final VoidCallback onSubmit;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: AppSizes.s24,
      child: Padding(
        padding: const EdgeInsets.all(AppSizes.s88),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              width: AppSizes.s360,
              child: Form(
                key: signInFormKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextFormField(
                      decoration: const InputDecoration(
                        labelText: 'E-mail',
                        helperText: '',
                      ),
                      controller: emailController,
                      validator: Validators.email,
                    ),
                    VerticalSpace.s16,
                    TextFormField(
                      decoration: const InputDecoration(
                        labelText: 'Senha',
                        helperText: '',
                      ),
                      controller: passwordController,
                      validator: Validators.password,
                      obscureText: true,
                    ),
                  ],
                ),
              ),
            ),
            VerticalSpace.s32,
            SizedBox(
              width: AppSizes.s360,
              height: AppSizes.s48,
              child: ButtonWidget.success(
                text: 'Acessar',
                onPressed: onSubmit,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
