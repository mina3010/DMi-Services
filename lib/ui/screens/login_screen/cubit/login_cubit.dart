import 'package:DMI/ui/screens/login_screen/cubit/login_state.dart';
import 'package:DMI/ui/screens/login_screen/repository/login_repository.dart';
import 'package:DMI/ui/screens/login_screen/screens/otp_screen.dart';
import 'package:DMI/ui/screens/login_screen/screens/profile_info_screen.dart';
import 'package:DMI/ui/screens/login_screen/screens/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginCubit extends Cubit<LoginState> {
  static LoginCubit get(BuildContext context) => BlocProvider.of(context);

  // late final LoginRepository _loginRepository;

  LoginCubit({
    LoginRepository? loginRepository,
  }) : super(const LoginState.initial()) {
    // _loginRepository = loginRepository ?? GetIt.I.get<LoginRepository>();
  }

  Future login() async {
    emit(const LoginState.loading());
    await Future.delayed(const Duration(milliseconds: 300));
    emit(const LoginState.successNavigateNext(OTPScreen()));
  }

  Future otpCheck() async {
    emit(const LoginState.loading());
    await Future.delayed(const Duration(milliseconds: 300));
    emit(const LoginState.successNavigateNext(ProfileInfoScreen()));
  }

  Future<void> saveProfile() async {
    emit(const LoginState.loading());
    await Future.delayed(const Duration(milliseconds: 300));
    emit(const LoginState.successNavigateNext(WelcomeScreen()));
  }
}
