import 'package:easy_localization/easy_localization.dart';
import 'package:json_annotation/json_annotation.dart';

enum Gender {
  @JsonValue(1)
  male,
  @JsonValue(2)
  female
}

extension GenderExtension on Gender {
  String translate() {
    switch (this) {
      case Gender.male:
        return "male".tr();
      case Gender.female:
        return "female".tr();
    }
  }
}
