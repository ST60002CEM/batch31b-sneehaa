import 'package:bookaway/config/routes/app_route.dart';
import 'package:bookaway/features/auth/domain/entity/auth_entity.dart';
import 'package:bookaway/features/auth/domain/use_cases/login_usecase.dart';
import 'package:bookaway/features/auth/domain/use_cases/register_usecase.dart';
import 'package:bookaway/features/auth/presentation/state/auth_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final authViewModelProvider =
    StateNotifierProvider<AuthViewModel, AuthState>((ref) {
  return AuthViewModel(
    ref.read(registerUseCaseProvider), ref.read(loginUseCaseProvider)
  );
});

class AuthViewModel extends StateNotifier<AuthState> {
  final RegisterUseCase registerUseCase;
  final LoginUseCase loginUseCase;

  AuthViewModel(this.registerUseCase, this.loginUseCase) : super(AuthState.initial());

  Future<void> register(AuthEntity authEntity) async {
    state = state.copyWith(isLoading: true);
    final result = await registerUseCase.registerUser(authEntity);
    state = state.copyWith(isLoading: false);
    result.fold(
      (failure) => state = state.copyWith(error: failure.error),
      (success) => state = state.copyWith(isLoading: false, showMessage: true),
    );
    resetMessage();
  }
  
  Future<void> loginUser(
      BuildContext context, String email, String password) async {
    state = state.copyWith(isLoading: true);
    final result = await loginUseCase.loginUser(email, password);
    state = state.copyWith(isLoading: false);
    result.fold(
      (failure) => state = state.copyWith(
        error: failure.error,
        showMessage: true,
      ),
      (success) {
        state = state.copyWith(
          isLoading: false,
          showMessage: true,
          error: null,
        );
        Navigator.popAndPushNamed(context, AppRoute.homepageRoute);
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

  void resetMessage() {
    state = state.copyWith(
        showMessage: false, imageName: null, error: null, isLoading: false);
  }
}