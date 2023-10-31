import 'package:DMI/core/error/failures.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'more_state.freezed.dart';

@freezed
class MoreState with _$MoreState {
  const factory MoreState.initial() = _Initial;

  const factory MoreState.success() = Success;

  const factory MoreState.loading() = Loading;

  const factory MoreState.noInternet([Function()? onRetry]) = NoInternet;

  const factory MoreState.error([Failure? failure]) = ErrorDetails;
}

extension MoreStateExtention on MoreState {
  bool get isInitial => this is _Initial;

  bool get isLoading => this is Loading;

  bool get isSuccess => this is Success;

  bool get isError => this is ErrorDetails;

  bool get isNoInternet => this is NoInternet;
}
