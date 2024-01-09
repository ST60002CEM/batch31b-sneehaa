import 'dart:io';


import 'package:bookaway/features/auth/domain/entity/auth_entity.dart';
import 'package:bookaway/features/auth/domain/use_cases/register_usecase.dart';
import 'package:bookaway/features/auth/domain/use_cases/upload_image_usecase.dart';
import 'package:bookaway/features/auth/presentation/state/auth_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


final authViewModelProvider = StateNotifierProvider<AuthViewModel, AuthState>(
  (ref) => AuthViewModel(
    ref.read(registerUseCaseProvider),
    ref.read(uploadImageUseCaseProvider),
  ),
);

class AuthViewModel extends StateNotifier<AuthState> {
  final RegisterUseCase _registerUseCase;
  final UploadImageUseCase _uploadImageUsecase;

  AuthViewModel(
    this._registerUseCase,
    this._uploadImageUsecase,
  ) : super(AuthState.initial());

  Future<void> uploadImage(File? file) async {
    state = state.copyWith(isLoading: true);
    var data = await _uploadImageUsecase.uploadProfilePicture(file!);
    data.fold(
      (l) {
        state = state.copyWith(isLoading: false, error: l.error);
      },
      (imageName) {
        state = state.copyWith(
          isLoading: false,
          error: null,
          imageName: imageName,
        );
      },
    );
  }

  Future<void> registerUser(AuthEntity entity) async {
    state = state.copyWith(isLoading: true);
    final result = await _registerUseCase.registerUser(entity);
    state = state.copyWith(isLoading: false);
    result.fold(
      (failure) => state = state.copyWith(error: failure.error),
      (success) => state = state.copyWith(isLoading: false, showMessage: true),
    );

    resetMessage();
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
