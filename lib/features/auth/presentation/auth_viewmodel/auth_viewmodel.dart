import 'package:bookaway/features/auth/domain/use_cases/login_usecase.dart';
import 'package:bookaway/features/auth/domain/use_cases/register_usecase.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


import '../../../../config/routes/app_route.dart';
import '../../domain/entity/auth_entity.dart';

import '../state/auth_state.dart';

final authViewModelProvider = StateNotifierProvider<AuthViewModel, AuthState>(
  (ref) => AuthViewModel(
      ref.read(registerUseCaseProvider), ref.read(loginUseCaseProvider)),
);

class AuthViewModel extends StateNotifier<AuthState> {
  final RegisterUseCase _registerUseCase;
  final LoginUseCase _loginUseCase;

  AuthViewModel(this._registerUseCase, this._loginUseCase)
      : super(AuthState.initial());

  Future<void> registerUser(AuthEntity entity, BuildContext context) async {
    state = state.copyWith(isLoading: true);
    final result = await _registerUseCase.registerUser(entity);
    state = state.copyWith(isLoading: false);

    result.fold(
      (failure) {
        state = state.copyWith(error: failure.error);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(failure.error),
            duration: const Duration(seconds: 2),
          ),
        );
      },
      (success) {
        if (success) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('User Registered Successfully'),
              duration: Duration(seconds: 2),
            ),
          );
          Future.delayed(const Duration(seconds: 2), () {
            Navigator.pushReplacementNamed(context, AppRoute.loginRoute);
          });
        } else {}
      },
    );
  }

  //Login Staff

  Future<void> loginUser(
      String username, String password, BuildContext context) async {
    state = state.copyWith(isLoading: true);
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    final result = await _loginUseCase.loginUser(username, password);
    state = state.copyWith(isLoading: false);

    result.fold(
      (failure) {
        state = state.copyWith(
          error: failure.error,
          showMessage: true,
        );
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(failure.error),
            duration: const Duration(seconds: 2),
          ),
        );
      },
      (success) {
        if (success) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Login Successful'),
              duration: Duration(seconds: 2),
            ),
          );
          Future.delayed(const Duration(seconds: 2), () {
            Navigator.pushReplacementNamed(context, AppRoute.homeRoute);
          });
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Invalid username or password'),
              duration: Duration(seconds: 2),
            ),
          );
        }
      },
    );
  }

  void reset() {
    state = state.copyWith(
      isLoading: false,
      error: null,
      imageName: null,
      showMessage: false,
    );
  }

  void resetMessage(bool value) {
    state = state.copyWith(showMessage: value);
  }
}