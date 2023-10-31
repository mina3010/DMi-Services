import 'package:DMI/core/error/failures.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_state.freezed.dart';

@freezed
class LoginState with _$LoginState {
  const factory LoginState.initial() = _Initial;

  const factory LoginState.success() = Success;

  const factory LoginState.successNavigateNext(Widget screen) =
      SuccessNavigateNext;

  const factory LoginState.loading() = Loading;

  const factory LoginState.noInternet([Function()? onRetry]) = NoInternet;

  const factory LoginState.error([Failure? failure]) = ErrorDetails;
}

extension LoginStateExtention on LoginState {
  bool get isInitial => this is _Initial;

  bool get isLoading => this is Loading;

  bool get isSuccess => this is Success;

  bool get isSuccessNavigateNext => this is SuccessNavigateNext;

  bool get isError => this is ErrorDetails;

  bool get isNoInternet => this is NoInternet;
}
