// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_error.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AppError _$AppErrorFromJson(Map<String, dynamic> json) => AppError(
      isRequestSent: json['isRequestSent'] as bool? ?? true,
      parsingError: json['parsingError'] as bool? ?? false,
      errorMessage: (json['GeneralError'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      email:
          (json['Email'] as List<dynamic>?)?.map((e) => e as String).toList(),
      fullName: (json['FullName'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      password: (json['Password'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      newPassword: (json['NewPassword'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      confirmPassword: (json['ConfirmPassword'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      phoneNumber: (json['PhoneNumber'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      title:
          (json['Title'] as List<dynamic>?)?.map((e) => e as String).toList(),
      description: (json['Description'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      lstADMIages: (json['lstADMIages'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      lstDeleteDMIages: (json['lstDeleteDMIages'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      cityId:
          (json['CityId'] as List<dynamic>?)?.map((e) => e as String).toList(),
      districtId: (json['DistrictId'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      details:
          (json['Details'] as List<dynamic>?)?.map((e) => e as String).toList(),
      userAddressId: (json['UserAddressId'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      homePage: (json['ShowInHomePage'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      boostToDate: (json['BoostToDate'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      boostFromDate: (json['BoostFromDate'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      itemBrandOrServiceFieldId:
          (json['ItemBrandOrServiceFieldId'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList(),
      itemCategoryOrServiceCategoryId:
          (json['ItemCategoryOrServiceCategoryId'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList(),
      packageId: (json['PackageId'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      subject:
          (json['Subject'] as List<dynamic>?)?.map((e) => e as String).toList(),
      message:
          (json['Message'] as List<dynamic>?)?.map((e) => e as String).toList(),
      name: (json['Name'] as List<dynamic>?)?.map((e) => e as String).toList(),
      birthDate: (json['BirthDate'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$AppErrorToJson(AppError instance) => <String, dynamic>{
      'isRequestSent': instance.isRequestSent,
      'parsingError': instance.parsingError,
      'GeneralError': instance.errorMessage,
      'Email': instance.email,
      'FullName': instance.fullName,
      'Password': instance.password,
      'NewPassword': instance.newPassword,
      'ConfirmPassword': instance.confirmPassword,
      'PhoneNumber': instance.phoneNumber,
      'Title': instance.title,
      'Description': instance.description,
      'lstADMIages': instance.lstADMIages,
      'lstDeleteDMIages': instance.lstDeleteDMIages,
      'CityId': instance.cityId,
      'DistrictId': instance.districtId,
      'Details': instance.details,
      'UserAddressId': instance.userAddressId,
      'BoostToDate': instance.boostToDate,
      'BoostFromDate': instance.boostFromDate,
      'ShowInHomePage': instance.homePage,
      'ItemBrandOrServiceFieldId': instance.itemBrandOrServiceFieldId,
      'ItemCategoryOrServiceCategoryId':
          instance.itemCategoryOrServiceCategoryId,
      'PackageId': instance.packageId,
      'Subject': instance.subject,
      'Message': instance.message,
      'Name': instance.name,
      'BirthDate': instance.birthDate,
    };
