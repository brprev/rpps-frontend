import 'package:flutter/material.dart';

import '../../../../core/extensions/sized_box_extension.dart';
import '../../../../core/theme/constants/app_sizes.dart';

class SignInCardWidget extends StatelessWidget {
  const SignInCardWidget({super.key});

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
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextFormField(
                      decoration: const InputDecoration(labelText: 'E-mail'),
                      validator: (value) {},
                    ),
                    VerticalSpace.s24,
                    TextFormField(
                      decoration: const InputDecoration(labelText: 'Senha'),
                      validator: (value) {},
                    ),
                  ],
                ),
              ),
            ),
            VerticalSpace.s24,
            ElevatedButton(
              onPressed: () {},
              child: const Text('Acessar'),
            ),
          ],
        ),
      ),
    );
  }
}
