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
        super(SignInPageState.loaded);

  static SignInCubit get(context) => BlocProvider.of(context);

  late final GlobalKey<FormState> signInFormKey;
  late final TextEditingController emailTextController;
  late final TextEditingController passwordTextController;

  Future<void> onInit() async {
    signInFormKey = GlobalKey<FormState>();
    emailTextController = TextEditingController();
    passwordTextController = TextEditingController();

    emit(SignInPageState.loaded);
  }

  Future<void> onPressedSignIn(BuildContext context) async {
    final isValidForm = _validateSignInForm();
    if (!isValidForm) return;

    emit(SignInPageState.loading);
    final accountEntity = await _signIn(context);

    (accountEntity?.token ?? '').isNotEmpty
        ? emit(SignInPageState.loaded)
        : emit(SignInPageState.loading);
  }

  bool _validateSignInForm() => signInFormKey.currentState?.validate() ?? false;

  Future<AccountEntity?> _signIn(BuildContext context) async {
    AccountEntity? account;

    final params = SignInParams(
      email: emailTextController.text,
      password: passwordTextController.text,
    );

    final result = await _signInUseCase(params);
    result.fold((l) => null, (r) => account = r);

    return account;
  }
}
