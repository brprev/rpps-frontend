class Validators {
  Validators._();

  static String? email(String? email) {
    email ??= '';
    if (email.isEmpty) return 'Campo obrigatório';

    final regex = RegExp(
      r'^[\w-]+(\.[\w-]+)*@[a-zA-Z0-9-]+(\.[a-zA-Z0-9-]+)*(\.[a-zA-Z]{2,})$',
    );

    return regex.hasMatch(email) ? null : 'E-mail inválido';
  }

  static String? password(String? password) {
    password ??= '';

    return password.isEmpty ? 'Campo obrigatório' : null;
  }
}
