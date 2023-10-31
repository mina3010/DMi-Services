import 'package:json_annotation/json_annotation.dart';

part 'pagination_response_wrapper.g.dart';

@JsonSerializable(genericArgumentFactories: true, createToJson: false)
class PaginationResponseWrapper<T> {
  final List<T> list;
  final int? next;
  final int? previous;

  PaginationResponseWrapper({
    required this.next,
    required this.list,
    required this.previous,
  });

  factory PaginationResponseWrapper.fromJson(
          Map<String, dynamic> data, T Function(Object? json) fromJsonT) =>
      _$PaginationResponseWrapperFromJson<T>(data, fromJsonT);
}
