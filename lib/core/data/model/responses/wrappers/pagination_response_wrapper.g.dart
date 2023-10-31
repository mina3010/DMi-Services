// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pagination_response_wrapper.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PaginationResponseWrapper<T> _$PaginationResponseWrapperFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) =>
    PaginationResponseWrapper<T>(
      next: json['next'] as int?,
      list: (json['list'] as List<dynamic>).map(fromJsonT).toList(),
      previous: json['previous'] as int?,
    );
