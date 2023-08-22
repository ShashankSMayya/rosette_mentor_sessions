import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:test_practice/data/models/user.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  void checkAuth() async {
    emit(AuthLoading());
    await Future.delayed(const Duration(seconds: 2));
    emit(
      Authenticated(
          user: User(
        name: 'Shashank',
      )),
    );
  }

  void login({required String username}){
    emit(Authenticated(user: User(name: username)));
  }
}
