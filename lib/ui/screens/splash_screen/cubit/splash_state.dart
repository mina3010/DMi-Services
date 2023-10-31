import 'package:DMI/core/error/failures.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'splash_state.freezed.dart';

@freezed
class SplashState with _$SplashState {
  const factory SplashState.initial() = _Initial;

  const factory SplashState.successNavigateNext(Widget screen,
      [String? locale]) = SuccessNavigateNext;

  const factory SplashState.successNeedsUpdate() = SuccessNeedsUpdate;

  const factory SplashState.loading() = Loading;

  const factory SplashState.noInternet([Function()? onRetry]) = NoInternet;

  const factory SplashState.error([Failure? failure]) = ErrorDetails;
}

extension SplashStateExtention on SplashState {
  bool get isInitial => this is _Initial;

  bool get isLoading => this is Loading;

  bool get isSuccessNavigateNext => this is SuccessNavigateNext;

  bool get isSuccessNeedsUpdate => this is SuccessNeedsUpdate;

  bool get isError => this is ErrorDetails;

  bool get isNoInternet => this is NoInternet;
}
