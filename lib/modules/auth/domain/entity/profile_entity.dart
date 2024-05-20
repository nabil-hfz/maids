import 'package:maids/core/entity/base_entity.dart';

class ProfileEntity extends BaseEntity {
  final int id;
  final String username;
  final String email;
  final String firstName;
  final String lastName;
  final String gender;
  final String image;
  final String token;

  String get fullName {
    return "$firstName $lastName";
  }

  const ProfileEntity({
    required this.id,
    required this.username,
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.gender,
    required this.image,
    required this.token,
  });

  @override
  List<Object?> get props => [
        id,
        username,
        email,
        firstName,
        lastName,
        gender,
        image,
        token,
      ];

  @override
  String toString() {
    return '$ProfileEntity(${props.join(', ')})';
  }
}
