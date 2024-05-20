// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sign_in_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SignInRequestModel _$SignInRequestModelFromJson(Map<String, dynamic> json) =>
    SignInRequestModel(
      password: json['password'] as String,
      username: json['username'] as String,
    );

Map<String, dynamic> _$SignInRequestModelToJson(SignInRequestModel instance) =>
    <String, dynamic>{
      'username': instance.username,
      'password': instance.password,
    };
