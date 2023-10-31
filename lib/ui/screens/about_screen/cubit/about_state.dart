import 'package:DMI/core/error/failures.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'about_state.freezed.dart';

@freezed
class AboutState with _$AboutState {
  const factory AboutState.initial() = _Initial;

  const factory AboutState.success() = Success;

  const factory AboutState.loading() = Loading;

  const factory AboutState.noInternet([Function()? onRetry]) = NoInternet;

  const factory AboutState.error([Failure? failure]) = ErrorDetails;
}

extension AboutStateExtention on AboutState {
  bool get isInitial => this is _Initial;

  bool get isLoading => this is Loading;

  bool get isSuccess => this is Success;

  bool get isError => this is ErrorDetails;

  bool get isNoInternet => this is NoInternet;
}
