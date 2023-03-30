import 'package:json_annotation/json_annotation.dart';
import 'package:social_app/modules/models/picture.dart';

part 'category.g.dart';

@JsonSerializable()
class Category {
  @JsonKey(name: 'id', includeIfNull: false)
  final String? id;

  @JsonKey(name: 'status', includeIfNull: false)
  final int? status;

  @JsonKey(name: 'title', includeIfNull: false)
  final String? title;

  @JsonKey(name: 'description', includeIfNull: false)
  final String? description;

  @JsonKey(name: 'images', includeIfNull: false)
  final Picture? picture;

  @JsonKey(name: 'photo_counts', includeIfNull: false)
  final int? photoCounts;

  Category(
      {this.id,
      this.status,
      this.title,
      this.description,
      this.photoCounts,
      this.picture});

  factory Category.fromJson(Map<String, dynamic> json) =>
      _$CategoryFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryToJson(this);
}
