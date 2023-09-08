import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class Role extends Equatable {
  String? name;
  String? title;
  int? createdAt;
  int? updatedAt;

  Role({this.name, this.title, this.createdAt, this.updatedAt});

  factory Role.fromJson(Map<String, dynamic> json) => Role(
        name: json['name'] as String?,
        title: json['title'] as String?,
        createdAt: json['created_at'] as int?,
        updatedAt: json['updated_at'] as int?,
      );

  Map<String, dynamic> toJson() => {
        'name': name,
        'title': title,
        'created_at': createdAt,
        'updated_at': updatedAt,
      };

  Role copyWith({
    String? name,
    String? title,
    int? createdAt,
    int? updatedAt,
  }) {
    return Role(
      name: name ?? this.name,
      title: title ?? this.title,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [name, title, createdAt, updatedAt];
}
