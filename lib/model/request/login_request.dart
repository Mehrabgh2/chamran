import 'package:equatable/equatable.dart';

class LoginRequest extends Equatable {
  const LoginRequest({
    required this.username,
    required this.password,
  });

  final String username;
  final String password;

  Map<String, String> toJson() => {
        'username': username,
        'password': password,
      };

  LoginRequest copyWith({
    String? username,
    String? password,
  }) {
    return LoginRequest(
      username: username ?? this.username,
      password: password ?? this.password,
    );
  }

  @override
  bool get stringify => true;
  @override
  List<Object?> get props => [username, password];
}
