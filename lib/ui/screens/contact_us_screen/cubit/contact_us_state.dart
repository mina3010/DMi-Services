import 'package:DMI/core/error/failures.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'contact_us_state.freezed.dart';

@freezed
class ContactUsState with _$ContactUsState {
  const factory ContactUsState.initial() = _Initial;

  const factory ContactUsState.success() = Success;

  const factory ContactUsState.loading() = Loading;

  const factory ContactUsState.noInternet([Function()? onRetry]) = NoInternet;

  const factory ContactUsState.error([Failure? failure]) = ErrorDetails;
}

extension ContactUsStateExtention on ContactUsState {
  bool get isInitial => this is _Initial;

  bool get isLoading => this is Loading;

  bool get isSuccess => this is Success;

  bool get isError => this is ErrorDetails;

  bool get isNoInternet => this is NoInternet;
}
