import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class CloudMessaging extends Equatable {
  String? token;
  String? type;
  DateTime? createdAt;

  CloudMessaging({this.token, this.type, this.createdAt});

  factory CloudMessaging.fromJson(Map<String, dynamic> json) {
    return CloudMessaging(
      token: json['token'] as String?,
      type: json['type'] as String?,
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
    );
  }

  Map<String, dynamic> toJson() => {
        'token': token,
        'type': type,
        'created_at': createdAt?.toIso8601String(),
      };

  CloudMessaging copyWith({
    String? token,
    String? type,
    DateTime? createdAt,
  }) {
    return CloudMessaging(
      token: token ?? this.token,
      type: type ?? this.type,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [token, type, createdAt];
}
