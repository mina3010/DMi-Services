import 'package:DMI/core/error/failures.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'profile_state.freezed.dart';

@freezed
class ProfileState with _$ProfileState {
  const factory ProfileState.initial() = _Initial;

  const factory ProfileState.success() = Success;

  const factory ProfileState.loading() = Loading;

  const factory ProfileState.noInternet([Function()? onRetry]) = NoInternet;

  const factory ProfileState.error([Failure? failure]) = ErrorDetails;
}

extension ProfileStateExtention on ProfileState {
  bool get isInitial => this is _Initial;

  bool get isLoading => this is Loading;

  bool get isSuccess => this is Success;

  bool get isError => this is ErrorDetails;

  bool get isNoInternet => this is NoInternet;
}
