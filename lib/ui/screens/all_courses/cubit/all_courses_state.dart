import 'package:DMI/core/error/failures.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'all_courses_state.freezed.dart';

@freezed
class AllCoursesState with _$AllCoursesState {
  const factory AllCoursesState.initial() = _Initial;

  const factory AllCoursesState.success() = Success;

  const factory AllCoursesState.loading() = Loading;

  const factory AllCoursesState.noInternet([Function()? onRetry]) = NoInternet;

  const factory AllCoursesState.error([Failure? failure]) = ErrorDetails;
}

extension AllCoursesStateExtention on AllCoursesState {
  bool get isInitial => this is _Initial;

  bool get isLoading => this is Loading;

  bool get isSuccess => this is Success;

  bool get isError => this is ErrorDetails;

  bool get isNoInternet => this is NoInternet;
}
