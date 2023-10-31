import 'package:json_annotation/json_annotation.dart';

part 'pagination_request.g.dart';

@JsonSerializable()
class PaginationRequest {
  @JsonKey(name: 'page')
  final int? pageNumber;

  PaginationRequest({
    this.pageNumber,
  });

  factory PaginationRequest.fromJson(Map<String, dynamic> json) =>
      _$PaginationRequestFromJson(json);

  Map<String, dynamic> toJson() => _$PaginationRequestToJson(this);

  PaginationRequest copyWith({
    int? pageNumber,
  }) {
    return PaginationRequest(
      pageNumber: pageNumber ?? this.pageNumber,
    );
  }
}
