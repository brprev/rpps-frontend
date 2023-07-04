import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/routes/routes_manager.dart';
import '../../../../../core/usecases/i_usecase.dart';
import '../../../domain/use_cases/get_login_status.dart';
import '../../../domain/use_cases/sign_in_use_case.dart';

enum SignInPageState { empty, loading, error, loaded }

class SignInCubit extends Cubit<SignInPageState> {
  SignInCubit({
    required GetLoginStatusUseCase getLoginStatusUseCase,
    required SignInUseCase signInUseCase,
  })  : _getLoginStatusUseCase = getLoginStatusUseCase,
        _signInUseCase = signInUseCase,
        super(SignInPageState.loaded);

  final GetLoginStatusUseCase _getLoginStatusUseCase;
  final SignInUseCase _signInUseCase;

  static SignInCubit get(context) => BlocProvider.of(context);

  void onInit(BuildContext context) async {
    emit(SignInPageState.loaded);
  }

  Future<void> onPressedSignIn(
    BuildContext context, {
    required String email,
    required String password,
  }) async {
    emit(SignInPageState.loading);

    await _signIn(email, password).then(
      (signInResult) {
        if (signInResult) _redirectToRoot(context);
      },
    );

    emit(SignInPageState.loaded);
  }

  Future<bool> getLoginStatus() async {
    bool userIsLogged = false;

    const params = NoParams();
    final result = await _getLoginStatusUseCase(params);
    result.fold((l) => null, (r) => userIsLogged = r);

    return userIsLogged;
  }

  Future<bool> _signIn(String email, String password) async {
    bool signInResult = false;

    final params = SignInParams(
      email: email,
      password: password,
    );

    final result = await _signInUseCase(params);
    result.fold((l) => null, (r) => signInResult = r);

    return signInResult;
  }

  void _redirectToRoot(BuildContext context) {
    context.pushReplacement(AppRoutes.rootRoute);
  }
}
