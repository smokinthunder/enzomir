import 'package:enzomir/core/common/domain/entities/user.dart';

class UserModel extends User {
  UserModel({
    required super.id,
    required super.email,
    required super.name,
    super.profileUrl,
  });
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'] ?? '',
      email: json['email'] ?? '',
      name: json['name'] ?? '',
      profileUrl: json['profileUrl'],
    );
  }
  UserModel copyWith({
    String? id,
    String? email,
    String? name,
    String? profileUrl,
  }) {
    return UserModel(
      id: id ?? this.id,
      email: email ?? this.email,
      name: name ?? this.name,
      profileUrl: profileUrl,
    );
  }
}
