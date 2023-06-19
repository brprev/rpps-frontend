import '../../domain/entities/account_entity.dart';

class SignInModel {
  final String name;
  final String email;
  final String token;

  SignInModel({
    required this.name,
    required this.email,
    required this.token,
  });

  factory SignInModel.fromJson(Map<String, dynamic> json) {
    return SignInModel(
      email: json['name'] ?? 'TODO',
      name: json['email'] ?? 'TODO',
      token: json['access_token'] ?? '',
    );
  }

  AccountEntity toEntity() {
    return AccountEntity(email: email, name: name, token: token);
  }
}
