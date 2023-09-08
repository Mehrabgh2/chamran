import 'package:equatable/equatable.dart';

import 'colors.dart';

// ignore: must_be_immutable
class Palette extends Equatable {
  String? uuid;
  String? name;
  String? logo;
  String? primaryColor;
  Colors? colors;

  Palette({
    this.uuid,
    this.name,
    this.logo,
    this.primaryColor,
    this.colors,
  });

  factory Palette.fromJson(Map<String, dynamic> json) => Palette(
        uuid: json['uuid'] as String?,
        name: json['name'] as String?,
        logo: json['logo'] as String?,
        primaryColor: json['primary_color'] as String?,
        colors: json['colors'] == null
            ? null
            : Colors.fromJson(json['colors'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'uuid': uuid,
        'name': name,
        'logo': logo,
        'primary_color': primaryColor,
        'colors': colors?.toJson(),
      };

  Palette copyWith({
    String? uuid,
    String? name,
    String? logo,
    String? primaryColor,
    Colors? colors,
  }) {
    return Palette(
      uuid: uuid ?? this.uuid,
      name: name ?? this.name,
      logo: logo ?? this.logo,
      primaryColor: primaryColor ?? this.primaryColor,
      colors: colors ?? this.colors,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [uuid, name, logo, primaryColor, colors];
}
