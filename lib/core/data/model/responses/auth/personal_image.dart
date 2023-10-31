import 'package:json_annotation/json_annotation.dart';

part 'personal_image.g.dart';

@JsonSerializable()
class PersonalImage {
  final int id;
  final String imageUrl;
  final bool isActive;

  PersonalImage({
    required this.id,
    required this.imageUrl,
    required this.isActive,
  });

  factory PersonalImage.fromJson(Map<String, dynamic> json) =>
      _$PersonalImageFromJson(json);

  Map<String, dynamic> toJson() => _$PersonalImageToJson(this);
}
