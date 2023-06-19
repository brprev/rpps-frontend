import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/entities/account_entity.dart';
import '../../../domain/use_cases/sign_in_use_case.dart';

enum SignInPageState { empty, loading, error, loaded }

class SignInCubit extends Cubit<SignInPageState> {
  final SignInUseCase _signInUseCase;

  SignInCubit({
    required SignInUseCase signInUseCase,
  })  : _signInUseCase = signInUseCase,
        super(SignInPageState.empty);

  static SignInCubit get(context) => BlocProvider.of(context);

  late final GlobalKey<FormState> signInFormKey;
  late final TextEditingController emailTextController;
  late final TextEditingController passwordTextController;

  Future<void> onInit() async {
    emit(SignInPageState.empty);

    signInFormKey = GlobalKey<FormState>();
    emailTextController = TextEditingController();
    passwordTextController = TextEditingController();
  }

  Future<AccountEntity> signIn() async {
    final params = SignInParams(
      email: emailTextController.text,
      password: passwordTextController.text,
    );

    final result = await _signInUseCase(params);

    return const AccountEntity(email: '', token: '', name: '');
  }
}
