import 'package:equatable/equatable.dart';

class UserModel extends Equatable {
  const UserModel({
    required this.name,
    required this.avatarUrl,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    final firstName = json['firstName'] as String? ?? '';

    final lastName = json['lastName'] as String? ?? '';

    final fullName = '$firstName $lastName';

    return UserModel(
      name: fullName,
      avatarUrl: json['image'] as String? ?? '',
    );
  }

  final String name;
  final String avatarUrl;

  @override
  List<Object?> get props => [name, avatarUrl];
}
