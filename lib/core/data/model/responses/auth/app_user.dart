import 'package:DMI/core/enums/gender.dart';
import 'package:json_annotation/json_annotation.dart';

part 'app_user.g.dart';

@JsonSerializable()
class AppUser {
  final String id;
  final String fullName;
  final String phoneNumber;
  @JsonKey(name: 'BirthDate')
  final String? birthDate;
  final String email;
  @JsonKey(name: 'mainImageURL')
  final String? imageUrl;
  final String? token;
  final bool isAuthenticated;
  final bool isBlocked;
  @JsonKey(name: 'genderId')
  final Gender? gender;

  AppUser({
    required this.id,
    required this.fullName,
    required this.phoneNumber,
    required this.email,
    required this.imageUrl,
    required this.token,
    required this.isAuthenticated,
    required this.isBlocked,
    required this.gender,
    required this.birthDate,
  });

  factory AppUser.fromJson(Map<String, dynamic> json) =>
      _$AppUserFromJson(json);

  Map<String, dynamic> toJson() => _$AppUserToJson(this);

  AppUser copyWith({
    String? fullName,
    String? phoneNumber,
    String? email,
    String? imageUrl,
    String? birthDate,
  }) {
    return AppUser(
        id: id,
        fullName: fullName ?? this.fullName,
        phoneNumber: phoneNumber ?? this.phoneNumber,
        email: email ?? this.email,
        imageUrl: imageUrl ?? this.imageUrl,
        token: token,
        isAuthenticated: isAuthenticated,
        isBlocked: isBlocked,
        gender: gender,
        birthDate: birthDate ?? this.birthDate);
  }
}
