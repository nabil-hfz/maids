import 'package:json_annotation/json_annotation.dart';
import 'package:maids/core/model/base_model.dart';
import 'package:maids/modules/auth/domain/entity/profile_entity.dart';

part 'profile_model.g.dart';

@JsonSerializable(explicitToJson: true, anyMap: true)
class ProfileModel extends BaseModel<ProfileEntity> {
  final int? id;
  final String? username;
  final String? email;
  final String? firstName;
  final String? lastName;
  final String? gender;
  final String? image;
  final String? token;

  const ProfileModel({
    this.id,
    this.username,
    this.email,
    this.firstName,
    this.lastName,
    this.gender,
    this.image,
    this.token,
  });

  factory ProfileModel.fromJson(Map<String, dynamic> json) =>
      _$ProfileModelFromJson(json);

  Map<String, dynamic> toJson() => _$ProfileModelToJson(this);

  @override
  ProfileEntity toEntity() {
    return ProfileEntity(
      id: id ?? -1,
      username: username ?? '',
      email: email ?? '',
      firstName: firstName ?? '',
      lastName: lastName ?? '',
      gender: gender ?? '',
      image: image ?? '',
      token: token ?? '',
    );
  }
}
