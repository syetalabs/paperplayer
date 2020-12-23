import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:paperplayer/data/repositories/login_repository.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final AuthRepository _authRepository;
  LoginCubit(this._authRepository) : super(LoginInitial());

  Future<void> login(String email) async {
    try {
      emit(LoginLoading());
      bool isLoggedIn = await _authRepository.isLoggedIn();
      print(isLoggedIn);
      if (isLoggedIn) {
        emit(LoggedIn(_authRepository.userId));
      } else {
        await _authRepository.login(email);
        emit(LoggedIn(_authRepository.userId));
      }
    } catch (error) {
      emit(LoginError(error.toString()));
    }
  }

  Future<void> autoLogin() async {
    try {
      emit(LoginLoading());
      bool isLoggedIn = await _authRepository.isLoggedIn();
      print(isLoggedIn);
      if (isLoggedIn) {
        emit(LoggedIn(_authRepository.userId));
      } else {
        emit(LoginInitial());
      }
    } catch (error) {
      emit(LoginError(error.toString()));
    }
  }
}
