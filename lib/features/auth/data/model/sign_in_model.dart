import '../../../../core/http/http_enums.dart';

class SignInModel {
  final String token;

  SignInModel({
    required this.token,
  });

  factory SignInModel.fromJson(Map<String, dynamic> json) {
    if (!json.containsKey('accessToken')) throw HttpError.invalidData;

    return SignInModel(
      token: json['access_token'] ?? '',
    );
  }
}
