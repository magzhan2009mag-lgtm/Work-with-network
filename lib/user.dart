import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
class UsersList {
  List<User>? users;
  UsersList({this.users});

  factory UsersList.fromJSON(Map<String, dynamic> json) =>
      _$UsersListFromJson(json);

  Map<String, dynamic> toJson() => _$UsersListToJson(this);
}

@JsonSerializable()
class User {
  @JsonKey()
  final String? firstName;
  final String? lastName;
  final String? avatar;

  User({this.firstName, this.lastName, this.avatar});

  factory User.fromJSON(Map<String, dynamic> json) => _$UserFromJson(json);
  Map<String, dynamic> toJson() => _$UserToJson(this);
}

Future<UsersList> getUsersList() async {
  final url = Uri.parse('https://dummyjson.com/users'); // Используем Uri.parse
  final response = await http.get(url);

  if (response.statusCode == 200) {
    return UsersList.fromJSON(jsonDecode(response.body));
  } else {
    throw Exception('Error: ${response.reasonPhrase}');
  }
}
