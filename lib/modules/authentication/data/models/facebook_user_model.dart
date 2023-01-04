import 'dart:convert';

import 'package:equatable/equatable.dart';

class FacebookUserModel extends Equatable {
  final String? name;
  final String? email;

  const FacebookUserModel({this.name, this.email});

  factory FacebookUserModel.fromMap(Map<String, dynamic> data) =>
      FacebookUserModel(
        name: data['name'] as String?,
        email: data['email'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'name': name,
        'email': email,
      };

  factory FacebookUserModel.fromJson(String data) {
    return FacebookUserModel.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  @override
  List<Object?> get props => [name, email];
}
