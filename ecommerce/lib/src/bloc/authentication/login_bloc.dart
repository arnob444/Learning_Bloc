import 'package:bloc/bloc.dart';
import 'package:ecommerce/src/data/repositiories/auth_repository.dart';
import 'package:flutter/material.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final AuthRepository repository;

  LoginBloc(this.repository) : super(LoginInitial()) {

    on<RequestGoogleLogin>((event, emit) async {
      emit(LoginLoading());
      try {
        final user = await repository.signInWithGoogle();
        debugPrint('User: ${user?.displayName}');
        emit(LoginSuccess());
      } catch (e) {
        debugPrint(e.toString());
        emit(LoginFailed(e.toString()));
      }
    });

    on<RequestFacebookLogin>((event, emit) async{
      emit(LoginLoading());
      try {
        final user = await repository.signInWithFacebook();
        debugPrint('User: ${user?.displayName}');
        emit(LoginSuccess());
      } catch (e) {
        debugPrint(e.toString());
        emit(LoginFailed(e.toString()));
      }
    });

    on<RequestTwitterLogin>((event, emit) async {
      emit(LoginLoading());
      try {
        final user = await repository.signInWithTwitter();
        debugPrint('User: ${user?.displayName}');
        emit(LoginSuccess());
      } catch (e) {
        debugPrint(e.toString());
        emit(LoginFailed(e.toString()));
      }
    });
  }
}
