import 'package:DMI/core/error/failures.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'home_state.freezed.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState.initial() = _Initial;

  const factory HomeState.success() = Success;

  const factory HomeState.loading() = Loading;

  const factory HomeState.noInternet([Function()? onRetry]) = NoInternet;

  const factory HomeState.error([Failure? failure]) = ErrorDetails;
}

extension HomeStateExtention on HomeState {
  bool get isInitial => this is _Initial;

  bool get isLoading => this is Loading;

  bool get isSuccess => this is Success;

  bool get isError => this is ErrorDetails;

  bool get isNoInternet => this is NoInternet;
}
