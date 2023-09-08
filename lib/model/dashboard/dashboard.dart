import 'package:equatable/equatable.dart';

class Dashboard extends Equatable {
  const Dashboard({
    required this.id,
    required this.title,
  });

  final String? id;
  final String? title;

  factory Dashboard.fromJson(Map<String, dynamic> json) => Dashboard(
        id: json['id'] is Map
            ? json['id']['id'] as String?
            : json['id'] as String?,
        title: json['title'] is int
            ? json['title'].toString()
            : json['title'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
      };

  Dashboard copyWith({
    String? id,
    String? title,
  }) {
    return Dashboard(
      id: id ?? this.id,
      title: title ?? this.title,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [id, title];
}
