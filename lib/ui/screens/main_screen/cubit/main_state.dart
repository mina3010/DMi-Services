import 'package:DMI/core/error/failures.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'main_state.freezed.dart';

@freezed
class MainState with _$MainState {
  const factory MainState.initial() = _Initial;

  const factory MainState.success() = Success;

  const factory MainState.loading() = Loading;

  const factory MainState.noInternet([Function()? onRetry]) = NoInternet;

  const factory MainState.error([Failure? failure]) = ErrorDetails;
}

extension MainStateExtention on MainState {
  bool get isInitial => this is _Initial;

  bool get isLoading => this is Loading;

  bool get isSuccess => this is Success;

  bool get isError => this is ErrorDetails;

  bool get isNoInternet => this is NoInternet;
}
