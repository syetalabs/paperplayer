part of 'login_cubit.dart';

@immutable
abstract class LoginState {
  const LoginState();
}

class LoginInitial extends LoginState {
  const LoginInitial();
}

class LoginLoading extends LoginState {
  const LoginLoading();
}

class LoggedIn extends LoginState {
  final String userId;

  const LoggedIn(this.userId);

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is LoggedIn && o.userId == userId;
  }

  @override
  int get hashCode => userId.hashCode;
}

class LoginError extends LoginState {
  final String messege;
  const LoginError(this.messege);

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is LoginError && o.messege == messege;
  }

  @override
  int get hashCode => messege.hashCode;
}
