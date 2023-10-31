import 'package:DMI/core/error/failures.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'notifications_state.freezed.dart';

@freezed
class NotificationsState with _$NotificationsState {
  const factory NotificationsState.initial() = _Initial;

  const factory NotificationsState.success() = Success;

  const factory NotificationsState.loading() = Loading;

  const factory NotificationsState.loadingResult() = LoadingResult;

  const factory NotificationsState.loadingMoreResult() = LoadingMoreResult;

  const factory NotificationsState.noMoreResult() = NoMoreResult;

  const factory NotificationsState.noInternet([Function()? onRetry]) =
      NoInternet;

  const factory NotificationsState.error([Failure? failure]) = ErrorDetails;
}

extension NotificationsStateExtention on NotificationsState {
  bool get isInitial => this is _Initial;

  bool get isLoading => this is Loading;

  bool get isLoadingResult => this is LoadingResult;

  bool get isLoadingMoreResult => this is LoadingMoreResult;

  bool get isNoMoreResult => this is NoMoreResult;

  bool get isSuccess => this is Success;

  bool get isError => this is ErrorDetails;

  bool get isNoInternet => this is NoInternet;
}
