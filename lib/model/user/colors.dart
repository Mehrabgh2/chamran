import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class Colors extends Equatable {
  List<String>? theme;
  List<String>? dataKeys;

  Colors({this.theme, this.dataKeys});

  factory Colors.fromJson(Map<String, dynamic> json) => Colors(
        theme: json["theme"] == null
            ? []
            : List<String>.from(json["theme"]!.map((x) => x)),
        dataKeys: json["dataKeys"] == null
            ? []
            : List<String>.from(json["dataKeys"]!.map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        'theme': theme,
        'dataKeys': dataKeys,
      };

  Colors copyWith({
    List<String>? theme,
    List<String>? dataKeys,
  }) {
    return Colors(
      theme: theme ?? this.theme,
      dataKeys: dataKeys ?? this.dataKeys,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [theme, dataKeys];
}
