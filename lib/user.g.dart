// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UsersList _$UsersListFromJson(Map<String, dynamic> json) => UsersList(
  users: (json['users'] as List<dynamic>?)
      ?.map((e) => _$UserFromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$UsersListToJson(UsersList instance) => <String, dynamic>{
  'users': instance.users,
};

User _$UserFromJson(Map<String, dynamic> json) => User(
  firstName: json['firstName'] as String?,
  lastName: json['lastName'] as String?,
  avatar: json['image'] as String?,
);

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
  'firstName': instance.firstName,
  'lastName': instance.lastName,
  'avatar': instance.avatar,
};
