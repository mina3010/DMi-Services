import 'package:json_annotation/json_annotation.dart';

part 'app_error.g.dart';

@JsonSerializable()
class AppError {
  final bool isRequestSent;
  final bool parsingError;
  @JsonKey(name: 'GeneralError')
  final List<String>? errorMessage;
  @JsonKey(name: 'Email')
  final List<String>? email;
  @JsonKey(name: 'FullName')
  final List<String>? fullName;
  @JsonKey(name: 'Password')
  final List<String>? password;
  @JsonKey(name: 'NewPassword')
  final List<String>? newPassword;
  @JsonKey(name: 'ConfirmPassword')
  final List<String>? confirmPassword;
  @JsonKey(name: 'PhoneNumber')
  final List<String>? phoneNumber;
  @JsonKey(name: 'Title')
  final List<String>? title;
  @JsonKey(name: 'Description')
  final List<String>? description;
  @JsonKey(name: 'lstADMIages')
  final List<String>? lstADMIages;
  @JsonKey(name: 'lstDeleteDMIages')
  final List<String>? lstDeleteDMIages;
  @JsonKey(name: 'CityId')
  final List<String>? cityId;
  @JsonKey(name: 'DistrictId')
  final List<String>? districtId;
  @JsonKey(name: 'Details')
  final List<String>? details;
  @JsonKey(name: 'UserAddressId')
  final List<String>? userAddressId;
  @JsonKey(name: 'BoostToDate')
  final List<String>? boostToDate;
  @JsonKey(name: 'BoostFromDate')
  final List<String>? boostFromDate;
  @JsonKey(name: 'ShowInHomePage')
  final List<String>? homePage;
  @JsonKey(name: 'ItemBrandOrServiceFieldId')
  final List<String>? itemBrandOrServiceFieldId;
  @JsonKey(name: 'ItemCategoryOrServiceCategoryId')
  final List<String>? itemCategoryOrServiceCategoryId;
  @JsonKey(name: 'PackageId')
  final List<String>? packageId;
  @JsonKey(name: 'Subject')
  final List<String>? subject;
  @JsonKey(name: 'Message')
  final List<String>? message;
  @JsonKey(name: 'Name')
  final List<String>? name;
  @JsonKey(name: 'BirthDate')
  final List<String>? birthDate;

  AppError({
    this.isRequestSent = true,
    this.parsingError = false,
    this.errorMessage,
    this.email,
    this.fullName,
    this.password,
    this.newPassword,
    this.confirmPassword,
    this.phoneNumber,
    this.title,
    this.description,
    this.lstADMIages,
    this.lstDeleteDMIages,
    this.cityId,
    this.districtId,
    this.details,
    this.userAddressId,
    this.homePage,
    this.boostToDate,
    this.boostFromDate,
    this.itemBrandOrServiceFieldId,
    this.itemCategoryOrServiceCategoryId,
    this.packageId,
    this.subject,
    this.message,
    this.name,
    this.birthDate,
  });

  factory AppError.fromJson(Map<String, dynamic> json) =>
      _$AppErrorFromJson(json);

  Map<String, dynamic> toJson() => _$AppErrorToJson(this);
}
