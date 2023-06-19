import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/extensions/sized_box_extension.dart';
import '../../widgets/sign_in_card_widget.dart';
import 'sign_in_cubit.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: BlocBuilder<SignInCubit, SignInPageState>(
          builder: (context, state) {
            final pageState = <SignInPageState, Widget>{
              SignInPageState.empty: const Icon(Icons.question_mark),
              SignInPageState.error: const Icon(Icons.close),
              SignInPageState.loading: const CircularProgressIndicator(),
              SignInPageState.loaded: Column(
                mainAxisSize: MainAxisSize.min,
                children: const [
                  Text('Login'), // TODO: text theme manager
                  VerticalSpace.s48,
                  SignInCardWidget(),
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
