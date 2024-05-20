// Package imports:
import 'package:json_annotation/json_annotation.dart';

part 'sign_in_request_model.g.dart';

@JsonSerializable()
class SignInRequestModel {
  String username;
  String password;

  SignInRequestModel({
    required this.password,
    required this.username,
  });

  /// Connect the generated [SignInRequestModel] function to the `fromJson`
  /// factory.
  factory SignInRequestModel.fromJson(Map<String, dynamic> json) =>
      _$SignInRequestModelFromJson(json);

  /// Connect the generated [SignInRequestModel] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$SignInRequestModelToJson(this);
}
