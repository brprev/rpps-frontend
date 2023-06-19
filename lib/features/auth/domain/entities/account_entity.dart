import 'package:equatable/equatable.dart';

class AccountEntity extends Equatable {
  final String name;
  final String email;
  final String token;

  @override
  List get props => [token];

  const AccountEntity({
    required this.token,
    required this.name,
    required this.email,
  });
}
