import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:word_stock_2026/core/error/failure.dart';
import 'package:word_stock_2026/presentation/auth/auth_state.dart';
import 'package:word_stock_2026/core/di/auth_providers.dart';

part 'sign_up_view_model.g.dart';

@riverpod
class SignUpViewModel extends _$SignUpViewModel {
  @override
  AuthState build() => AuthState.initial();

  Future<void> signUp({
    required String email,
    required String password,
  }) async {
    state = state.copyWith(isLoading: true, isSuccess: false, errorMessage: null);
    final result = await ref
        .read(signUpUseCaseProvider)
        .call(email: email, password: password);
    result.fold(
      (failure) => state = state.copyWith(
        isLoading: false,
        errorMessage: failure.when(
          network: () => '通信エラーが発生しました',
          auth: () => 'このメールアドレスはすでに使用されています',
          notFound: () => 'エラーが発生しました',
          unknown: (msg) => 'エラーが発生しました: $msg',
        ),
      ),
      (_) => state = state.copyWith(isLoading: false, isSuccess: true),
    );
  }

  void resetState() => state = AuthState.initial();
}
