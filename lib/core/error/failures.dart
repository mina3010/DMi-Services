import 'package:DMI/core/error/app_error.dart';
import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  final AppError? errors;

  const Failure(this.errors);

  @override
  List<Object> get props => [];

  bool get isServerFailure => runtimeType == ServerFailure;

  bool get isInternetFailure => runtimeType == InternetFailure;

  bool get isNoContentFailure => runtimeType == NoContentFailure;

  bool get isNotAuthorizedFailure => runtimeType == NotAuthorizedFailure;
}

class ServerFailure extends Failure {
  const ServerFailure([super.text]);
}

class CancelFailure extends Failure {
  const CancelFailure([super.errors]);
}

class InternetFailure extends Failure {
  const InternetFailure([super.errors]);
}

class NoContentFailure extends Failure {
  const NoContentFailure([super.errors]);
}

class NotAuthorizedFailure extends Failure {
  const NotAuthorizedFailure([super.errors]);
}

class UnknownFailure extends Failure {
  const UnknownFailure([super.errors]);
}

class ParsingDataFailure extends Failure {
  const ParsingDataFailure([super.errors]);
}

class AnyFailure extends Failure {
  const AnyFailure(super.errors);
}
